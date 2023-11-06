class UpcomingMatches
    attr_accessor :date, :time, :opponent, :opponentLogo, :location, :recap, :stats

    def initialize(date, time, opponent, opponentLogo, location, recap, stats)
        @date = date
        @time = time
        @opponent = opponent
        @opponentLogo = opponentLogo
        @location = location
        @recap = recap
        @stats = stats
    end

    <<-doc
        Return This object as a hash 
    doc
    def as_json
        {
            date: @date,
            time: @time,
            opponent: @opponent,
            opponentLogo: @opponentLogo,
            location: @location,
            recap: @recap,
            stats: @stats
        }
    end
end