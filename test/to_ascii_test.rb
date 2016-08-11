# encoding: utf-8

require "minitest/autorun"

require File.expand_path("../../lib/to_ascii", __FILE__)

class ToAsciiTest < MiniTest::Unit::TestCase
  def test_to_ascii
    assert_equal "ae", "ä".to_ascii
    assert_equal "Ae", "Ä".to_ascii
    assert_equal "ue", "ü".to_ascii
    assert_equal "Ue", "Ü".to_ascii
    assert_equal "oe", "ö".to_ascii
    assert_equal "ss", "ß".to_ascii
    assert_equal "yy", "ÿý".to_ascii
    assert_equal "YY", "ŸÝ".to_ascii
    assert_equal "z", "ž".to_ascii
    assert_equal "Z", "Ž".to_ascii
    assert_equal "s", "š".to_ascii
    assert_equal "ae", "æ".to_ascii
    assert_equal "Ae", "Æ".to_ascii
    assert_equal "aaa", "àáâ".to_ascii
    assert_equal "AAA", "ÀÁÂ".to_ascii
    assert_equal "c", "ç".to_ascii
    assert_equal "C", "Ç".to_ascii
    assert_equal "eeee", "èéêë".to_ascii
    assert_equal "EEEE", "ÈÉÊË".to_ascii
    assert_equal "iiii", "ìíîï".to_ascii
    assert_equal "IIII", "ÌÍÎÏ".to_ascii
    assert_equal "n", "ñ".to_ascii
    assert_equal "N", "Ñ".to_ascii
    assert_equal "oooo", "òóôõ".to_ascii
    assert_equal "OOOO", "ÒÓÔÕ".to_ascii
    assert_equal "uuu", "ùúû".to_ascii
    assert_equal "UUU", "ÙÚÛ".to_ascii
    assert_equal "Dh", "Ð".to_ascii
    assert_equal "dh", "ð".to_ascii
    assert_equal "Th", "Þ".to_ascii
    assert_equal "th", "þ".to_ascii

    assert_equal "½¿¶", "½¿¶".to_ascii(force: false)
    assert_equal "", "½¿¶".to_ascii
  end
end


