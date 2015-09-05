require 'minitest/autorun'
require_relative '../lib/nmatrix/rowcol'

class TestNMatrixRowcol < MiniTest::Test

  def test_dense
    d = NMatrix.indgen [3,3]
    # [ 
    #   [0, 1, 2]   
    #   [3, 4, 5]   
    #   [6, 7, 8] 
    # ]

    assert_equal N[ [0, 1, 2] ],              d.row(0)
    assert_equal N[ [0, 1, 2], [6, 7, 8] ],   d.row([0,2])
    assert_equal N[ [3, 4, 5], [6, 7, 8] ],   d.row(d.sum(1) > 6)

    assert_equal N[ [0], [3], [6] ],          d.col(0)
    assert_equal N[ [0, 2], [3, 5], [6, 8] ], d.col([0,2])
    assert_equal N[ [2], [5], [8] ],          d.col(d.sum(0) > 12)

    assert_equal N[ [0, 2],  [6, 8] ],        d.row([0,2]).col([0,2])

    assert_equal d.stype, d.row([0,2]).stype
    assert_equal d.dtype, d.row([0,2]).dtype
  end

  def test_sparse
    y = NMatrix.diagonal([1,2,3], stype: :yale) 
    # [ 
    #   [1, 0, 0]   
    #   [0, 2, 0]   
    #   [0, 0, 3] 
    # ]

    assert_equal N[ [1, 0, 0] ],                y.row(0)
    assert_equal N[ [1, 0, 0], [0, 0, 3] ],     y.row([0,2])
    assert_equal N[ [0, 0, 3] ],                y.row(y.sum(1) > 2)

    assert_equal N[ [1], [0], [0] ],            y.col(0)
    assert_equal N[ [1, 0], [0, 0], [0, 3]  ],  y.col([0,2])
    assert_equal N[ [0], [0], [3]  ],           y.col(y.sum(0) > 2 )

    assert_equal N[ [1, 0], [0, 3]  ],          y.row([0,2]).col([0,2])

    assert_equal y.stype, y.row([0,2]).stype
    assert_equal y.dtype, y.row([0,2]).dtype
  end

  def test_1d_row
    d = N[1,2,3,4,5]
    assert_equal N[1,3], d.row([0,2])
    assert_equal N[4,5], d.row(d > 3)
  end

  def test_1d_col
    d = N[1,2,3,4,5]
    assert_raises RangeError do
      d.col [0,2]
    end
  end

end
