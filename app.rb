#to create a To-Do app
require 'sinatra'

class Todo
	attr_accessor :task, :done ,:important ,:urgent 
	
	def initialize task 
		@task = task
		@done = false
		@important = ""
		@urgent = ""
		
	end
end
 tasks = []
#  t1 = Todo.new "First"
#  t2 = Todo.new "Second"
#  t3 = Todo.new "Third"

#  tasks << t1
#  tasks << t2
#  tasks << t3

 get '/' do
	data  = Hash.new
	data[:tasks] = tasks
	erb :developed,locals: data 	
 end

 post '/add' do
 	puts params
 	task = params["task"]
 	@important = params["important"]
 	@urgent = params["urgent"]
 	puts @important
 	puts @urgent

 	todo = Todo.new task 
 	todo.important = @important
 	todo.urgent = @urgent
 		 
 	tasks << todo
 	return redirect '/'
 end

 post '/done' do
    task = params["task"]
 
    tasks.each do |todo|
        if todo.task == task
            todo.done = !todo.done
        end
    end
 
    return redirect '/'
end