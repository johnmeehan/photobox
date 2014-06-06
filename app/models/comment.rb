class Comment
  include DataMapper::Resource
  property :id, Serial
  property :content, String
  # property :picture_id, Serial
  belongs_to :picture
  validates_presence_of :content

  # To have its contents included with Elasticsearch
  # include Tire::Model::Search
  # include Tire::Model::Callbacks
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
