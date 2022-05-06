class StudentDetail < ApplicationRecord

  FILTER_PARAMS = %i[q column direction page].freeze

  scope :search_in_all_fields, ->(text){
    where(
      column_names
        .reject {|field| ["id", "created_at", "updated_at"].include? field }
        .map {|field| "#{field} like '%#{text}%'" }
        .join(" or ")
    )
  }

  def self.filter(filters)
    StudentDetail.search_in_all_fields(filters['q']).order("#{filters['column']} #{filters['direction']}")
  end
end
