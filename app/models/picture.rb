class Picture
  include DataMapper::Resource
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  property :id, Serial
  property :title, String
  property :description, Text
  mount_uploader :file, PictureUploader
  validates_presence_of :file, :title, :description
  has n, :comments, :constraint => :destroy
  
  # To have its contents included with Elasticsearch
  # include Tire::Model::Search    
  # include Tire::Model::Callbacks  #After save
end
