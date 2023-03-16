=begin 
24. Write a function which takes square matrix mat, return the sum of the matrix diagonals.
Only include the sum of all the elements on the primary diagonal and all the elements on the secondary diagonal that are not part of the primary diagonal.
=end

def diagonal_sum(mat)
  sum=0
  n=mat.length
  for i in 0...n
    sum += mat[i][i] + mat[i][n-i-1]
    if i==(n-i-1)
      sum -= mat[i][i]
    end
  end
  return sum
end

p diagonal_sum([[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]]) # 8
p diagonal_sum([[5]]) # 5