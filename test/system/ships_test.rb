require "application_system_test_case"

class ShipsTest < ApplicationSystemTestCase
  setup do
    @ship = ships(:one)
  end

  test "visiting the index" do
    visit ships_url
    assert_selector "h1", text: "Ships"
  end

  test "should create ship" do
    visit ships_url
    click_on "New ship"

    fill_in "Captain", with: @ship.captain
    fill_in "Decommissioned", with: @ship.decommissioned
    fill_in "Launched", with: @ship.launched
    fill_in "Name", with: @ship.name
    fill_in "Registry", with: @ship.registry
    fill_in "Shipclass", with: @ship.shipClass
    click_on "Create Ship"

    assert_text "Ship was successfully created"
    click_on "Back"
  end

  test "should update Ship" do
    visit ship_url(@ship)
    click_on "Edit this ship", match: :first

    fill_in "Captain", with: @ship.captain
    fill_in "Decommissioned", with: @ship.decommissioned
    fill_in "Launched", with: @ship.launched
    fill_in "Name", with: @ship.name
    fill_in "Registry", with: @ship.registry
    fill_in "Shipclass", with: @ship.shipClass
    click_on "Update Ship"

    assert_text "Ship was successfully updated"
    click_on "Back"
  end

  test "should destroy Ship" do
    visit ship_url(@ship)
    click_on "Destroy this ship", match: :first

    assert_text "Ship was successfully destroyed"
  end
end
