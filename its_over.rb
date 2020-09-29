require 'yaml'
require 'httparty'
require 'pry'
require 'json'

# Requires a file named .config in the main directory with :
## mapbox-pk: '<YOUR PUBLIC KEY>'

mapbox_pk = YAML.load_file(".config")

longitude = 39.9790
latitude = -76.1965 

query = 'https://api.mapbox.com/v4/mapbox.mapbox-terrain-v2/tilequery/' + longitude.to_s + ',' + latitude.to_s + '.json?layers=contour&limit=50&access_token=' + mapbox_pk["mapbox-pk"]

json = Net::HTTP.get_response(URI(query)).body

JSON.parse(json)

binding.pry
puts json
puts "done"
