require ('pry')

class RecipeCard
attr_reader :user, :recipe
attr_accessor :date, :rating
@@all = []

  def initialize(user, recipe, rating)
    @user = user
    @recipe = recipe
    @rating = rating
    @date = Time.now
    @@all << self
  end

  def self.all
    @@all
  end

end
