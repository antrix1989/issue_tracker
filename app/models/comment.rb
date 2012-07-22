class Comment < ActiveRecord::Base
  belongs_to :ticket
  attr_accessible :body, :name, :ticket, :ticket_id
  
  validates_presence_of :name, :body, :ticket_id
  
  after_create :send_mail
  
  def current_user=(current_user)
    @current_user = current_user
  end
  
  def current_user
    @current_user
  end
  
  private
  def send_mail
    if self.current_user.nil?
      return
    end
    
    Notifier.ticket_updated(self).deliver
  end
  
end
