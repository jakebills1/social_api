class AddRelationshipTypeToType < ActiveRecord::Migration[6.0]
  def change
    add_column :types, :relationship_type, :integer
  end
end
