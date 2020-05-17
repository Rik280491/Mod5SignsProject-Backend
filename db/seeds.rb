# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



u1 = User.create(username:"master", password:"master")

signVideos = Cloudinary::Api.resources(options = {
    :resource_type => :video,
    :max_results => 1000
})
    
names = ["Happy", "Toilet", "Thanks", "Woman", "Sorry", "Sad", "Man", "How are you", "Morning", "Evening", "Goodbye", "Hello", "Afternoon", "Good", "Angry", "Child"]




    
   signVideos["resources"].zip(names).each do |sign, name|
    p url = sign["secure_url"] 
    p sign_name = name
    new_sign = Sign.create(name: sign_name)
    Video.create(video_url: url, user: u1, sign: new_sign)
 

end


