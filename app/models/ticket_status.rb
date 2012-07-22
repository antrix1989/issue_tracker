class TicketStatus < ActiveRecord::Base
  attr_accessible :name, :is_default, :is_closed, :is_on_hold
  
  # Returns the default status for new ticket.
  def self.default
    find(:first, :conditions =>["is_default=?", true])
  end
end
