class CreateTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :types do |t|
      t.belongs_to :relationship, null: false, foreign_key: true

      t.timestamps
    end
  end
end
