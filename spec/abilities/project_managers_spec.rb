require 'rails_helper'
require 'cancan/matchers'

describe Canard::Abilities, '#project_managers' do
  let(:acting_project_manager) { User.create(roles: %w(project_manager)) }
  subject(:project_manager_ability) { Ability.new(acting_project_manager) }

  describe 'on Project' do
    let(:Project) { Project.create }

    it { is_expected.to be_able_to(:destroy, Project) }
  end
  # on Project
end
