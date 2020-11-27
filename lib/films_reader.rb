require_relative 'film'
require 'open-uri'
require 'nokogiri'

module FilmsReader
  module_function

  WIKI_URL = 'https://ru.wikipedia.org/wiki/250_лучших_фильмов_по_версии_IMDb'.freeze

  def from_wiki_imdb250
    html = URI.open(URI.escape(WIKI_URL))

    document = Nokogiri::HTML(html)

    document.css("tbody tr").drop(1).map do |item|
      Film.new(
        title: item.css('td')[1].css('a').text,
        director: item.css('td')[3].css('a').text,
        year: item.css('td')[2].css('a').text
      )
    end
  end
end
