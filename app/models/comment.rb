# REF: https://github.com/elasticsearch/elasticsearch-ruby/tree/master/elasticsearch-api
require 'hashie'

class Comment
  include DataMapper::Resource
  include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks

  validates_presence_of :content
  property :id, Serial
  property :content, String
  belongs_to :picture

  after :save do 
  	index_comment
  end

  def client
    Elasticsearch::Model.client
  end

  def index_comment
  	client.index  index: 'comments',
  					 type: 'comment', 
  					 id: self.id, 
  					 body: picture.to_json
  end
  def self.picture_comments(picture_id)
  	response = __elasticsearch__.search index: 'comments',
  							 	type: 'comment', 
  							 	body: {
  							 		query: { match: {id: picture_id } } 
  							 	}
    response.records
  end
end

