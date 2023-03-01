class Chef
    def make_meat
        puts "Can make meat"
    end
    def make_salad
        puts "Can make salad"
    end
    def special_dish
        puts "Gajjar ka Halwa"
    end
end    

class ItalianChef < Chef
    def special_dish
        puts "Pasta and Sandwich"
    end
end

chef1= Chef.new
chef2= ItalianChef.new
puts "chef1"
chef1.make_meat
chef1.make_salad
chef1.special_dish
puts "\nchef2"
chef2.make_meat
chef2.make_salad
chef2.special_dish