
require 'rubygems'
require 'bundler/setup'
Bundler.require
require './models/TodoItem'

if ENV['DATABASE_URL']
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
else
  ActiveRecord::Base.establish_connection(
    :adapter  => 'sqlite3',
    :database => 'db/development.db',
    :encoding => 'utf8'
  )
end

get '/' do
  @tasks = TodoItem.all
	erb :todolist
end

#to create items
post '/' do
  item = TodoItem.create(due_date: params[:date], description: params[:task])
	redirect "/"
end

#to delete items
post '/delete/:id' do
    TodoItem.find(params[:id]).destroy
    redirect '/'
end
