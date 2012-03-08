class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :messege_id
      t.integer :user_id
      t.string :content
      t.integer :subject_id
      t.string :subject_type

      t.timestamps
    end
  end
end
