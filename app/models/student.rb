class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  validates :first_name, :last_name, presence: true
  
  has_many :student_exams
  has_many :exams, through: :student_exams
  
  has_many :student_projects
  has_many :projects, through: :student_projects

  acts_as_user :roles => [:project_manager]

  def is_project_manager?
    return (self.roles_mask & 1) == 1
  end

  def set_project_manager
    self.roles_mask = (self.roles_mask | 1)
    self.save
  end

  def unset_project_manager
    self.roles_mask = 0
    self.save
  end
    


  def full_name
    "#{first_name} #{last_name}"
  end

  def number_exams(student)
    cnt = 0
    exams.each do |e|
      if student.exams.include?(e)
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
    student = Student.where(email: data['email']).first
    unless student
        student = Student.create(first_name: data['first_name'],
          last_name: data['last_name'],
          email: data['email'],
          password: Devise.friendly_token[0,20]
        )
    end
    student
  end
  
  
end
