class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  validates :first_name, :last_name, presence: true
  
  has_many :user_exams
  has_many :exams, through: :user_exams
  
  has_many :user_projects
  has_many :projects, through: :user_projects

  acts_as_user :roles => [:student, :project_manager, :professor, :admin]

  def is_student?
    return (self.roles_mask1 & 1) == 1
  end

  def set_student
    self.roles_mask1 = (self.roles_mask1 | 1)
    self.save
  end

  def unset_student
    self.roles_mask1 = 0
    self.save
  end

  def is_project_manager?
    return (self.roles_mask2 & 2) == 2
  end

  def set_project_manager
    self.roles_mask2 = (self.roles_mask2 | 2)
    self.save
  end

  def unset_project_manager
    self.roles_mask2 = (self.roles_mask2 & 1)
    self.save
  end
    


  def full_name
    "#{first_name} #{last_name}"
  end

  def number_exams(user)
    cnt = 0
    exams.each do |e|
      if user.exams.include?(e)
        cnt = cnt + 1
      end
    end
    cnt
  end

  def can_subscribe_to_exam?(exam_id)
    !exams.where(id: exam_id).exists?
  end
  
  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    unless user
        user = User.create(first_name: data['first_name'],
          last_name: data['last_name'],
          email: data['email'],
          password: Devise.friendly_token[0,20]
        )
    end
    user
  end
  
  
end

