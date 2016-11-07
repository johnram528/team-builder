class Team < ActiveRecord::Base
  has_one :coach
  has_many :players
  validates_presence_of :name, :city, :mascot, :field
  def starters
    self.players.all.where(depth: 1)
  end

  def bench
    self.players.all.where(depth: 2)
  end
end