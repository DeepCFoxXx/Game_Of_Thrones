require('sinatra')
require('sinatra/contrib/all')
require_relative('models/member.rb')
require_relative('models/house.rb')

get '/members' do
  @members = Member.all
  erb(:index)
end

get '/members/new' do
  @houses = House.all
  erb(:new)
end

post '/members' do
  Member.new(params).save
  redirect to '/members'
end

get '/members/:id' do
  @member = Member.find(params['id'])
  erb(:show)
end

get '/members/:id/edit' do
  @houses = House.all
  @member = Member.find(params['id'])
  erb(:edit)
end

post '/members/:id' do
  member = Member.new(params)
  member.update
  redirect to "/members/#{params['id']}"
end

post '/members/:id/delete' do
  member = Member.find(params['id'])
  member.delete
  redirect to '/members'
end
