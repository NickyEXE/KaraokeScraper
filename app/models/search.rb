class Search
    require 'uri'
    require 'net/http'

    attr_reader :query

    def initialize(query)
        @query = query
    end

    def response
        url = URI("http://singsingmedia.com/search/search_ajax.php")
        http = Net::HTTP.new(url.host, url.port)
        request = Net::HTTP::Post.new(url)
        request.body = "query=#{self.query}"
        response = http.request(request)
        response.body
    end

    def parse
        noko = Nokogiri::HTML(self.response)
        cells = noko.css("td").map{|children| children.text}
        cleaned_cells = cells.slice(3,cells.length)
        self.turn_cells_to_array_of_hashes(cleaned_cells)
    end

    def turn_cells_to_array_of_hashes(cells)
        number_of_entries = cells.length/3
        array = {number_of_results: number_of_entries, songs: []}
        if cells.length > 0
            i = 0
            number_of_entries.times do
                hash = {number: cells[i], song: cells[i+1], artist: cells[i+2]}
                array[:songs].push(hash)
                i += 3
            end
        end
        array
    end
end
