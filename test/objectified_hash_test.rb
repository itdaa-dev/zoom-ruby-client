# frozen_string_literal: true

require "test_helper"

class ObjectifiedHashTest < Minitest::Spec
  before do
    @hash = { a: 1, b: 2, "string" => "string", symbol: :symbol, items: [{ a: 1 }] }
    @oh = Zoom::ObjectifiedHash.new(@hash)
  end

  it "should objectify hash" do
    assert_equal @hash[:a], @oh.a
    assert_equal @hash[:b], @oh.b
    assert_equal @hash[:items].count, @oh.items.count
    assert_equal @hash[:items][0][:a], @oh.items[0].a
  end

  describe "#to_hash" do
    it "should return an original hash" do
      assert @oh.to_hash
    end

    it "should have an alias #to_h" do
      assert @oh.respond_to?(:to_h)
    end
  end

  describe "#inspect" do
    it "should return a formatted string" do
      pretty_string = "#<#{@oh.class.name}:#{@oh.object_id} {hash: #{@hash}}"
      assert_equal pretty_string, @oh.inspect
    end
  end

  describe "#respond_to" do
    it "should return true for methods this object responds to through method_missing as sym" do
      assert @oh.respond_to?(:a)
    end

    it "should return true for methods this object responds to through method_missing as string" do
      assert @oh.respond_to?("string")
    end

    it "should not care if you use a string or symbol to reference a method" do
      assert @oh.respond_to?(:string)
    end

    it "should not care if you use a string or symbol to reference a method" do
      assert @oh.respond_to?("symbol")
    end
  end
end
