class Ticket < ActiveRecord::Base
  attr_accessible :assigned_to_id, :body, :customer_email, :customer_name, :reference, :status_id, :subject
end
