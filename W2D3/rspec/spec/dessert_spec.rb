require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  let(:dessert) { Dessert.new("ice cream cake", 20, chef) }
  
  describe "#initialize" do

    it "sets a type" do 
      expect(dessert.type).to_not equal(nil)
    end
    it "sets a quantity" do 
      expect(dessert.quantity).to eq(20)
    end 

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end 

    it "raises an argument error when given a non-integer quantity" do
      expect{ Dessert.new("pastry", "a", chef)}.to raise_error(ArgumentError) 
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do 
      dessert.add_ingredient("ice cream")
      expect(dessert.ingredients).to include("ice cream")
    end 
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do 
      8.times {|i| dessert.add_ingredient("ingredient_" + i.to_s)}
      expect(dessert.mix!).to_not equal(dessert.ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do 
      dessert.eat(5)
      expect(dessert.quantity).to eq(15)
    end

    it "raises an error if the amount is greater than the quantity" do 
      expect(dessert.eat(30)).to raise_error("not enough left!")
    end  
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" 
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
  end
end
