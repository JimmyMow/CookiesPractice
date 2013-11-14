class CreateGears < ActiveRecord::Migration
  def change
    create_table :gears do |t|
      t.string :name
      t.string :category
      t.integer :price
      t.string :image_url

      t.timestamps
    end
  end
end
