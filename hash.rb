# HASH
# ----
person = {first_name: 'Soumya', last_name: 'Ray', country: 'India'}
# => {:first_name=>"Soumya", :last_name=>"Ray", :country=>"India"}
learned_ruby = { 'soumya' => 2013, 'lee' => 2014, 'james' => 2015, 'angelina' => 2015 }
# => {"soumya"=>2013, "lee"=>2014, "james"=>2015}

learned_ruby['soumya']           # => 2012
learned_ruby['soumya'] = 2012

learned_ruby.count               # => 4
learned_ruby.keys                # => ["ray", "lee", "james", "angelina"]
learned_ruby.values              # => [2012, 2014, 2015, 2015]

learned_ruby['ray']                              # => nil
learned_ruby.default = :unknown
learned_ruby['ray']                              # => :unknown

learned_ruby.select { |key, value| value == 2015 }
# => {"james"=>2015, "angelina"=>2015}

learned_ruby.has_key?('soumya')                  # => true
learned_ruby.has_key?('ray')                     # => false

learned_ruby.each { |person, year| puts "#{person} learned Ruby in #{year}" }
# soumya learned Ruby in 2013
# lee learned Ruby in 2014
# james learned Ruby in 2015
# angelina learned Ruby in 2015

learned_ruby.select { |_, year| year == Time.now.year }
# => {"james"=>2015, "angelina"=>2015}

learned_ruby.map { |person, year| "(#{person}, #{year})" }
# => ["(soumya, 2013)", "(lee, 2014)", "(james, 2015)", "(angelina, 2015)"]

learned_ruby.to_a
# => [["soumya", 2013], ["lee", 2014], ["james", 2015], ["angelina", 2015]]
