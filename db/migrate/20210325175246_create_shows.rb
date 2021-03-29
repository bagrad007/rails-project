class CreateShows < ActiveRecord::Migration[6.1]
  def change
    create_table :shows do |t|
      t.string :name
      t.date :date
      t.integer :user_id
      t.integer :muppet_id

      t.timestamps
    end
  end
end
