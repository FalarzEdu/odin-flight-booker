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
