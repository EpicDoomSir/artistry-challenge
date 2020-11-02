class ArtistsController < ApplicationController
    def index
        @artists = Artist.all
    end

    def show
        @artist = Artist.find(params[:id])
    end

    def form_instrument
        @artist_plays = ArtistPlay.new
    end

    def add_instrument
        @artist_plays_params = params.require(:artist_play).permit(:artist_id, :instrument_id)
        @artist_plays = ArtistPlay.create(@artist_plays_params)
        redirect_to artist_path(@artist_plays.artist_id)
    end

    def new
        @artist = Artist.new
    end

    def create
        @artist_params = params.require(:artist).permit(:name, :title, :age)
        @artist = Artist.create(@artist_params)
        if @artist.valid?
            redirect_to artist_path(@artist)
        else
            flash[:artist_errors] = @artist.errors.full_messages
            redirect_to new_artist_path
        end
    end
end
