class Comment < ActiveRecord::Base
  belongs_to :ticket
  attr_accessible :body, :name, :ticket, :ticket_id, :current_user
  
  validates_presence_of :name, :body, :ticket_id
  
  after_create :send_mail
  
  private
  def send_mail
    if User.current.nil?
      return
    end
    
    Notifier.ticket_updated(self).deliver
  end
  
end
