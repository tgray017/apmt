class CreateUserTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tickets do |t|
      t.integer :user_id
      t.integer :ticket_id
      t.boolean :receives_notifications

      t.timestamps
    end
  end
end
