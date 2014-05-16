class CreateCocktails < ActiveRecord::Migration
  def change
    create_table :cocktails do |t|
      t.string :name
      t.string :photo_url
      t.integer :like

      t.timestamps
    end
  end
end
