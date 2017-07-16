class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :user_profile
  has_one :preference
  serialize :init_settings
  has_many :body_stats
  has_many :diet_plans
  
  before_save { self.init_settings = {:profile => true,:preferences => true}}

  def full_name
   return "#{first_name} #{last_name}".strip if(first_name || last_name)
   "Anonymous"
  end
end
