require_relative 'film'
require 'open-uri'
require 'nokogiri'

module FilmsReader
  module_function

  def films_from_url(url)
    html = URI.open(url)

    document = Nokogiri::HTML(html)

    document.css("tbody tr").drop(1).map do |item|
      Film.new({
                 title: item.css('td')[1].css('a').text,
                 director: item.css('td')[3].css('a').text,
                 year: item.css('td')[2].css('a').text
               })
    end
  end
end
