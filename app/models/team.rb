class Team < ActiveRecord::Base
  has_one :coach
  has_many :players
end