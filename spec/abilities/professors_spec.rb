require 'rails_helper'
require 'cancan/matchers'

describe Canard::Abilities, '#professors' do
  let(:acting_professor) { User.create(roles: %w(professor)) }
  subject(:professor_ability) { Ability.new(acting_professor) }

  describe 'on Exam' do
    let(:exam) { Exam.create }

    it { is_expected.to be_able_to(:manage, exam) }
  end
  # on Exam
end
