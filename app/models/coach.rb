class Coach < ActiveRecord::Base
  has_secure_password

  belongs_to :team
  has_many :players, through: :team
end

