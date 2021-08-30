class UserProject < ApplicationRecord
    belongs_to :project, :dependent => :delete
    belongs_to :user
end