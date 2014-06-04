class Picture

  include DataMapper::Resource

  property :id, Serial

  property :title, String
  property :description, Text

  mount_uploader :image, PictureUploader

end
