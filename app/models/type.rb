class Type < ApplicationRecord
  belongs_to :relationship
  enum relationship_type: [:friends, :blocked, :following]
end
