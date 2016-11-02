class Coach < ActiveRecord::Base
  has_secure_password

  belongs_to :team
  has_many :players, through: :team
end

# class Player < ActiveRecord::Base
#   belongs_to :team
#   delegate :coach, :team
# end

# class Team < ActiveRecord::Base
#   has_one :coach
#   has_many :players
# end