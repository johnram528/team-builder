class Player < ActiveRecord::Base
  belongs_to :team
  delegate :coach, to: :team
end