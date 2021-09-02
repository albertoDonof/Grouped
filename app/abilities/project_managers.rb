Canard::Abilities.for(:project_manager) do
  includes_abilities_of :students
  can [:manage], Project
  can [:manage], UserProject
end
