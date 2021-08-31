Canard::Abilities.for(:professor) do
  can [:manage], Exam
  cannot [:destroy, :create], UserExam
  cannot [:manage], Project
end
