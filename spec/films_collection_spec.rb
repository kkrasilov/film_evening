require 'film'
require 'films_collection'

describe FilmsCollection do
  let(:films) do
    [
      Film.new(title: 'Крестный отец', director: 'Francis Ford Coppola', year: 1972),
      Film.new(title: 'Апокалипсис сегодня', director: 'Francis Ford Coppola', year: 2003)
    ]
  end

  let(:films_collection) { described_class.new(films) }

  describe '#show_director_list' do
    subject(:show_director_list) { films_collection.show_director_list }

    it 'return a list of directors in random order' do
      expect(show_director_list).to be_an Array
      expect(show_director_list.size).to eq 1
      expect(show_director_list).to eq ['1 Francis Ford Coppola']
    end
  end

  describe '#evening_film' do
    subject(:film_evening) do
      films_collection.show_director_list
      films_collection.evening_film(1)
    end

    it 'return one random movie of the selected director' do
      expect(film_evening).to be_an Film
      expect(film_evening.to_s)
        .to eq('Francis Ford Coppola - Крестный отец (1972)') | eq('Francis Ford Coppola - Апокалипсис сегодня (2003)')
    end
  end
end
