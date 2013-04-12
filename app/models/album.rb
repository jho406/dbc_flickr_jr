class Album < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  mount_uploader :file, PhotoUploader
  after_create :set_default_image

  def set_default_image
    self.file.store!(File.open(File.join(APP_ROOT,"db","data","blank_album.jpg")))
    self.save
  end
  # Remember to create a migration!
end
