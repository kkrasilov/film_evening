# Программа "Фильм на вечер".
# Программа должна выводить список режиссеров
# и спрашивать у пользователя, фильм какого режиссера он хочет посмотреть.
require_relative 'lib/films_reader'
require_relative 'lib/films_collection'

films = FilmsReader.from_wiki_imdb250

films_collection = FilmsCollection.new(films)

puts 'Программа «Фильм на вечер».'
puts 'Фильм какого режисера из списка Вы хотели бы посмотреть?'

puts films_collection.show_director_list

puts 'Ваш ответ: '
user_choice = STDIN.gets.to_i

puts 'И сегодня вечером рекомендую посмотреть:'
puts films_collection.evening_film(user_choice)
