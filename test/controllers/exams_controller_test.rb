require 'test_helper'

class ExamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exam = exams(:one)
  end

  test "should get index" do
    get exams_url
    assert_response :success
  end

  test "should get new" do
    get new_exam_url
    assert_response :success
  end

  test "should create exam" do
    assert_difference('Exam.count') do
      post exams_url, params: { exam: { code: @exam.code, created_by: @exam.created_by, description: @exam.description, enroll_end: @exam.enroll_end, enroll_start: @exam.enroll_start, exam_end: @exam.exam_end, exam_start: @exam.exam_start, fee: @exam.fee, format: @exam.format, max_enrollment: @exam.max_enrollment, owner_id: @exam.owner_id, status: @exam.status, title: @exam.title, updated_by: @exam.updated_by } }
    end

    assert_redirected_to exam_url(Exam.last)
  end

  test "should show exam" do
    get exam_url(@exam)
    assert_response :success
  end

  test "should get edit" do
    get edit_exam_url(@exam)
    assert_response :success
  end

  test "should update exam" do
    patch exam_url(@exam), params: { exam: { code: @exam.code, created_by: @exam.created_by, description: @exam.description, enroll_end: @exam.enroll_end, enroll_start: @exam.enroll_start, exam_end: @exam.exam_end, exam_start: @exam.exam_start, fee: @exam.fee, format: @exam.format, max_enrollment: @exam.max_enrollment, owner_id: @exam.owner_id, status: @exam.status, title: @exam.title, updated_by: @exam.updated_by } }
    assert_redirected_to exam_url(@exam)
  end

  test "should destroy exam" do
    assert_difference('Exam.count', -1) do
      delete exam_url(@exam)
    end

    assert_redirected_to exams_url
  end
end
