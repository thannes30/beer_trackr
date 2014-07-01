class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.string :type
      t.string :size
      t.integer :price
      t.references :store #t.integer for store_id

      t.timestamps
    end
  end
end
