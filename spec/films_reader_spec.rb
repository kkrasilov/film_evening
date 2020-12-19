require 'films_reader'
require 'film'

describe FilmsReader do
  describe '.films_from_url' do
    it 'read all movies from the site and return movies' do
      things = described_class.from_wiki_imdb250

      expect(things).to be_an Array
      expect(things).to all be_a Film
      expect(things.size).to eq 250
      expect(things[0].year).to eq 1994
      expect(things.map(&:director).first(2)).to contain_exactly 'Фрэнк Дарабонт', 'Фрэнсис Форд Коппола'
    end
  end
end
