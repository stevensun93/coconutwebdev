
require 'rubygems'
require 'bundler/setup'
Bundler.require
require './models/TodoItem'

ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3',
  :database => 'db/development.db',
  :encoding => 'utf8'
)

get '/' do

  @tasks = TodoItem.all
	erb :todolist

end

post '/' do

  item = TodoItem.create(due_date: params[:date], description: params[:task])
	redirect "/"

end

post '/delete' do

  item = TodoItem.destroy(due_date: params[:date], description: params[:task])
  redirect "/delete"

end

get '/test/:whatever' do
  
  return "you accessed: " + params[:whatever]

end
