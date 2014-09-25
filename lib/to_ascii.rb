# encoding: utf-8

require "to_ascii/version"

if RUBY_VERSION < "1.9"
  require "iconv"
end

class String
  def to_ascii
    # we would like to use Iconv.iconv("us-ascii//translit", "utf-8", self).to_s only,
    # but unfortunately it does not work in production for unknown reasons
    # therefore, we have to convert as much as possible manually

    str = String.new(self)

    str.gsub!(/ä|æ/, "ae")
    str.gsub!(/Ä|Æ/, "Ae")
    str.gsub!(/ü/, "ue")
    str.gsub!(/Ü/, "Ue")
    str.gsub!(/ö/, "oe")
    str.gsub!(/Ö/, "Oe")
    str.gsub!(/ß/, "ss")

    str.gsub!(/ÿ|ý/, "y")
    str.gsub!(/Ÿ|Ý/, "Y")
    str.gsub!(/ž/, "z")
    str.gsub!(/Ž/, "Z")
    str.gsub!(/š/, "s")
    str.gsub!(/Š/, "S")
    str.gsub!(/à|á|â|ã/, "a")
    str.gsub!(/À|Á|Â|Ã/, "A")
    str.gsub!(/ç/, "c")
    str.gsub!(/Ç/, "C")
    str.gsub!(/è|é|ê|ë|ẽ/, "e")
    str.gsub!(/È|É|Ê|Ë|Ẽ/, "E")
    str.gsub!(/ì|í|î|ï/, "i")
    str.gsub!(/Ì|Í|Î|Ï/, "I")
    str.gsub!(/ñ/, "n")
    str.gsub!(/Ñ/, "N")
    str.gsub!(/ò|ó|ô|õ/, "o")
    str.gsub!(/Ò|Ó|Ô|Õ/, "O")
    str.gsub!(/ù|ú|û|ũ/, "u")
    str.gsub!(/Ù|Ú|Û|Ũ/, "U")
    str.gsub!(/Ð/, "Dh")
    str.gsub!(/ð/, "dh")
    str.gsub!(/Þ/, "Th")
    str.gsub!(/þ/, "th")
    str.gsub!(/’/, "'")

    if RUBY_VERSION < "1.9"
      return Iconv.conv("ascii//ignore", "utf-8", str)
    else
      str.encode Encoding::ASCII, :invalid => :replace, :undef => :replace, :replace => ""
    end
  end
end

