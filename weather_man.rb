# frozen_string_literal:true

require_relative 'file_reader'

# Getting and passing arguments
class WeatherMan
  include FileReader

  def pass_arguments
    if ARGV.length != 3
      puts 'Invalid number of Arguments!'
      exit
    end
    month = 0
    # year = 0
    # Spliting into year/month
    str = ARGV[1].split('/')
    year = str[0].to_i
    month = str[1].to_i if str.length == 2
    return year, month
  end

  def weather_input
    year, month = pass_arguments

    case ARGV[0]

    when '-a'
      month.zero? ? FileReader.readfile_year(year) : (puts 'Valid for Year only!')
    when '-b', '-c', '-d'
      FileReader.readfile_month(ARGV[0], year, month)
    end
  end
end

WeatherMan.new.weather_input
