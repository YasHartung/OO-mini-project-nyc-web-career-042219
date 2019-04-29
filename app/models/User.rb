class User
attr_reader :name


@@all =[]

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def my_rc
    RecipeCard.all.select do |rc|
      rc.user == self
    end
  end

  def recipes
    my_rc.map do |rc|
      rc.recipe
    end
  end

  def add_recipe_card(recipe, rating)
    RecipeCard.new(self, recipe, rating)
  end

  def top_three_recipes
    my_rc.sort_by do |rc| rc.rating
    end.last(3).reverse
  end

  def most_recent_recipe
    my_rc.sort_by do |rc| rc.date
    end.last
  end

  def declare_allergy(ingredient)
    Allergy.new(self, ingredient)
  end

  def allergens
    Allergy.all.select do |allergy|
      allergy.user == self
    end.map do |my_allergies|
      my_allergies.ingredient
    end
  end

  def safe_recipes
    Recipe.all.select do |recipe|
       (recipe.ingredients & self.allergens).length == 0
    end 
  end

end
