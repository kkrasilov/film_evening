require 'films_reader'
require 'film'

describe FilmsReader do
  describe '.films_from_url' do
    it 'read all movies from the site and return movies' do
      things = described_class.films_from_url("#{__dir__}/fixtures/index.html")

      expect(things).to be_an Array
      expect(things).to all be_a Film
      expect(things.size).to eq 3
      expect(things[0].year).to eq 1994
      expect(things.map(&:director)).to contain_exactly 'Frank Darabont',
                                                        'Francis Ford Coppola', 'Christopher Nolan'
    end
  end
end
