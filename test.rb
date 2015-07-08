def string_shuffle(s)
	s.split('').shuffle.join
end
string_shuffle("foobar")

person1 = { first: "爸爸", last: "dady"}
person2 = { first: "mama", last: "mom"}
person3 = { first: "小刚", last: "xiaogang"}
params = { father: person1, mother: person2, child: person3  }

params[:child][:first]

a = { "a" => 100, "b" => 200 }.merge({ "b" => 300 })
puts a