
5.times do |name|
  User.create(:name=>"johny#{name}")
end


u = User.first
u.albums.create(:name=>"jtest")
u = User.last
u.albums.create(:name=>"jtest")

PhotoUploader.enable_processing = true
20.times do |name|
  p = u.albums.first.photos.new
  p.file.store!(File.open(File.join(APP_ROOT,"db","data","cat.jpg")))
  p.save
end

