# Программа "Фильм на вечер".
# Программа должна выводить список режиссеров
# и спрашивать у пользователя, фильм какого режиссера он хочет посмотреть.
require_relative 'lib/films_reader'
require_relative 'lib/films_collection'

# IMDb Charts
# Top Rated Movies
url = 'https://ru.wikipedia.org/wiki/250_%D0%BB%D1%83%D1%87%D1%88%D0%B8%D1%85_%D1%84%D0%B8%D0%BB%D1%8C%D0%BC%D0%BE%D0%B2_%D0%BF%D0%BE_%D0%B2%D0%B5%D1%80%D1%81%D0%B8%D0%B8_IMDb'

films = FilmsReader.films_from_url(url)

films_collection = FilmsCollection.new(films)

puts 'Программа «Фильм на вечер».'
puts 'Фильм какого режисера из списка Вы хотели бы посмотреть?'

puts films_collection.show_director_list

puts 'Ваш ответ: '
user_choice = STDIN.gets.to_i

puts 'И сегодня вечером рекомендую посмотреть:'
puts films_collection.evening_film(user_choice)
