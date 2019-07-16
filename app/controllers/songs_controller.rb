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

  # GET: /songs/5/edit
  get "/songs/:id/edit" do
    @song = Song.find(params[:id])
    # binding.pry
    erb :"/songs/edit.html"
  end

  # PATCH: /songs/5
  post "/songs/:id" do
    @song = Song.find(params[:id])
    # params
    # binding.pry
    if params[:name] == nil
      @song[:name] = @song[:name]
    else
      @song[:name] = params[:name]
    end
    if params[:release_year] == nil
      @song[:release_year] = @song[:release_year]
    else
      @song[:release_year] = params[:name]
    end
    redirect "/songs/:id"
  end

  # DELETE: /songs/5/delete
  get "/songs/:id/delete" do
    Song.destroy(params[:id])
    redirect "/songs"
  end
end
