require_relative '../config/environment.rb'

sam = User.new("Sam")
oscar = User.new("Oscar")
lucy = User.new("Lucy")

lasgna = Recipe.new("Lasgna")
soup = Recipe.new("Soup")
salad = Recipe.new("Salad")

sam_soup = RecipeCard.new(sam, soup, 10)
oscar_soup = RecipeCard.new(oscar, soup, 3)
lucy_lasgna = RecipeCard.new(lucy, lasgna, 6)
lucy_soup = lucy.add_recipe_card(soup, 8)

carrot = Ingredient.new("Carrot")
broth = Ingredient.new("Broth")
onion = Ingredient.new("Onion")
garlic = Ingredient.new("Garlic")

carrot_soup = RecipeIngredient.new(soup, carrot)
broth_soup = RecipeIngredient.new(soup, broth)
carrot_lasgna = RecipeIngredient.new(lasgna, carrot)
salad_onion = RecipeIngredient.new(salad, onion)

oscar.declare_allergy(carrot)
oscar.declare_allergy(garlic)
lucy.declare_allergy(garlic)




binding.pry
