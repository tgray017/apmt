class CreateTicketStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :ticket_statuses do |t|
      t.integer :ticket_id
      t.integer :status_id
      t.boolean :notify_group

      t.timestamps
    end
  end
end
