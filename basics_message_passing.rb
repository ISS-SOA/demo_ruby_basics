'soumya'.capitalize
'soumya'.send(:capitalize)

arr = ['this', 'small', 'array']
arr.join(' ')
arr.send(:join, ' ')

12 + 3
12.+(3)
12.send(:+, 3)

arr = [10, 42, 63]
arr[1]
arr.[](1)
arr.send(:[], 1)
