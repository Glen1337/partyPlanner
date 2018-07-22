require 'sinatra'
require "sinatra/reloader" if development?
require "pry" if development? || test?
require_relative 'config/application'
require "faker"

set :bind, '0.0.0.0'  # bind to all interfaces

@errors =[]

get '/' do
  redirect '/parties'
end

get '/parties' do
  @parties = Party.all
  erb :'parties/index'
end

get '/party/:id' do
  @party = Party.find(params[:id])
  @friends = Party.find(params[:id]).friends
  @allFriends = Friend.all
  erb :party
end

post '/submitInvitation' do
  friendId = params[:friendId]
  partyId = params[:partyId]
  Attendee.create(friend_id: friendId, party_id: partyId)
  @party = Party.find(partyId)
  @friends = Party.find(partyId).friends
  @allFriends = Friend.all
  erb :party
end

get '/new' do
  @errors = []
  erb :new
end

post '/submit' do
  @name = params[:name]
  @desc = params[:description]
  @loc = params[:location]

  newParty = Party.new(name: @name, description: @desc, location: @loc)

  # if !newParty.valid? erb :'parties/index' end

  if newParty.save
    @party = newParty
    @message = "Party added successfully"
    redirect "/party/#{newParty.id}"
    # erb :party
    #redirect
  else
    @errors = newParty.errors.full_messages
    # re-render the new page
    erb :new
  end
end

get '/friends' do
  @friends = Friend.order('first_name')
  erb :friends
end

get '/friends/new' do
  @errors = []

  erb :newfriend
end

post '/submitFriend' do
  @firstName = params[:firstname]
  @lastName = params[:lastname]

  newFriend = Friend.new(first_name: @firstName, last_name: @lastName)

  #if valid
  if newFriend.save
    @friends = Friend.order('first_name')
    @message = "Friend created successfully"
    erb :friends
  else
    @errors = newFriend.errors.full_messages
    erb :newfriend
  end
end

  # if params[:name].empty? || params[:description].empty? || params[:location].empty?
  #   @parties = Party.all
  #   @preLoc = params[:location]
  #   @preDesc = params[:description]
  #   @preName = params[:name]
  #   return erb :'parties/index'
  # else
  #   name = params[:name]
  #   desc = params[:description]
  #   loc = params[:location]
  #
  #   createdParty = Party.create(name: name, description: desc, location: loc)
  #   foundParty = Party.find_by(name: name);
  #   @party = foundParty
  #   @message = 'Party created successfully'

  # erb :party
