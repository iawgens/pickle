# Dupe definitions
require 'dupe'

Dupe.debug = true
Dupe.sequence :recipe_title do |n|
  "Recipe #{n} Title"
end

Dupe.define :recipe do |recipe|
  recipe.title do
    Dupe.next :recipe_title
  end
  
  recipe.ingredients do |ingredients|
    ingredients.split(', ').map do |ingredient|
      Dupe.find(:ingredient) do |i|
        i.label == labelize(ingredient)
      end
    end
  end
  
  recipe.after_create do |r|
    r.label = labelize(r.title)
  end
end

# Dupe.define :fancy_recipe, :class => Recipe do |t|
#   t.name {"Fancy " + Dupe.next(:reipe_title)}
# end

Dupe.define :ingredient do |i|
  i.uniquify :name
end

def labelize(name)
  name.gsub(/\s/,'-').downcase
end
# Factory.sequence :fork_name do |n|
#   "fork %d04" % n
# end
# 
# Factory.define :fork do |f|
#   f.name { Factory.next(:fork_name) }
# end
# 
# Factory.define :tine do |t|
#   t.association :fork
# end
# 
# Factory.define :rusty_tine, :class => Tine do |t|
#   t.association :fork
#   t.rusty true
# end
# 
# Factory.define :fancy_fork, :class => Fork do |t|
#   t.name { "Fancy " + Factory.next(:fork_name) }
# end
