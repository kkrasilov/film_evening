# Программа "Фильм на вечер".
# Программа должна выводить список режиссеров
# и спрашивать у пользователя, фильм какого режиссера он хочет посмотреть.
require_relative 'lib/films_reader'
require_relative 'lib/films_collection'

# IMDb Charts
# Top Rated Movies
url = 'https://www.imdb.com/chart/top/?ref_=nv_mv_250/?is-redirected=1/'

films = FilmsReader.films_from_url(url)

films_collection = FilmsCollection.new(films)

puts 'Программа «Фильм на вечер».'
puts 'Фильм какого режисера из списка Вы хотели бы посмотреть?'

puts films_collection.show_director_list

puts 'Ваш ответ: '
user_choice = STDIN.gets.to_i

puts 'И сегодня вечером рекомендую посмотреть:'
puts films_collection.evening_film(user_choice)
