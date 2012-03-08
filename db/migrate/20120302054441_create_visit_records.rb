class CreateVisitRecords < ActiveRecord::Migration
  def change
    create_table :visit_records do |t|
      t.integer :user_id
      t.integer :visit_id

      t.timestamps
    end
  end
end
