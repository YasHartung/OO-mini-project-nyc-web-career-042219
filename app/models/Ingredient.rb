class Ingredient
attr_reader :name
@@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    self.all.sort_by do |ingredient|
      Allergy.all.select do |allergy|
        allergy.ingredient == ingredient
      end.length
    end.last
  end

  
end
