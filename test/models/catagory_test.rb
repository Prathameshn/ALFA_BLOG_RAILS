require 'test_helper'

class CatagoryTest < ActiveSupport::TestCase

  def setup
    @catagory = Catagory.new(name:"Sports")
  end

  test "Catagory name should be valid" do
    assert @catagory.valid?
  end
  
  test "Catagory name should be present" do
    @catagory.name = ""
    assert_not @catagory.valid?
  end

  test "Catagory name should be unique" do
    @catagory.save
    @catagory2 = Catagory.new(name:"Sports")
    assert_not @catagory2.valid?
  end

  test "Catagory name should not be too short" do
    @catagory.name = "t"
    assert_not @catagory.valid?
  end

  test "Catagory name should not be too long" do
    @catagory.name = "t"*23
    assert_not @catagory.valid?
  end
end