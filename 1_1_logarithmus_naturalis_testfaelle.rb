# Testfaelle fuer die Logarithmusklasse
# Author:: Uwe Krause
# Author:: Lucas Anders

require "1_1_logarithmus_naturalis"
require "test/unit"
require 'bigdecimal'

class Log_test < Test::Unit::TestCase
  def setup

    @values_positive_float = [0.1, 0.2, 0.6, 0.9, 1.0, 1.3, 1.5, 1.9, 2.0]
    @values_negative_float = [-0.0, -1.0, -1.3, -1.5, -1.9, -2.0, -3.0]
    @values_positive_float_out_of_range = [0.0, 2.1, 2.9, 300000000.3]
    @values_positive_bigdecimal = [BigDecimal.new("0.2"), BigDecimal.new("0.6"), BigDecimal.new("1.0"), BigDecimal.new("1.3"), BigDecimal.new("1.5"), BigDecimal.new("1.9"), BigDecimal.new("2.0")]
    @values_positive_big_bigdecimal = [
      BigDecimal.new("1.0000000000000000000000034523523"),
      BigDecimal.new("1.9246347234567234534253246346731532647457345623456346736734632653")]

    @values_positive_integer = [1, 2]
    @values_negative_integer = [-1, -2, -3]
    @values_string= ["Eins", "Zwei", "1", "2"]

  end

  def test_positive_float

    @values_positive_float.each { |x|
      assert_in_delta(Math::log(x), ln(x))
    }

  end

  def test_negative_float

    @values_positive_float.each { |x|
      assert_in_delta(Math::log(x), ln(x))
    }

  end

  def test_positive_float_out_of_range

    @values_positive_float_out_of_range.each { |x|
      assert_raises RangeError do
        ln(x)
      end
    }

  end

  def test_positive_bigdecimal

    @values_positive_bigdecimal.each { |x|
      assert_in_delta(Math::log(x), ln(x))
    }

  end

  def test_positive_big_bigdecimal

    @values_positive_big_bigdecimal.each { |x|
      # funktioniert, dauert aber fuer 2 Werte 10 Sekunden, fuer 3 Werte 18 Sekunden
      assert_in_delta(Math::log(x), ln(x))
    }

  end

  def test_positive_integer

    @values_positive_integer.each { |x|
      assert_in_delta(Math::log(x), ln(x))
    }

  end

  def test_negative_integer

    @values_negative_integer.each { |x|
      assert_raises RangeError do
        ln(x)
      end
    }

  end

  def test_string

    @values_string.each { |x|
      assert_raises RangeError do
        ln(x)
      end
    }

  end

  def test_infinity

    x = 1.0 / 0.0 # => Infinity

    assert_raises RangeError do
      ln(x)
    end

  end

  def test_NaN

    x = 0.0 / 0.0 # => NaN

    assert_raises RangeError do
      ln(x)
    end

  end

end