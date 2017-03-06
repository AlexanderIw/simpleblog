# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Data seed test: hello data!"

User.delete_all
User.create([{name: 'Alexander L', email:"niquepg@example.com",username:"niquepg",
 bio: "adfsazfafafdadfaf", password_digest: "password1", user_level: 5},
 {name: 'Tim D', email:"Tim@example.com",username:"TimToWin",
 bio: "afadfagaga23fafa", password_digest: "password2", user_level: 1}
])

Post.delete_all
Post.create([{user_id:1, title:"Summer Snow", body:"it love me or it love me not", status:"new" },
{user_id:1,title:"Final Fantasy XV is the worste FF", body:"Squaresoft do not love us final fantasy fans anymore!", status:"new" }
])

Hashtag.delete_all
Hashtag.create([{name:"RubyOnRails", relation:"programming", description:"It is like magic"},
{name:"Gaming", relation:"games",description:"One hand is a controller and the other is a keyboard"}
])