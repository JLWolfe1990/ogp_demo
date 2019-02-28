class AddTitleToOgps < ActiveRecord::Migration[5.2]
  def change
    add_column(:ogps, :title, :string)
    add_index(:ogps, :title)
  end
end
