class PastMatches
    attr_accessor :date, :result, :opponent, :opponentLogo, :location, :recap

    def initialize(date, result, opponent, opponentLogo, location, recap)
        @date = date
        @result = result
        @opponent = opponent
        @opponentLogo = opponentLogo
        @location = location
        @recap = recap
    end

    <<-doc
        Return This object as a hash 
    doc
    def as_json
        {
            date: @date,
            result: @result,
            opponent: @opponent,
            opponentLogo: @opponentLogo,
            location: @location,
            recap: @recap
        }
    end
end

#main-content > section.ohio--category-schedule > div > div:nth-child(6) > div > div > div:nth-child(1) > div.schedule-links > div:nth-child(1) > a