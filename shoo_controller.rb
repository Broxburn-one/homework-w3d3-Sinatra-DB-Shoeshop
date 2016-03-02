require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('./models/shoo')

get '/shoo/new' do
  erb(:new)
end

post '/shoo' do
  @shoo = Shoo.new(params)
  @shoo.save()
  erb(:create)
end

get '/shoo' do
  @shoos = Shoo.all()
  erb(:index)
end