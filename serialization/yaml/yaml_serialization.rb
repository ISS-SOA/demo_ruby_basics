# rubocop:disable all
require 'yaml'

schedule = [
             { name: 'Soumya', id: 4985, days: ['M', 'F'] },
             { name: 'Galit',  id: 5483, days: ['T', 'W'] }
           ]

# Serialize data structures into Yaml
File.write('teaching.yml', schedule.to_yaml)

# Deserialize Yaml into data astructures
teaching = YAML.load(File.read('teaching.yml'))
