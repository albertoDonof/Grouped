class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :registration_number, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
  has_many :student_exams
  has_many :exams, through: :student_exams

  def full_name
    "#{first_name} #{last_name}"
  end

  def can_subscribe_to_exam?(exam_id)
    !exams.where(id: exam_id).exists?
  end
end
