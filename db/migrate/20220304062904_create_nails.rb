class CreateNails < ActiveRecord::Migration[6.1]
  def change
    create_table :nails do |t|
      t.integer :nail_id
      t.integer :user_id
      t.text :introduction
      t.string :nail_image_id

      t.timestamps
    end
  end
end
