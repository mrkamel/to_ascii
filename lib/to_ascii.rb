# encoding: utf-8

require "to_ascii/version"

module ToAscii
  MAPPING = {
    "ä" => "ae", "æ" => "ae",
    "Ä" => "Ae", "Æ" => "Ae",
    "ü" => "ue",
    "Ü" => "Ue",
    "ö" => "oe",
    "Ö" => "Oe",
    "ß" => "ss",
    "ÿ" => "y", "ý" => "y",
    "Ÿ" => "Y", "Ý" => "Y",
    "ž" => "z",
    "Ž" => "Z",
    "š" => "s",
    "Š" => "S",
    "à" => "a", "á" => "a", "â" => "a", "ã" => "a",
    "À" => "A", "Á" => "A", "Â" => "A", "Ã" => "A",
    "ç" => "c",
    "Ç" => "C",
    "è" => "e", "é" => "e", "ê" => "e", "ë" => "e", "ẽ" => "e",
    "È" => "E", "É" => "E", "Ê" => "E", "Ë" => "E", "Ẽ" => "E",
    "ì" => "i", "í" => "i", "î" => "i", "ï" => "i",
    "Ì" => "I", "Í" => "I", "Î" => "I", "Ï" => "I",
    "ñ" => "n",
    "Ñ" => "N",
    "ò" => "o", "ó" => "o", "ô" => "o", "õ" => "o",
    "Ò" => "O", "Ó" => "O", "Ô" => "O", "Õ" => "O",
    "ù" => "u", "ú" => "u", "û" => "u", "ũ" => "u",
    "Ù" => "U", "Ú" => "U", "Û" => "U", "Ũ" => "U",
    "Ð" => "Dh",
    "ð" => "dh",
    "Þ" => "Th",
    "þ" => "th",
    "’" => "'"
  }
end

class String
  def to_ascii
    res = ""

    chars.each do |char|
      if mapping = ToAscii::MAPPING[char]
        res << ToAscii::MAPPING[char]
      elsif char.bytesize == 1
        res << char
      end
    end

    res
  end
end

