# https://github.com/elasticsearch/elasticsearch-rails/tree/master/elasticsearch-persistence
require 'elasticsearch'
Elasticsearch::Model.client = Elasticsearch::Client.new log: true
# client = Elasticsearch::Client.new log: true

