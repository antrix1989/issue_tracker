class Comment < ActiveRecord::Base
  belongs_to :ticket
  attr_accessible :body, :name, :ticket, :ticket_id
  
  validates_presence_of :name, :body, :ticket_id
end
