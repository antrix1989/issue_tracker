class Ticket < ActiveRecord::Base
  attr_accessible :assigned_to_id, :body, :customer_email, :customer_name, :reference, :status_id, :subject
  
  validates :customer_name, :customer_email, :subject, :body, :presence => true
  
  after_save :assign_reference
  
  private
    def assign_reference
      self.update_column(:reference, "UKR-%06d" % self.id)
    end
end
