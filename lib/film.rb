# Класс Фильмов.
class Film
  attr_reader :title, :director, :year

  def initialize(params)
    @title = params[:title]
    @director = params[:director]
    @year = params[:year].to_i
  end

  def to_s
    "#{@director} - #{@title} (#{@year})"
  end
end
