require_relative 'personcontroller'

people = PersonController.new("pipe.txt", "pipe")
people.add_file("comma.txt", "comma")
people.add_file("space.txt", "space")
people.parsed
people.save_and_view_by("gender")
people.save_and_view_by("birthdate")
people.save_and_view_by("last_name")
puts people.print_content