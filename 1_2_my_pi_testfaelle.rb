# Testfaelle fuer die Bailey-Borwein-Plouffe-Formel fuer PI
# Author:: Uwe Krause
# Author:: Lucas Anders

require "1_2_my_pi"
require "test/unit"

class UnittestPi < Test::Unit::TestCase
  # Bereitet die Pi-Klasse vor
  def setup
    @my_pi = MyPi.new()
    @pi = Math::PI.to_s

  end

  # Testet Werte innerhalb des erlaubten Bereiches
  def test_positive
    # Das, was uns Ruby als "pi" bereitstellt
    # hier zum String konvertiert, um besser auf die [n-te] Nachkommastelle zugreifen zu koennen

    # vergleicht die 15-1 Nachkommastellen, die Math::PI liefert mit unserer Methode
    # -1, um Rundungsungenauuigkeiten bei Math::PI zu umgehen
    # (tritt in diesem Beispiel nicht auf)
    for i in 1..14
      assert_equal(@pi[i+1].to_i, @my_pi.get_n_digit_of_pi(i))
    end

  end

  # Testet auf Nachkommastellen der Bineardarstellung von PI
  def test_postive_dual
    # 3.141592653589793

    # 5te Nachkommastelle = 9 (Binaer: "1001")
    assert_equal("1", @my_pi.get_n_digit_of_pi_dual(5))

  end

  # Testet, ob negative Nachkommastelle einen Fehler ausgibt
  def test_negative_values
    assert_raises RangeError do
      @my_pi.get_n_digit_of_pi(-1)
    end
  end

  # Testet, ob fehlerhafte Nachkommastellen einen Fehler ausgeben
  def test_float_values
    assert_raises RangeError do
      @my_pi.get_n_digit_of_pi(1.2)
    end
  end

  # Testet, ob Strings einen Fehler ausgibt
  def test_string_values
    assert_raises RangeError do
      @my_pi.get_n_digit_of_pi("1")
    end
  end

end