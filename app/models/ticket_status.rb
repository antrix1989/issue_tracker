class TicketStatus < ActiveRecord::Base
  attr_accessible :name
  
  # Returns the default status for new ticket.
  def self.default
    find(:first, :conditions =>["is_default=?", true])
  end
end
