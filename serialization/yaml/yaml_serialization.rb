require 'yaml'

# Deserialize Yaml into data astructures
teaching = YAML.load(File.read('teaching.yml'))

# Serialize data structures into Yaml
File.open('card_numbers.yml', 'w') do |file|
  file.puts schedule.to_yaml
end
