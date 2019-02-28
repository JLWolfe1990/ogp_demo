class AddImageUrlToOgps < ActiveRecord::Migration[5.2]
  def change
    add_column :ogps, :image_url, :text
  end
end
