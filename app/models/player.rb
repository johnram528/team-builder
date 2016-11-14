class Player < ActiveRecord::Base
  belongs_to :team
  has_one :coach
  validates_presence_of :name, :age
end