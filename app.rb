require "sinatra"
enable :sessions
=begin
	get "/" do
		shows
	end
	post "/" do
		creates
	end
	...
	put: replaces
	patch: modifies
	delete: deletes/'annihilates'
	options: 'appeases'
	link: affiliates
	unlink: seperates
=end

get "/" do # directs to the home page (root directory). 'get' goes to a page
	erb :first_page # directs from 'first_page' erb(embedded ruby) file. (Shows something)
end 

post "/name" do # 'post' comes from a page. 'name' is the action that comes from the erb file
	 # brings parameters from input forms, from the erb
	session[:name] = params[:name]
	redirect "/name_redirect"
	#'?' seperates where I am redirecting to and the values being passed through
end # redirecting you from the end of the erb after submitting to a new get. The variable '+name' is returning the value of what name is. 

=begin
ERB(embedded ruby file); HTML code with additional syntax
The <%...%> is a tag that executes a ruby code within them wihtout returning a value to the page
The <%=...> is a tag that executes a ruby code within it, and prints the returned value of the ruby code.(works like string interpolation in a string that is printed)
In order to use erb, you will need 'erb :' with a space in between the word erb and the colon. The colon is required to be directly in front of the file name you need.
	For example, the 'erb :filename' has Sinatra look in the 'views' folder and find the file that is asked for.
Notes/Comments in erb files
	<!-- your comment here -->

=end

get "/name_redirect" do
	#'parameters/params' are specified by putting a colon directly in front of it. If the ':name' symbol which will then be automatically be added to the 'params' hash by Sinatra
	name = session[:name]
	erb :second_page,locals:{name:name}
end

post "/age" do
	session[:age] = params[:age]
	redirect "/favorite_food"
end

get "/favorite_food" do
	name = session[:name]
	erb :third_page, locals:{name:name}
end

post "/food_drink" do
	session[:food] = params[:food]
	session[:drink] = params[:drink]
	redirect "/favorite_numbers"
end

get "/favorite_numbers" do
	name = session[:name]
	erb :fourth_page, locals:{name:name}
end

post "/numbers" do
	session[:num1] = params[:num1]
	session[:num2] = params[:num2]
	session[:num3] = params[:num3]
	redirect "/favorite_colors"
end

get "/favorite_colors" do
	name = session[:name]
	session[:colors] = params[:colors]
	erb :fifth_page, locals:{name:name}
end

post "/colors" do
	session[:colors] = params[:colors]
	redirect "/results"
	#erb :sixth_page, locals:{name:name, age:age, food:food, drink:drink, number_1:num1, number_2:num2, number_3:num3, colors:fav_colors}
end

get "/results" do
	name = session[:name]
	age = session[:age]
	food = session[:food]
	drink = session[:drink]
	num1 = session[:num1]
	num2 = session[:num2]
	num3 = session[:num3]
	colors = session[:colors]
	erb :sixth_page, locals:{name:name, age:age, food:food, drink:drink, num1:num1, num2:num2, num3:num3, colors:colors}
end