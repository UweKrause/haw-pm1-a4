# Reihenentwicklung des natuerlichen Logarithmus
# Author:: Uwe Krause
# Author:: Lucas Anders

# Reihenentwicklung des natuerlichen Logarithmus
#
# Implementiert in 3 verschiedenen Varianten
# 1. For-Schleife
# 2. reduce
# 3. rekursiv
def ln(a, implementierung = 1)

  # Wenn ein Integer uebergeben wurde, zaubern wir ein Float draus
  if a.is_a? Integer
    # arbeite mit einer Kopie, um nicht destruktiv zu sein
    x = a.to_f
  else
    x = a
  end

  # froehliches Exceptions werfen
  raise RangeError unless (x.is_a? Float or x.is_a? BigDecimal)
  raise RangeError unless x.finite?
  raise RangeError if x <= 0.0
  raise RangeError if x > 2.0

  # die Reihenentwicklung des natuerlichen Logarithmus fuer (1.5) liefert bei 49 Durchlaeufen die gleiche Genauigkeit, wie Math::log(1.5)
  # bei x=2.0 sieht das schon anders aus
  # welches ist nun also ein vernuenftiger Wert?

  genauigkeit = 500

  # Welche Implementierung wurde gewaehlt?
  # gut, um die verschiedenen Implementierungen auf ihre Performance zu ueberpruefen
  case implementierung
  when 1
    ln_iterativ_for(x, genauigkeit)
  when 2
    ln_iterativ_reduce(x, genauigkeit)
  when 3
    ln_rekursiv(x, genauigkeit)
  end

end

# Iterativer Ansatz mit klassischer for-schleife
def ln_iterativ_for(x, genauigkeit)

  ln = 0.0
  for i in 1..genauigkeit
    ln += ((-1)**(i+1)) * (((x-1)**i)/i)
  end
  ln
end

# Iterativer Ansatz mit reduce
#
# Fuer dieses Rechenbeispiel der langsamste Weg
def ln_iterativ_reduce(x, genauigkeit)

  ln = 0.0
  return (0..genauigkeit).reduce { |ln, i|
    ln + ((-1)**(i+1))*(((x-1)**i)/i)
  }

end

# Rekursiver Ansatz.
#
# Fuer dieses Rechenbeispiel der schnellste Weg
def ln_rekursiv(x, genauigkeit)

  i = genauigkeit
  
  return (x-1) if i == 1
  return ((-1)**(i+1))*(((x-1)**i)/i) + ln_rekursiv(x, i - 1)

end
