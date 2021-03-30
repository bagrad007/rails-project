class CreateMuppetShows < ActiveRecord::Migration[6.1]
  def change
    create_table :muppet_shows do |t|
      t.string :job
      t.integer :muppet_id
      t.integer :show_id
      t.timestamps
    end
  end
end
