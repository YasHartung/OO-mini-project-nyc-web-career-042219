class Recipe
attr_reader :name

@@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    self.all.sort_by do |recipe|
      RecipeCard.all.select do |rc|
        rc.recipe == recipe
      end.length
    end.reverse.first
  end

  def my_rc
    RecipeCard.all.select do |rc|
      rc.recipe == self
    end
  end

  def users
    my_rc.map do |rc_recipe|
      rc_recipe.user
    end
  end

  def ingredients
    RecipeIngredient.all.select do |ri|
      ri.recipe == self
    end.map do |my_ri|
      my_ri.ingredient
    end
  end

  def add_ingredients(arr)
    arr.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end
  end

  def allergens
    self.ingredients & Allergy.all.map {|allergy| allergy.ingredient}
  end

end
