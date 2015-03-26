# -*- encoding : utf-8 -*-
class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fit: [50, 50]
  end

  version :regular do
    process resize_to_fit: [150, 150]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end