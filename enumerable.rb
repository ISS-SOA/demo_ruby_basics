arr = [2,3,1,6,4,9]

arr.each { |n| puts "number #{n}" }
arr.select { |n| n.odd? }
arr.map { |n| n * 2 }
arr.reduce { |n1, n2| "#{n1} - #{n2}" }
