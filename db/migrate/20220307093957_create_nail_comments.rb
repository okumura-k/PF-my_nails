class CreateNailComments < ActiveRecord::Migration[6.1]
  def change
    create_table :nail_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :nail_id

      t.timestamps
    end
  end
end
