require 'yaml'


# Serialize the data
File.open('card_numbers.yml', 'w') do |file|
  file.puts schedule.to_yaml
end

# Deserialize the data
teaching = YAML::load(File.read('teaching.yml'))
