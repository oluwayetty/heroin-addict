
puts "Creating Admin user"

admin_user = User.create!(email:"admin-user@user.com", username:"admin-user", admin:true, password:"password", phone_number: '08032157303')

puts "Creating a Supporter user"
supporter_user = User.create!(email:"supporter-user@user.com", username:"supporter-user", supporter:true, password:"password", phone_number: '08032157303')

puts "Done, Admin user and Supporter user created!!!"
