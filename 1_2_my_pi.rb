# Bailey-Borwein-Plouffe-Formel fuer PI
# Author:: Uwe Krause
# Author:: Lucas Anders

require 'bigdecimal'

class MyPi
  def initialize()

    # Aus der Aufgabe 1.2.2 wissen wir (/glauben wir zu wisssen), wie oft die Formel durchlaufen werden muss, um zur gleichen Genauigkeit zu kommen, wie Math::PI
    # Genauigkeit NICHT Anzahl der Nachkommastellen!

    #@genauigkeit = praezisionstest()
    @genauigkeit = 5000

    @my_pi = my_pi(@genauigkeit)
  end

  def my_pi(n = @genauigkeit)
    # Public Methode, faengt fehlerhafte Uebergabewerte ab

    # erstmal paar Fehler werfen
    raise RangeError unless n.is_a? Integer
    raise RangeError if n <= 0

    my_pi_iterativ(n)
  end

  # Aufgabe 1.2.1 - Implementierung der Bailey-Borwein-Plouffe-Formel
  def my_pi_iterativ(n = @genauigkeit)
    # Sanity-checks in my_pi()

    # Bis zur wievielten nachkommastelle stimmts denn?
    
    #wert = BigDecimal.new("0.0")
    wert = 0.0

    n.times do |i|
      k = i.to_f
      wert += (1.0/(16**k)) * ((4/(8*k+1)) - (2/(8*k+4)) - (1/(8*k+5)) - (1/(8*k+6)))
    end
    wert
  end

  # Aufgabe 1.2.1 - Praezisionstest
  def praezisionstest()
    # Pruefe die Rueckgabewerte der Implementierung gegen die Vorgabe von Math::PI
    # solange bis ausreichende Genauigkeit erreicht ist
    # Genauigkeit NICHT Anzahl der Nachkommastellen!

    for x in (1..77) do
      pi_errechnet = my_pi_iterativ(x)
      if Math::PI - pi_errechnet == 0.0
        return x
      end
    end

    # Falls die Schleife nicht innerhalb der definierten Anzahl von Aufrufen zu einem Ergebnis kommen sollte
    # Kommt in diesem Beispiel nicht vor
    raise StopIteration

  end

  # Aufgabe 1.2.2 - n-te Nachkommastelle von pi
  def get_n_digit_of_pi(n)
    # erstmal paar Fehler werfen, wenn wir kein Integer bekommen
    raise RangeError unless n.is_a? Integer
    raise RangeError if n <= 0

    # Zum definieren anstaendiger Testfaelle nutze ersteinmal pseudo-methode
    # get_n_digit_of_pi_hardcoded(n)

    my_get_n_digit_of_pi(n)

  end

  def my_get_n_digit_of_pi(n)
    # Sanitary checks in aufrufender Methode

    my_pi = self.my_pi(n)

    multipliziere_mit_faktor = my_pi * 10**(n-1)
    # beste(?) Methode, um den ganzzahligen Teil abzuschneiden: % 1
    abschneiden = multipliziere_mit_faktor % 1
    multipliziere = abschneiden * 10
    # beste(?) Methode um Nachkommastellen zu entfernen: to_i
    multipliziere.to_i

  end

  def get_n_digit_of_pi_dual(n)
    # liefert die (n-te Nachkommastelle von my_pi) in binaerdarstellung zurueck

    get_n_digit_of_pi(n).to_s(2)

  end

  def get_n_digit_of_pi_hardcoded(n)
    # alternativer "Algorithmus", um paar Beispielwerte fuer die testklasse zu haben
    # wird durch korrekte Implementation ersetzt

    case n
    when 1
      1
    when 2
      4
    when 3
      1
    when 4
      5
    when 5
      9
    when 6
      2
    when 7
      6
    when 8
      5
    when 9
      3
    when 10
      5
    when 11
      8
    when 12
      9
    when 13
      7
    when 14
      9
    when 15
      3
    when 32
      0
    when 4368196101671
      1
    when 4368196101672
      2
    when 4368196101673
      3
    when 4368196101674
      4
    when 4368196101675
      5
    when 4368196101676
      6
    when 4368196101677
      7
    when 4368196101678
      8
    when 4368196101679
      9
    else
      raise RangeError
    end
  end
end
