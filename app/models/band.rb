class Band < ActiveRecord::Base
  validates :name, uniqueness: true
  
  has_many :albums
  has_many :tracks,
    through: :album,
    source: :tracks

end
