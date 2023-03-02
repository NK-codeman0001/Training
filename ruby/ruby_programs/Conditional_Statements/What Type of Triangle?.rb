=begin 
What Type of Triangle?

Create a function which returns the type of triangle, given the side lengths. Return the following values if they match the criteria.

    No sides equal: "scalene"
    Two sides equal: "isosceles"
    All sides equal: "equilateral"
    Less or more than 3 sides given: "not a triangle"

Examples

get_triangle_type([2, 6, 5]) ➞ "scalene"

get_triangle_type([4, 4, 7]) ➞ "isosceles"

get_triangle_type([8, 8, 8]) ➞ "equilateral"

get_triangle_type([3, 5, 5, 2]) ➞ "not a triangle"

Notes

    You will be given an array of positive integers.
    Check the Resources tab for more information on the types of triangles.
=end

def get_triangle_type(arr)
  if arr.length != 3
    return "not a triangle"
  elsif arr.uniq.length ==1
    return "equilateral"
  elsif arr.uniq.length ==3
    return "scalene"
  else
    return "isosceles"
  end
end

p get_triangle_type([2, 6, 5])

p get_triangle_type([4, 4, 7])

p get_triangle_type([8, 8, 8])

p get_triangle_type([3, 5, 5, 2])
