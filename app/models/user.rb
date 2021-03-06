class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum role: [:user, :vip, :admin]
  devise :database_authenticatable, :registerable, :validatable
  has_many :notes
  has_many :viewers
  has_many :readable, through: :viewers, source: :note
  
  after_initialize :set_default_role 
  
  def set_default_role
    self.role ||= :user
  end
end
