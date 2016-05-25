class ImageUploader < CarrierWave::Uploader::Base
  storage :file

  def move_to_cache
    true
  end

  def move_to_store
    true
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def store_dir
    "uploads/#{model.id}"
  end

  def cache_dir
    "tmp/#{model.id}"
  end
end