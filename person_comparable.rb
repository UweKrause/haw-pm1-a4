require 'set'

#beschreibt eine Klasse Person, die Briefe von anderen Personen erhalten kann und Briefe an andere Personen senden
#inkludiert Comparable
#Das Inkludieren des Moduls 'Comparable' ist insofern sinnvoll, da  dieses weitere Vergleichsoperatoren,
#wie z.B: <,>,= auf Basis des Spaceship_Operators definiert. 
#Somit kann eine eigene Klasse , die Comparable inkludiert,diese auch nutzen. 
#Author:: Lucas Anders, Uwe Krause
class Person

  include Comparable

  #accessors ermöglichen, dass die Objekte der Klasse Brief auf den Postein-/ausgang zugreifen können
  attr_accessor :posteingang, :postausgang
  attr_reader :name, :strasse, :plz, :ort
  def initialize(name, strasse, plz, ort)
    @name = name
    @strasse = strasse
    @plz = plz
    @ort = ort
    @posteingang = Set.new()
    @postausgang = Set.new()
  end

  #gibt alle Briefe im Posteingang auf der Konsole aus
  def lesen
    @posteingang.each{|x| puts x + "\n"}
  end

  #gibt alle Briefe im Postausgang auf der Konsole aus
  def gesendete_lesen
    @postausgang.each{|x| puts x}
  end

  #gibt die aktuellen Werte der Attribute in einem Array zurück
  #wird für die Vergleichsmethoden benötigt
  def zustand
    return [@name, @strasse, @plz, @ort]
  end

  def ==(other)
    if other.nil?
      return false
    end
    return self.zustand()==other.zustand()
  end

  def eql?(other)
    return false if other.nil?
    return true if
    self.equal?(other)
    return false if
    self.class != other.class
    return self.==(other)
  end

  def hash
    return self.zustand.hash
  end

  #vergleicht beide Objekte hinsichtlich der natürlichen Ordnung der Attribute Name, Strasse, PLZ und Ort
  #benoetigt, um Comparable zu benutzen
  #@param variante gibt an, nach welchem Kriterium geordnet werden soll
  def <=>(other,variante = 1)
    #    return nil unless self.class == other.class
    case variante
    #alphabetisch
    when 1
      return spaceship_alphabetisch(other)
    #umgekehrt alphabetisch
    when 2
      return (spaceship_alphabetisch(other) * (-1))
    end

  end

  #definiert den Spaceship-Operator nach alphabetischer Ordnung
  def spaceship_alphabetisch(other)
    return nil unless self.class == other.class
    if (@name <=> other.name) == 0
      if (@strasse <=> other.strasse) == 0
        if (@plz <=> other.plz) == 0
          return @ort <=> other.ort
        end
        return @plz <=> other.plz
      end
      return @strasse <=> other.strasse
    end
    return @name <=> other.name
  end

  #gibt die Person in einem lesbaren String zurück
  def to_s
    return "\t #{@name} \n \t #{@strasse} \n \t #{@plz} \n \t #{@ort}"
  end
end
