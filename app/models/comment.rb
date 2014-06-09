# REf: https://github.com/elasticsearch/elasticsearch-rails/pull/91
# Not yet pulled in to master!!
class Comment
  include DataMapper::Resource
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  validates_presence_of :content
  property :id, Serial
  property :content, String
  belongs_to :picture

  after :save do 
  	# Store on ES!
  end
end
