class AddImageToWindows < ActiveRecord::Migration[5.2]
  def change
    add_column :windows, :image, :string
  end
end
