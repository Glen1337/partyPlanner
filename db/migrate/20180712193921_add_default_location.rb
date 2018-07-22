class AddDefaultLocation < ActiveRecord::Migration[5.2]
  def up
    change_column :parties, :location, :string, default: "unspecified"
    change_column :parties, :name, :string, limit: 50
  end
  def down
    change_column :parties, :location, :string
    change_column :parties, :name, :string
  end
end
