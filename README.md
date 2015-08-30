NMatrix rowcol extension
===

```ruby
require 'nmatrix/rowcol'

m = NMatrix.indgen [3,3]
# [ [0, 1, 2]   
#   [3, 4, 5]   
#   [6, 7, 8] ]

m.row [0,2]             
# [ [0, 1, 2]   
#   [6, 7, 8] ]

m.row m.sum(1) > 6      
# [ [3, 4, 5]   
#   [6, 7, 8] ]

m.col [0,2]             
# [ [0, 2]   
#   [3, 5]   
#   [6, 8] ]

m.col m.sum(0) > 12     
# [ [2]   
#   [5]   
#   [8] ]

m.row([0,2]).col([0,2]) 
# [ [0, 2]   
#   [6, 8] ]
```