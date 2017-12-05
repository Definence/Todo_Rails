module ApplicationHelper
    def sortable(column, title = nil)
        title ||= column.titleize
        query = {:sort => column}
        query[:page] = params[:page] if params[:page]
        query[:direction] = params[:direction] if params[:direction]
        query[:search] = params[:search] if params[:search]
        link_to title, query
      end
end
