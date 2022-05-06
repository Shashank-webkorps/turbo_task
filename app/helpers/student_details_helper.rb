module StudentDetailsHelper

  def build_order_link(column:, label:)
    if column == session.dig('student_detail_filters', 'column')
      link_to(label, list_student_details_path(column: column, direction: next_direction, page: @pagy.page))
    else
      link_to(label, list_student_details_path(column: column, direction: 'asc', page: @pagy.page))
    end
  end

  def next_direction
    session['student_detail_filters']['direction'] == 'asc' ? 'desc' : 'asc'
  end

  def sort_indicator
    tag.span(class: "sort sort-#{session['student_detail_filters']['direction']}")
  end

end
