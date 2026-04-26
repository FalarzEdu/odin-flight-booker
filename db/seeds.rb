# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

cities = [
  { state: "PR", country: "BRA", name: "Curitiba", abbreviation: "CWB" },
  { state: "PR", country: "BRA", name: "Maringá", abbreviation: "MGF" },
  { state: "SP", country: "BRA", name: "São Paulo", abbreviation: "SAO" },
  { state: "MG", country: "BRA", name: "Belo Horizonte", abbreviation: "BHZ" },
  { state: "DF", country: "BRA", name: "Brasília", abbreviation: "BSB" }
]

cities.each do |city_details|
  City.find_or_create_by!(
    state: city_details[:state],
    country: city_details[:country],
    name: city_details[:name],
    abbreviation: city_details[:abbreviation]
  )
end

airports = [
  { code: "GRU", name: "Guarulhos", city_abbreviation: "SAO" },
  { code: "CGH", name: "Congonhas", city_abbreviation: "SAO" },
  { code: "VCP", name: "Viracopos", city_abbreviation: "SAO" },
  { code: "CWB", name: "Afonso Pena", city_abbreviation: "CWB" },
  { code: "BSB", name: "Presidente Juscelino Kubitschek", city_abbreviation: "BSB" },
  { code: "CNF", name: "Tancredo Neves", city_abbreviation: "BHZ" },
  { code: "PLU", name: "Carlos Drummond de Andrade", city_abbreviation: "BHZ" }
]

airports.each do |airport_details|
  city = City.find_by(abbreviation: airport_details[:city_abbreviation])

  Airport.find_or_create_by!(
    code: airport_details[:code],
    name: airport_details[:name],
    city_id: city[:id]
  )
end

routes = [
  { distance: 285, departure_airport_code: "CWB", arrival_airport_code: "GRU" },
  { distance: 1100, departure_airport_code: "CWB", arrival_airport_code: "BSB" },
  { distance: 42.7, departure_airport_code: "CWB", arrival_airport_code: "CNF" },
  { distance: 970, departure_airport_code: "VCP", arrival_airport_code: "BSB" },
  { distance: 575, departure_airport_code: "GRU", arrival_airport_code: "PLU" }
]

routes.each do |route_details|
  departure_airport = Airport.find_by(code: route_details[:departure_airport_code])
  arrival_airport = Airport.find_by(code: route_details[:arrival_airport_code])

  Route.find_or_create_by!(
    distance: route_details[:distance],
    departure_airport_id: departure_airport[:id],
    arrival_airport_id: arrival_airport[:id]
  )
end

flights = [
  {
    departure_datetime: DateTime.now + 10.hours,
    arrival_datetime: DateTime.now + 11.hours,
    price: 1650,
    capacity: 60,
    flight_duration: 60,
    from: "CWB",
    to: "GRU"
  },
  {
    departure_datetime: DateTime.now + 14.hours,
    arrival_datetime: DateTime.now + 15.hours + 30.minutes,
    price: 1650,
    capacity: 60,
    flight_duration: 90,
    from: "CWB",
    to: "CNF"
  },
  {
    departure_datetime: DateTime.now + 18.hours,
    arrival_datetime: DateTime.now + 19.hours + 10.minutes,
    price: 1650,
    capacity: 60,
    flight_duration: 60,
    from: "GRU",
    to: "PLU"
  }
]

flights.each do |flight_details|
  route = Route.joins("JOIN airports AS dep ON dep.id = routes.departure_airport_id")
                 .joins("JOIN airports AS arr ON arr.id = routes.arrival_airport_id")
                 .find_by!(dep: { code: flight_details[:from] }, arr: { code: flight_details[:to] })

  Flight.find_or_create_by!(
    route_id: route[:id],
    departure_datetime: flight_details[:departure_datetime],
    arrival_datetime: flight_details[:arrival_datetime],
    price: flight_details[:price],
    capacity: flight_details[:capacity],
    flight_duration: flight_details[:flight_duration]
  )
end
