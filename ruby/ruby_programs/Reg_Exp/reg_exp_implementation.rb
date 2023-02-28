line1 = "Cats are smarter than dogs";
line2 = "Dogs also like meat";

if ( line1 =~ /dog(.*)/ )
   puts "Line1 contains Cats"
end
if ( line2 =~ /cat(.*)/ )
   puts "Line2 contains  Dogs"
end