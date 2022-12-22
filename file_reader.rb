# frozen_string_literal:true

require_relative 'weather'
require_relative 'calculate'
require 'date'

# Reading files
module FileReader
  include Calculate
  attr_accessor :weather_data

  def initialize
    @weather_data = []
  end

  # Reading File with both Year and Month
  def self.readfile_month(method, year, month)
    @weather_data = []
    begin
      month = Date::MONTHNAMES[month][0..2]
      file = File.open("#{ARGV[2]}_#{year}_#{month}.txt")
    rescue StandardError
      puts 'Invalid Input!'
      exit
    end
    @weather_data = read_lines(file, year)
    Calculate.calculate_for_month(@weather_data, method, year, month)
  end

  # Reading File for all the months for required year
  def self.readfile_year(year)
    Dir.glob("#{ARGV[2]}_#{year}**.txt").each do |filename|
      file = File.open(filename)
      @weather_data = read_lines(file, year)
    end
    Calculate.calculate_for_year(@weather_data, year)
  end

  # Read lines of File and return weather_data
  def self.read_lines(file, year)
    @weather_data = []
    file.readline.strip.empty?
    file.each_line do |line|
      line = line.split(',')
      next unless line[0].include?(year.to_s)

      @weather_data.append(Weather.new(line[0], line[1], line[2], line[3], line[7], line[8], line[9]))
    end
    return @weather_data
  end
end
