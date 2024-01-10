require "application_system_test_case"

class MaterialTypesTest < ApplicationSystemTestCase
  setup do
    @material_type = material_types(:one)
  end

  test "visiting the index" do
    visit material_types_url
    assert_selector "h1", text: "Material types"
  end

  test "should create material type" do
    visit material_types_url
    click_on "New material type"

    fill_in "Name", with: @material_type.name
    fill_in "Unit", with: @material_type.unit
    click_on "Create Material type"

    assert_text "Material type was successfully created"
    click_on "Back"
  end

  test "should update Material type" do
    visit material_type_url(@material_type)
    click_on "Edit this material type", match: :first

    fill_in "Name", with: @material_type.name
    fill_in "Unit", with: @material_type.unit
    click_on "Update Material type"

    assert_text "Material type was successfully updated"
    click_on "Back"
  end

  test "should destroy Material type" do
    visit material_type_url(@material_type)
    click_on "Destroy this material type", match: :first

    assert_text "Material type was successfully destroyed"
  end
end
