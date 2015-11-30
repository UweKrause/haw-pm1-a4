require_relative 'person_comparable'
require 'test/unit'

#Author:: Lucas Anders

class LogarithmusTest < Test::Unit::TestCase
  def setup
    @lucas = Person.new("Lucas Anders", "Hermann-Colitz-Str.", "21354", "Bleckede")
    @lucas2 = Person.new("Lucas Anders", "Hermann-Colitz-Str.", "21354", "Bleckede")
    @person1 = Person.new("Lucas Anders", "Hermann-Colitz-Str.", "21354", "Hamburg")
    @person2 = Person.new("Lucas Anders", "Hermann-Colitz-Str.", "22459", "Hamburg")
    @person3 = Person.new("Lucas Anders", "Graf-Anton-Weg", "22459", "Hamburg")
    @uwe = Person.new("Uwe Krause", "Graf-Anton-Weg", "22459","Hamburg")
    @max = Person.new("Max Mustermann", "Schlossstrasse", "10115", "Berlin")
    
  end
  
  def test_compare
    assert_equal(-1, @lucas<=>@uwe)
    assert_equal(-1, @lucas<=>@person1)
    assert_equal(-1, @person1<=>@person2)
    assert_equal(1, @person2<=>@person3)
    
    assert_equal(0, @lucas<=>@lucas2)
    
    assert_equal(1,@lucas.<=>(@uwe,2))
  end
  
  def test_compare_with_other
    assert_equal(nil, @lucas <=>Array.new())
    assert_equal(nil, @lucas <=>123)
    assert_equal(nil, @lucas <=>"test")
  end
  
  def test_sorted_set
    set = SortedSet.new([@uwe,@lucas,@max])
      ary = []
    set.each do |x|
      ary << x
    end
    assert_equal(ary, [@lucas,@max,@uwe])
  end
end