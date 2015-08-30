require 'nmatrix/nmatrix'

class NMatrix

  alias_method :internal_row, :row

  def row(row_number, get_by = :copy)
    if row_numbers = get_row_or_col_index_array(row_number)
      out = NMatrix.new [row_numbers.length, cols], default_value, dtype: dtype, stype: stype

      row_numbers.each_with_index do |rownum, i|
        out[i, 0..-1] = self[rownum, 0..-1]
      end

      out
    else
      internal_row(row_number, get_by)
    end
  end

  alias_method :internal_column, :column

  def column(col_number, get_by = :copy)
    if col_numbers = get_row_or_col_index_array(col_number)
      out = NMatrix.new [rows, col_numbers.length], default_value, dtype: dtype, stype: stype

      col_numbers.each_with_index do |colnum, i|
        out[0..-1, i] = self[0..-1, colnum]
      end

      out
    else
      internal_column(col_number, get_by)
    end
  end

  alias :col :column

private

  def get_row_or_col_index_array arg
    return unless arg.is_a?(Array) || arg.is_a?(NMatrix)
    out = arg.to_a.flatten
    out = booleans_to_indexes(out) unless out.first.is_a?(Integer)
    out
  end

  def booleans_to_indexes row_numbers
    row_numbers.map.with_index {|v, i| i if v}.compact
  end
  
end
