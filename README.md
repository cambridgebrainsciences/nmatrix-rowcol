NMatrix row/col extension
===

Arbitrary row/column selection for [NMatrix](https://github.com/SciRuby/nmatrix). Allows you to do selections like:

```
x.col([0,2]).row(y =~ 'setosa')
```

Works with dense and sparse matrix types.


Install
---
```
gem install nmatrix-rowcol
```


Usage
---

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

m.col [2,0,1] # re-arrange columns
# [ [2, 0, 1]   
#   [5, 3, 4]   
#   [8, 6, 7] ]

m.row m.rows.times.to_a.sample(2) # random row samples
# [ [6, 7, 8]   
#   [0, 1, 2] ]
```

License
---
MIT