class CreateArticles < ActiveRecord::Migration
  def change
    
    create_table :articles do |t|
      t.string :title
      t.integer :user_id
      t.string :content

      t.timestamps
    end
  end
end
