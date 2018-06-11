class PagesController < ApplicationController
    def created
    end

    def list
        @places = Place.all
    end
    
    def test
    end
end
