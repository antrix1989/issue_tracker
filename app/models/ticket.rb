class Ticket < ActiveRecord::Base
  attr_accessible :assigned_to_id, :body, :customer_email, :customer_name, :reference, :status_id, :subject
  
  validates :customer_name, :customer_email, :subject, :body, :presence => true
  
  after_create :assign_reference, :send_mail
  after_update :save_comment
  
  belongs_to :status, :class_name => 'TicketStatus', :foreign_key => 'status_id'
  belongs_to :user, :foreign_key => "assigned_to_id"
  has_many :comments, :dependent => :destroy
  
  def current_user=(current_user)
    @current_user = current_user
  end
  
  def current_user
    @current_user
  end
  
  def self.search(search_condition)
    find(:all, :conditions => ['subject LIKE ?', "%#{search_condition}%"])
  end
  
  private
  def assign_reference
    self.update_column(:reference, "UKR-%06d" % self.id)
  end
  
  def send_mail
    Notifier.ticket_created(self).deliver
  end
  
  def save_comment
    if self.current_user.nil?
      return
    end
    
    if self.status_id_changed? || self.assigned_to_id_changed?
      body = Array.new
      
      if self.status_id_changed?
        body.push("Status changed to #{self.status.name}")
      end
      
      if self.assigned_to_id_changed?
        if self.user.nil?
          body.push("Assignee deleted")
        else
          body.push("Assignee changed to #{self.user.full_name}")
        end
      end
      
      @comment = Comment.new
      @comment.name = self.current_user.full_name
      @comment.body = body.join(". ")
      @comment.ticket = self
      @comment.current_user = self.current_user
      @comment.save
    end
  end
end
