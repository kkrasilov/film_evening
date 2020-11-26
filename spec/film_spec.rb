require 'film'

describe Film do
  let(:film) do
    described_class.new({
                          title: 'Карты, деньги, два ствола',
                          director: 'Гай Ричи',
                          year: '1998'
                        })
  end

  describe '.new' do
    it 'creates new object with given title, director, year' do
      expect(film.title).to eq 'Карты, деньги, два ствола'
      expect(film.director).to eq 'Гай Ричи'
      expect(film.year).to eq 1998
    end
  end

  describe '#to_s' do
    it 'returns a string with all the data' do
      expect(film.to_s).to eq 'Гай Ричи - Карты, деньги, два ствола (1998)'
    end
  end
end
