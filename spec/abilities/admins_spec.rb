require 'rails_helper'
require 'cancan/matchers'

describe Canard::Abilities, '#admins' do
  let(:acting_admin) { User.create(roles: %w(admin)) }
  subject(:admin_ability) { Ability.new(acting_admin) }

  describe 'on All' do
    let(:all) { All.create }

    it { is_expected.to be_able_to(:manage, all) }
  end
  # on All
end
