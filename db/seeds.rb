require 'open-uri'
require 'csv'

Ingredient.destroy_all

Cocktail.destroy_all

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(open(url).read)
ingredients["drinks"].each do |ingredient|
  i = Ingredient.create!(name: ingredient["strIngredient1"])
  puts "create #{i.name}"
end

filepath = 'db/drinks.csv'
drinks = {}
CSV.foreach(filepath, headers:true) do |row|
  drink = Drink.new()
  drink.name = row[0]
  drink.ingredientes = row[1]
  drink.metodo = row[2]
  drink.save
  puts "#{drink.name} saved on DB"
end
