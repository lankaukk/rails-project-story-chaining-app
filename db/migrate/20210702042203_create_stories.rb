class CreateStories < ActiveRecord::Migration[6.1]
  def change
    create_table :stories do |t|
      t.string :hook
      t.integer :user_id
      t.string :contributions
    

      t.timestamps
    end
  end
end
