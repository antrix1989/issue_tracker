class AddIsDefaultToTicketStatuses < ActiveRecord::Migration
  def change
    add_column :ticket_statuses, :is_default, :boolean, :null => false, :default => 0
  end
end
