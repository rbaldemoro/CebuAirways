require "application_system_test_case"

class SeatsTest < ApplicationSystemTestCase
  setup do
    @seat = seats(:one)
  end

  test "visiting the index" do
    visit seats_url
    assert_selector "h1", text: "Seats"
  end

  test "creating a Seat" do
    visit seats_url
    click_on "New Seat"

    fill_in "Baggage", with: @seat.baggage
    fill_in "Flight", with: @seat.flight_id
    fill_in "Name", with: @seat.name
    click_on "Create Seat"

    assert_text "Seat was successfully created"
    click_on "Back"
  end

  test "updating a Seat" do
    visit seats_url
    click_on "Edit", match: :first

    fill_in "Baggage", with: @seat.baggage
    fill_in "Flight", with: @seat.flight_id
    fill_in "Name", with: @seat.name
    click_on "Update Seat"

    assert_text "Seat was successfully updated"
    click_on "Back"
  end

  test "destroying a Seat" do
    visit seats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Seat was successfully destroyed"
  end
end
