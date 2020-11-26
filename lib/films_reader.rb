require_relative 'film'
require 'open-uri'
require 'nokogiri'

module FilmsReader
  module_function

  def films_from_url(url)
    html = URI.open(url)

    document = Nokogiri::HTML(html)

    document.css('td.titleColumn').map do |item|
      Film.new({
                 title: item.css('a').text,
                 director: item.at('a')['title'].split(' (dir.)')[0],
                 year: item.css('span').text.delete('()')
               })
    end
  end
end
