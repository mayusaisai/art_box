class CreateArts < ActiveRecord::Migration[6.0]
  def change
    create_table :arts do |t|
      t.text :content
      t.integer :grate
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end
end
