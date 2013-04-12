class Photo < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :album
  mount_uploader :file, PhotoUploader
  after_create :set_ancestor_photo

  def set_ancestor_photo
    photo_path = self.file.current_path
    
    album = self.album
    user = self.album.user

    album.file.store!(File.open(photo_path))
    user.file.store!(File.open(photo_path))
    
    album.save!
    user.save!

  end
end
