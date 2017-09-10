class AddPictureToContents < ActiveRecord::Migration[5.1]
  def change
    add_column :contents, :picture, :string
  end
end
