class Relationship < ApplicationRecord
  belongs_to :user
  has_one :type 
end
