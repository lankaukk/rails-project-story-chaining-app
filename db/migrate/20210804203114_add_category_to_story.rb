class AddCategoryToStory < ActiveRecord::Migration[6.1]
  def change
    add_column :stories, :category_id, :integer
  end
end
