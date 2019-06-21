class SearchController < ApplicationController

    def process_search
        search = Search.new(params[:id])
        render json: search.parse
    end
end
