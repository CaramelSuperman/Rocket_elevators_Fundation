class HomeController < ApplicationController
    def index
    end

    def commercial
        def audio_path(source, options = {})
            path_to_asset(source, {type: :audio}.merge!(options))
        end
    end

    def residential
    end

    def interventions
    end
end