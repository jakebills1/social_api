class AddFriendeeIdToRelationships < ActiveRecord::Migration[6.0]
  def change
    add_column :relationships, :friendee_id, :bigint, null: false
  end
end
