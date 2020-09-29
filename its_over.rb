require 'httparty'
require 'pry'
require 'json'

A_lat = 39.979059
A_lon = -76.196910

B_lat = 40.396936
B_lon = -75.3679284

def query_elevationapi(lon, lat)
  query = 'https://api.elevationapi.com/api/Elevation?lat=' + lat.to_s + '&lon=' + lon.to_s
  json = Net::HTTP.get_response(URI(query)).body
  parsed = JSON.parse(json) 
  if parsed["message"] == "OK"
    elevation = parsed["geoPoints"][0]["elevation"]
  else
    elevation = 0
    return "Error"
  end
  elevation
end

A_elevation = query_elevationapi(A_lon, A_lat)
B_elevation = query_elevationapi(B_lon, B_lat)

if A_elevation > B_elevation 
  puts "It's over, B. A has the high ground." 
elsif B_elevation < A_elevation
  puts "It's over, A. B has the high ground."
end
