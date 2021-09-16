Canard::Abilities.for(:admin) do
  can [:manage], Exam
  can [:manage], Project
  can [:manage], User

end
