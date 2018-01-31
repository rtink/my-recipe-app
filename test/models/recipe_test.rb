require "test_helper"

class RecipeTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.create!(chefname: "patty", email: "patty@example.com",
                          password: "password", password_confirmation: "password")
    @recipe = @chef.recipes.build(name: "vegetable", description: "great vegetable recipe")
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "description should be present" do
    @recipe.description = " "
    assert_not @recipe.valid?
  end
  
  test "description shouldn't be less than 4 chars" do
    @recipe.description = "a" * 3
    assert_not @recipe.valid?
  end
  
  test "description shouldn't be more than 500 chars" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end
  
  test "recipe without chef should be invalid" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
end