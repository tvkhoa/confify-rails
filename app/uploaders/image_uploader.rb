# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

 # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :fog


  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # def cache_dir
  #   "#{Rails.root}/tmp/testcarrierwave"
  # end

  

  version :tiny_thumb do
    process :resize_to_fit => [50, 10000]
  end

  version :thumb do
    process :resize_to_fit => [200, 10000]
  end


  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  # By default, CarrierWave copies an uploaded file twice, first copying the file into the cache, 
  # then copying the file into the store. 
  # For large files, this can be prohibitively time consuming.
  def move_to_cache
    true
  end

  def move_to_store
    true
  end


end
