class Band < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :name, presence: true

  has_many :albums
  has_many :tracks,
    through: :album,
    source: :tracks
  def self.all_bands
    Band.all
  end
end
