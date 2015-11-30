# Bailey-Borwein-Plouffe-Formel fuer PI
# Author:: Uwe Krause
# Author:: Lucas Anders

#Klasse zur Berechnung von PI
#
#Bei 11 Iterationen der Formel wird die gleiche Genauigkeit wie bei Math::PI erreicht.
class MyPi
  def initialize() #:notnew:

    # Aus der Aufgabe 1.2.2 wissen wir, wie oft die Formel durchlaufen werden muss,
    # um zur gleichen Genauigkeit zu kommen, wie Math::PI
    # Genauigkeit NICHT Anzahl der Nachkommastellen!

    #@genauigkeit = praezisionstest()
    @genauigkeit = 11

    @my_pi = my_pi(@genauigkeit)
  end

  # Aufgabe 1.2.1 - Implementierung der Bailey-Borwein-Plouffe-Formel
  def my_pi(n = @genauigkeit)

    # erstmal paar Fehler werfen
    raise RangeError unless n.is_a? Integer
    raise RangeError if n <= 0

    wert = 0.0
    n.times do |i|
      k = i.to_f
      wert += (1.0/(16**k)) * ((4/(8*k+1)) - (2/(8*k+4)) - (1/(8*k+5)) - (1/(8*k+6)))
    end
    wert
  end

  # Aufgabe 1.2.1 - Wie schnell kommen wir auf den gleichen wert wie Math::PI?
  def praezisionstest()
    # Pruefe die Rueckgabewerte der Implementierung gegen die Vorgabe von Math::PI
    # solange bis ausreichende Genauigkeit erreicht ist
    # Genauigkeit entspricht NICHT der Anzahl der Nachkommastellen!

    for x in (1..77) do
      pi_errechnet = my_pi_iterativ(x)
      if Math::PI - pi_errechnet == 0.0
        return x
      end
    end

    # Falls die Schleife nicht innerhalb der definierten Anzahl von Aufrufen zu einem Ergebnis kommen sollte
    raise StopIteration
    # Kommt in diesem Beispiel nicht vor

  end

=begin
  Aufgabe 1.2.2 - n-te Nachkommastelle von pi

  ==== Atrributes
  * +n+ Integer: Wievielte Nachkommastelle
  * +system+ Welches Zahlensystem wird verwendet? 2 fuer Binaer, 10 fuer Dezimal
=end

  def get_n_digit_of_pi(n, system = 10)
    # erstmal paar Fehler werfen, wenn wir kein Integer bekommen
    raise RangeError unless n.is_a? Integer
    raise unless system.is_a? Integer
    raise RangeError if n <= 0

    my_pi = self.my_pi(n)

    multipliziere_mit_faktor = my_pi * 10**(n-1)
    # beste(?) Methode, um den ganzzahligen Teil abzuschneiden: % 1
    abschneiden = multipliziere_mit_faktor % 1
    multipliziere = abschneiden * system
    # beste(?) Methode um Nachkommastellen zu entfernen: to_i
    multipliziere.to_i

  end

  # Aufgabe 1.2.3 - n-te Nachkommastelle von Pi in Binaerdarstellung
  def get_n_digit_of_pi_dual(n)

    get_n_digit_of_pi(n, 2).to_s

  end

end
