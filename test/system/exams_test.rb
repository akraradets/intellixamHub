require "application_system_test_case"

class ExamsTest < ApplicationSystemTestCase
  setup do
    @exam = exams(:one)
  end

  test "visiting the index" do
    visit exams_url
    assert_selector "h1", text: "Exams"
  end

  test "creating a Exam" do
    visit exams_url
    click_on "New Exam"

    fill_in "Created by", with: @exam.created_by
    fill_in "Description", with: @exam.description
    fill_in "Fee", with: @exam.fee
    fill_in "Format", with: @exam.format
    fill_in "Max enrollment", with: @exam.max_enrollment
    fill_in "Owner", with: @exam.owner_id
    fill_in "Status", with: @exam.status
    fill_in "Title", with: @exam.title
    fill_in "Updated by", with: @exam.updated_by
    click_on "Create Exam"

    assert_text "Exam was successfully created"
    click_on "Back"
  end

  test "updating a Exam" do
    visit exams_url
    click_on "Edit", match: :first

    fill_in "Created by", with: @exam.created_by
    fill_in "Description", with: @exam.description
    fill_in "Fee", with: @exam.fee
    fill_in "Format", with: @exam.format
    fill_in "Max enrollment", with: @exam.max_enrollment
    fill_in "Owner", with: @exam.owner_id
    fill_in "Status", with: @exam.status
    fill_in "Title", with: @exam.title
    fill_in "Updated by", with: @exam.updated_by
    click_on "Update Exam"

    assert_text "Exam was successfully updated"
    click_on "Back"
  end

  test "destroying a Exam" do
    visit exams_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Exam was successfully destroyed"
  end
end
