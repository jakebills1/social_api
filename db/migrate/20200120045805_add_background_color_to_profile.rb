class AddBackgroundColorToProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :background_color, :string
  end
end
