class AddUserToAppearances < ActiveRecord::Migration[5.0]
  def change
    add_column :appearances, :user, :string
  end
end
