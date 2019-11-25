# frozen_string_literal: true

require "test_helper"

class KeysTest < Minitest::Spec
  def setup
    @camelcase_strings = { "aA" => 1, "bB" => 2 }
    @camelcase_symbols = { aA: 1, bB: 2 }
    @camelcase_mixed = { :aA => 1, "bB" => 2 }
    @underscore_strings = { "a_a" => 1, "b_b" => 2 }
    @underscore_symbols = { a_a: 1, b_b: 2 }
    @underscore_mixed = { :a_a => 1, "b_b" => 2 }

    @nested_camel_case_strings = { "aA" => { "bB" => { "cC" => 3 } } }
    @nested_camel_case_symbols = { aA: { bB: { cC: 3 } } }
    @nested_camel_case_mixed = { "aA" => { bB: { "cC" => 3 } } }
    @nested_underscore_strings = { "a_a" => { "b_b" => { "c_c" => 3 } } }
    @nested_underscore_symbols = { a_a: { b_b: { c_c: 3 } } }
    @nested_underscore_mixed = { "a_a" => { b_b: { "c_c" => 3 } } }

    @camelcase_string_array_of_hashes = { "aA" => [{ "bB" => 2 }, { "cC" => 3 }, 4] }
    @camelcase_symbol_array_of_hashes = { aA: [{ bB: 2 }, { cC: 3 }, 4] }
    @camelcase_mixed_array_of_hashes = { aA: [{ bB: 2 }, { "cC" => 3 }, 4] }
    @underscore_string_array_of_hashes = { "a_a" => [{ "b_b" => 2 }, { "c_c" => 3 }, 4] }
    @underscore_symbol_array_of_hashes = { a_a: [{ b_b: 2 }, { c_c: 3 }, 4] }
    @underscore_mixed_array_of_hashes = { a_a: [{ b_b: 2 }, { "c_c" => 3 }, 4] }
  end

  it "underscore_keys" do
    assert_equal @underscore_strings, @camelcase_strings.underscore_keys
    assert_equal @underscore_symbols, @camelcase_symbols.underscore_keys
    assert_equal @underscore_mixed, @camelcase_mixed.underscore_keys
  end

  it "camelize_keys" do
    assert_equal @camelcase_strings, @underscore_strings.camelize_keys
    assert_equal @camelcase_symbols, @underscore_symbols.camelize_keys
    assert_equal @camelcase_mixed, @underscore_mixed.camelize_keys
  end

  it "deep_underscore_keys" do
    assert_equal @nested_underscore_strings, @nested_camel_case_strings.deep_underscore_keys
    assert_equal @nested_underscore_symbols, @nested_camel_case_symbols.deep_underscore_keys
    assert_equal @nested_underscore_mixed, @nested_camel_case_mixed.deep_underscore_keys
    assert_equal @underscore_string_array_of_hashes, @camelcase_string_array_of_hashes.deep_underscore_keys
    assert_equal @underscore_symbol_array_of_hashes, @camelcase_symbol_array_of_hashes.deep_underscore_keys
    assert_equal @underscore_mixed_array_of_hashes, @camelcase_mixed_array_of_hashes.deep_underscore_keys
  end

  it "deep_camelize_keys" do
    assert_equal @nested_camel_case_strings, @nested_underscore_strings.deep_camelize_keys
    assert_equal @nested_camel_case_symbols, @nested_underscore_symbols.deep_camelize_keys
    assert_equal @nested_camel_case_mixed, @nested_underscore_mixed.deep_camelize_keys
    assert_equal @camelcase_string_array_of_hashes, @underscore_string_array_of_hashes.deep_camelize_keys
    assert_equal @camelcase_symbol_array_of_hashes, @underscore_symbol_array_of_hashes.deep_camelize_keys
    assert_equal @camelcase_mixed_array_of_hashes, @underscore_mixed_array_of_hashes.deep_camelize_keys
  end
end
