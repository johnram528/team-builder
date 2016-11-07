class Coach < ActiveRecord::Base
  has_secure_password
  validates_presence_of :name, :user_name
  validates_uniqueness_of :user_name
  belongs_to :team
  has_many :players, through: :team
end

