# Based on the scenario in the book Bad Choices by Ali Almossawi

# The methods below deal with sock piles, in real life they would be known as arrays
def inefficient_sort(sock_pile)
  sorted_socks = []
   until sock_pile == sock_pile.uniq
     match = Array(sock_pile.pop)
     sock2 = sock_pile.find do |sock|
       sock == match[0]
     end
     match << sock2
     sorted_socks << match
   end
   sorted_socks
end

def efficient_sort(sock_pile)
  sorted_socks = []
  unsorted_socks = []
  until sock_pile.size == 0
   sock1 = sock_pile.pop
   sock2 = unsorted_socks.find {|sock| sock == sock1}
   if sock2
     sorted_socks << [sock1, sock2]
   else
     unsorted_socks << sock1
   end
  end
  sorted_socks
end
