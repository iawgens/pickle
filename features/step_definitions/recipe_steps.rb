# example of making your own matcher with the pickle backend
Then(/^#{capture_model} should be ingredient of #{capture_model}$/) do |ingredient, recipe|
  require 'ruby-debug'
  debugger
  model(recipe).ingredients.should include(model(ingredient))
end