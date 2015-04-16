#!/usr/bin/env ruby

require_relative 'lib/linked_list'

payloads = ARGV # ARGV holds the command line arguments that were passed in

# Now, build a LinkedList
ll = LinkedList.new

# And, populate it
#
# <YOUR CODE GOES HERE>

payloads.each do |payload|
  ll.push payload
end

# Then, print it out
#
# <YOUR CODE GOES HERE>

print "* -> "
payloads.size.times do |i|
print "#{ll.get(i).inspect} -> "
end
print "nil"
