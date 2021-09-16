require 'rails_helper'

RSpec.describe Project, type: :model do
  User.delete_all
  Project.delete_all

end
