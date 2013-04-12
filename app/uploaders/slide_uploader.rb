
class PhotoUploader < CarrierWave::Uploader::Base
  storage :file

  include CarrierWave::MiniMagick

  process :resize_to_fit => [800, 800]

  version :thumb do
    process :resize_to_limit => [280, nil]
  end

  version :small_thumb, :from_version => :thumb do
    process :resize_to_limit => [20, nil]
  end

end