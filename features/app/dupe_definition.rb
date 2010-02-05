# Dupe definitions
require 'dupe'

Dupe.debug = true
Dupe.sequence :recipe_title do |n|
  "Recipe #{n} Title"
end

Dupe.define :recipe do |r|
  r.title do
    Dupe.next :recipe_title
  end
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
