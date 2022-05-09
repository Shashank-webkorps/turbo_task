class StudentDetailsController < ApplicationController
  include Filterable
  def index
    reset_session
    @pagy, @student_details = pagy(filter!(StudentDetail))
  end

  def list
    @pagy, @student_details = pagy(filter!(StudentDetail))
    render turbo_stream: [
      turbo_stream.replace(
        'student_details',
        partial: 'table',
        locals: {
          student_details: @student_details,
          pagy: @pagy,
        }
      )
    ]
  end
end
