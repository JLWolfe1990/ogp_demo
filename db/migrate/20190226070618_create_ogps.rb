class CreateOgps < ActiveRecord::Migration[5.2]
  def change
    create_table :ogps do |t|
      t.string :path
      t.belongs_to :user, foreign_key: true
    end
  end
end
