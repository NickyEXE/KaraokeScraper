class SearchController < ApplicationController

    def process_search
        search = Search.new(params[:query])
        render json: search.parse
    end
end
