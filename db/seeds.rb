
puts "Creating Admin user"

admin_user = User.create!(email:"admin-user@user.com", username:"admin-user", admin:true, password:"password")

puts "Creating a Supporter user"
supporter_user = User.create!(email:"supporter-user@user.com", username:"supporter-user", supporter:true, password:"password")

puts "Done, Admin user and Supporter user created!!!"
