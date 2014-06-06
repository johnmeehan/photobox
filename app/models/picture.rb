class Picture
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :description, Text
  mount_uploader :file, PictureUploader
  has n, :comments, :constraint => :destroy
  

  # To have its contents included with Elasticsearch
  # include Tire::Model::Search    
  # include Tire::Model::Callbacks  #After save
  
  #automatically update the index whenever the record changes
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
