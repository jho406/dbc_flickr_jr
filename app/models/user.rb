class User < ActiveRecord::Base
  has_many :albums
  has_many :photos, :through=>:albums
  mount_uploader :file, PhotoUploader

  after_create :create_default_album, :set_default_image

  def create_default_album
    self.albums.create(:name=>"My Album")
  end

  def set_default_image
    self.file.store!(File.open(File.join(APP_ROOT,"db","data","blank_user.jpg")))
    self.save
  end


  # validates :password, 
  #             :confirmation => true, 
  #             :length => { :minimum => 6 }

  # validates :email, 
  #             :uniqueness => true, 
  #             :presence => true,
  #             :format=> { :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/}
  
  # validates :name, :presence => true
  

  # def self.authenticate(email, secret)
  #   user = find_by_email(email)
  #   return nil unless user
  #   user.password == secret ? user : nil
  # end

  # def password
  #   @password ||= Password.new(self.password_hash)
  # end

  # def password=(secret)
  #   @password = Password.create(secret)
  #   self.password_hash = @password
  # end


end
