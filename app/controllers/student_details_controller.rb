class StudentDetailsController < ApplicationController
  include Filterable
  def index
    @pagy, @student_details = pagy(filter!(StudentDetail))
  end

  def list
    @pagy, @student_details = pagy(filter!(StudentDetail))

    render(partial: 'student_details', locals: { student_details: @student_details, pagy: @pagy })
  end
end
