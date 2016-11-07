class Player < ActiveRecord::Base
  belongs_to :team
  delegate :coach, to: :team
  validates_presence_of :name, :age
end