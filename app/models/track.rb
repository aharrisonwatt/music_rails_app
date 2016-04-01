class Track < ActiveRecord::Base
  validates :name, :track_type, :album_id, presence: true

  belongs_to :Album

end
