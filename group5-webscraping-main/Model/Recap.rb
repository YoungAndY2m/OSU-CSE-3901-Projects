class Recap

    def initialize(recapLink, date)
        @recapLink = recapLink
        @date = date

    end

    def as_json
        {
            recapLink: @recapLink,
            date: @date
        }
    end

end