require "pry"

class SongsController < ApplicationController

  # GET: /songs DONE
  get "/songs" do
    @songs = Song.all
    erb :"/songs/index.html"
  end

  # GET: /songs/new DONE
  get "/songs/new" do
    erb :"/songs/new.html"
  end

  # POST: /songs DONE
  post "/songs" do
    song = Song.create(params)
    redirect "/songs/#{song.id}"
  end

  # GET: /songs/5 DONE
  get "/songs/:id" do
    @song = Song.find(params[:id])
    erb :"/songs/show.html"
  end

  # edit GET: /songs/5/edit
  get "/songs/:id/edit" do
    @song = Song.find(params[:id])
    # binding.pry
    erb :"/songs/edit.html"
  end

  # edit PATCH: /songs/5
  patch "/songs/:id" do
    @song = Song.find(params[:id])
      if params[:name] == ""
        params[:name] = @song.name
      else 
        @song.update(name: params[:name])
      end
      if params[:release_year] == ""
        params[:release_year] = @song.release_year
      else
        @song.update(release_year: params[:release_year])
      end
      # @song.update(name: params[:name], release_year: params[:release_year])
      # binding.pry
    redirect "/songs/#{@song.id}"
  end

  # post '/songs/:id' do 
  #   puts "here"
  #   binding.pry
  # end 

  # DELETE: /songs/5/delete
  get "/songs/:id/delete" do
    Song.destroy(params[:id])
    redirect "/songs"
  end
end
