class Avatar
  include Mongoid::Document

  mount_uploader :source, ImageUploader

  field :alt, type: String

  belongs_to :product

end
