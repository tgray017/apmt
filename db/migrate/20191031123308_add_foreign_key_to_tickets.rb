class AddForeignKeyToTickets < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :tickets, :assignee
    add_foreign_key :tickets, :creator
  end
end
