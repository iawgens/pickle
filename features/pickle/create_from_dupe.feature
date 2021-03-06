Feature: I can easily create models from dupe

  As a pickle user
  I want to be able to leverage my factories
  So that I can create models quickly and easily in my features
  
  Scenario: I create a recipe, and see if it looks right
    Given a recipe exists
    Then a recipe should exist
    
  Scenario: I create a recipe with specific name, and see if it looks right
    Given a recipe exists with name: "Chicken Recipe"
    Then a recipe should exist with name: "Chicken Recipe"
  
  Scenario: I create stub recipes, and see if it looks right
    Given 3 recipes exist
	  Then 3 recipes should exist
	  
	@fancy_association
	Scenario: I create some recipes, and some ingredients
	  Given a recipe: "one" exists
	  And an ingredient exists with recipe: recipe "one"
	  And another ingredient exists with recipe: recipe "one"
	  And a recipe: "two" exists
	  And an ingredient exists with recipe: recipe "two"
	  
    # TODO: GC 02/05/2010 named factory definition is not yet supported by dupe 
    # And a fancy recipe exists
    # And an ingredient exists with recipe: the fancy recipe
	  
	  Then the first ingredient should be ingredient of the recipe: "one"
	  And the 2nd ingredient should be the ingredient of recipe "one"
	  And the last ingredient should be the recipe of recipe "two"
	  
	  Then the first ingredient should be in recipe "one"'s ingredients
	  And the 2nd ingredient should be in recipe: "one"'s ingredients
	  And the last ingredient should be in recipe "two"'s ingredients
	  And recipe "two" should be the last ingredient's recipe
	  
	  But the first ingredient should not be in the fancy recipe's ingredients
	  And the last ingredient should not be in recipe "one"'s ingredients
	  And the fancy recipe should not be the first ingredient's recipe
  # Then a recipe should exist with name: "Chicken Recipe"
  # Scenario: I create some forks, and some tines
  #     Given a fork: "one" exists
  #     And a tine exists with fork: fork "one"
  #     And another tine exists with fork: fork "one"
  #     
  #     And a fancy fork exists
  #     And a tine exists with fork: the fancy fork
  #     
  #     Then the first tine should be tine of the fork: "one"
  #     And the 2nd tine should be tine of fork: "one"
  #     And the last tine should be tine of the fancy fork
  # 
  #     Then the first tine should be in fork "one"'s tines
  #     And the 2nd tine should be in fork: "one"'s tines
  #     And the last tine should be in the fancy fork's tines
  #     And the fancy fork should be the last tine's fork
  #     
  #     But the first tine should not be in the fancy fork's tines
  #     And the last tine should not be in fork "one"'s tines
  #     And the fancy fork should not be the first tine's fork
  #     
  #   Scenario: I create a fork with a tine, and find the tine by the fork
  #     Given a fork exists
  #     And a tine exists with fork: the fork
  #     
  #     Then a tine should exist with fork: the fork
  #   
  #   Scenario: create a tine with fork refs in a table
  #     Given 2 forks exist
  #     And the following tines exist:
  #       | fork         |
  #       | the 1st fork |
  #       | the 2nd fork |
  #     Then the 1st tine should be in the 1st fork's tines
  #     And the 2nd tine should be in the 2nd fork's tines
  # 
  #   Scenario: I create fork via a mapping
  #     Given killah fork exists
  #     Then the fork should be fancy
  #     And the fancy fork: "of cornwood" should be fancy