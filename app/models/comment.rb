class Comment
  include DataMapper::Resource
  property :id, Serial
  property :content, String
  # property :picture_id, Serial
  belongs_to :picture
  validates_presence_of :content
end
