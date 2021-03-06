class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable        
  devise :database_authenticatable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  
  has_many :tickets, :foreign_key => "assigned_to_id"
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
  def self.current=(user)
    @current_user = user
  end

  def self.current
    @current_user
  end
end
