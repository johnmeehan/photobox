class Comment

  include DataMapper::Resource

  property :id, Serial

  property :content, String
  property :picture_id, Serial

end
