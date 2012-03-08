class AddSenderToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :send_id, :integer

  end
end
