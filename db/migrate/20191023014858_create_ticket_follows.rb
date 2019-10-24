class CreateTicketFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :ticket_follows do |t|
      t.integer :user_id
      t.integer :ticket_id
      t.boolean :receives_notifications, :default => true

      t.timestamps
    end
  end
end
