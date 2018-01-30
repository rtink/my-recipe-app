require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
  
  def setup
    @chef = Chef.create!(chefnae: "patty", email: "patty@example.com")
    @recipe = Recipe.create(name: "vegetable sautee",
                            description: "great vegetable sautee, add veggies and oil",
                            chef: @chef)
    @recipe2 = Recipe.create(name: "fried chicken",
                            description: "great fried chicken")      
    
    @recipe2.save
  end
  
  test "should get recipes index" do
    get recipes_path
    assert_response :success
  end
  
  test "should get recipes listing" do
    get recipes_path
    assert_template 'recipes/index'
    assert_match @recipe.name, response.body
    assert_match @recipe2.name, response.body
  end
  
end
