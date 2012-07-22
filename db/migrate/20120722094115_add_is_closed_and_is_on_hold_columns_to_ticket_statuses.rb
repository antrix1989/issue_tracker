class AddIsClosedAndIsOnHoldColumnsToTicketStatuses < ActiveRecord::Migration
  def change
    add_column :ticket_statuses, :is_closed, :boolean, :null => false, :default => 0
    add_column :ticket_statuses, :is_on_hold, :boolean, :null => false, :default => 0
  end
end
