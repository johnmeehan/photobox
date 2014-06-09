# John Meehan 

## Features:
1. Upload a picture
2. Use the datamapper gem
3. Display a paginated list of pictures
4. Show page for each picture
5. Allow Comments on the picture#show page
6. Create Comments via Ajax
7. after save Comment store title, description & id in elasticsearch.
8. Viewing a picture there should be a "show comments" link.
9. Link loads comments via ajax from elasticsearch and display them.

## Main parts:
Elasticsearch, Datamapper, Carrierwave, Rails, Rspec, Capybara,Haml

## Notes: 
  Datamapper no longer activly developed.
  Warnings running rspec due to Deprications in datamapper

## Setup
    
` bundle install `

### Elasticsearch
Version: 1.2.1, Build: 6c95b75/2014-06-03T15:02:52Z, JVM: 1.7.0_60

To run in the foreground: ` elasticsearch path.conf=/usr/local/Cellar/elasticsearch/1.2.1/config/ `

Import all indices from `app/models` (or use DIR environment variable).
````    
$ rake environment elasticsearch:import:all DIR=app/models
````

# Todo
### Save Comments to ES:
I plan to move the Comments from using datamapper to use just Elasticsearch for persistance.

Possibly using Tire as elasticsearch-persistance doesn't seem to be up to speed yet. 


### Show comment link on show page:
Jquery ajax call on click to retrieve comments from Elasticsearch.
Loaded then by ajax on the browser.