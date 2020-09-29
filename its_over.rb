require 'httparty'
require 'pry'
require 'json'

A_lat = 39.979059
A_lon = -76.196910

B_lat = 40.396936
B_lon = -75.3679284

def elevation(lon, lat)
  query = 'https://api.elevationapi.com/api/Elevation?lat=' + lat.to_s + '&lon=' + lon.to_s
  json = Net::HTTP.get_response(URI(query)).body
  parsed = JSON.parse(json) 
  if parsed["message"] == "OK"
    elev_return = parsed["geoPoints"][0]["elevation"]
  else
    elev_return = 0
    return "Error"
  end
  elev_return
end

def high_ground(a_elev, b_elev)
  if a_elev > b_elev
    puts "It's over, B. A has the high ground." 
  elsif a_elev < b_elev
    puts "It's over, A. B has the high ground."
  elsif a_elev == b_elev
    puts "Your footing is equal."
  else
    puts "WTF did you do! It's broken!"
  end
end


A_elevation = elevation(A_lon, A_lat)
puts A_elevation
B_elevation = elevation(B_lon, B_lat)
puts B_elevation

high_ground(A_elevation, B_elevation)
