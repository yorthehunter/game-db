module ApplicationHelper

  def sortable(column, title = nil)
    title ||= column.titleize

    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to sort: column, direction: direction do
      link = title
      if column == sort_column
        icon = sort_direction == "asc" ? icon("caret-down") : icon("caret-up")
        link << " " + icon
      end
      link.html_safe
    end
  end

end
