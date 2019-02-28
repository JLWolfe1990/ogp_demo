class RemoveRefactoredFieldsFromOgps < ActiveRecord::Migration[5.2]
  def change
    remove_column(:ogps, :image_url, :text)
    remove_column(:ogps, :title, :string)
  end
end
