require "sinatra"
require "sinatra/reloader"
get "/" do # directs to the home page (root directory). 'get' goes to a page
	erb :first_page # directs from 'first_page' erb(embedded ruby) file
end 
post "/name" do # 'post' comes from a page. 'name' is the action that comes from the erb file
	name = params[:name] # brings parameters from input forms, from the erb
	redirect "/name_redirect?name="+ name 
	#'?' seperates where I am redirecting to and the values being passed through
end # redirecting you from the end of the erb after submitting to a new get. The variable '+name' is returning the value of what name is. 

get "/name_redirect" do
	f_name = params[:name]
	erb :second_page,locals:{first_name:f_name}
end
post "/age" do
	f_name = params[:f_name]
	age = params[:age]
	redirect "/favorite_food?f_name="+ f_name + "&age=" + age
end

get "/favorite_food" do
	f_name = params[:f_name]
	age = params[:age]
	erb :third_page, locals:{f_name:f_name, age:age}
end
post "/food_drink" do
	# "hello world"
	
	f_name = params[:f_name]
	age = params[:age]
	food = params[:food]
	drink = params[:drink]
	redirect "/favorite_numbers?f_name="+ f_name + "&age=" + age + "&food=" + food + "&drink=" + drink
end

get "/favorite_numbers" do
	f_name = params[:f_name]
	age = params[:age]
	food = params[:food]
	drink = params[:drink]
	erb :fourth_page, locals:{f_name:f_name, age:age, food:food, drink:drink}
end
post "/numbers" do
	f_name = params[:f_name]
	age = params[:age]
	food = params[:food]
	drink = params[:drink]
	num1 = params[:number_1]
	num2 = params[:number_2]
	num3 = params[:number_3]
	redirect "/favorite_colors?f_name="+ f_name + "&age=" + age + "&food=" + food + "&drink=" + drink + "&number_1=" + num1 + "&number_2=" + num2 + "&number_3=" + num3
end

get "/favorite_colors" do
	f_name = params[:f_name]
	age = params[:age]
	food = params[:food]
	drink = params[:drink]
	num1 = params[:number_1]
	num2 = params[:number_2]
	num3 = params[:number_3]
	erb :fifth_page, locals:{f_name:f_name, age:age, food:food, drink:drink, number_1:num1, number_2:num2, number_3:num3}
end
post "/colors" do
	f_name = params[:f_name]
	age = params[:age]
	food = params[:food]
	drink = params[:drink]
	num1 = params[:number_1]
	num2 = params[:number_2]
	num3 = params[:number_3]
	fav_colors = params[:colors]
	erb :sixth_page, locals:{f_name:f_name, age:age, food:food, drink:drink, number_1:num1, number_2:num2, number_3:num3, colors:fav_colors}
end

	

