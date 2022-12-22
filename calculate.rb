# frozen_string_literal:true

require 'date'
require 'colorize'

# Calculating and printing required info
module Calculate
  def self.calculate_for_month(weather_data, method, year, month)
    avg_highest_temp = weather_data.sum(&:temp_max) / weather_data.size
    avg_lowest_temp = weather_data.sum(&:temp_min) / weather_data.size
    avg_humidity = weather_data.sum(&:humidity_mean) / weather_data.size
    print_month_data(weather_data, avg_highest_temp, avg_lowest_temp, avg_humidity, method, year, month)
  end

  def self.calculate_for_year(weather_data, year)
    begin
      max_temp = weather_data.max_by(&:temp_max)
      min_temp = weather_data.min_by(&:temp_min)
      max_humid = weather_data.max_by(&:humidity_max)
    rescue StandardError
      print ' Year is not Valid! '
      exit
    end
    print_year_data(max_temp, min_temp, max_humid, year)
  end

  def self.show_data_for_b(avg_highest_temp, avg_lowest_temp, avg_humidity, month, year)
    puts "Highest and Lowest Average Temperature and Average Humidity in #{month}/#{year}\n"
    puts "Highest Average Temperature: #{avg_highest_temp}C"
    puts "Lowest Average Temperature: #{avg_lowest_temp}C"
    puts "Average Humidity: #{avg_humidity}C"
  end

  def self.show_data_for_c(weather_data, month, year)
    puts "Highest and Lowest Temperature on Each Day in #{month}/#{year}\n"
    weather_data.each do |data|
      print "#{data.date.split('-')[2]}" if data.temp_max != 0
      data.temp_max.times { print '+'.red }
      print "#{data.temp_max}C\n#{data.date.split('-')[2]}" if data.temp_max != 0
      data.temp_min.times { print '+'.blue }
      print " #{data.temp_min}C\n" if data.temp_max != 0
    end
  end

  def self.show_data_for_d(weather_data, month, year)
    puts "Highest and Lowest Temperature on Each Day in #{month}/#{year}\n"
    weather_data.each do |data|
      print "#{data.date.split('-')[2]} " if data.temp_max != 0
      data.temp_min.times { print '+'.blue }
      data.temp_max.times { print '+'.red }
      print " #{data.temp_min}C-#{data.temp_max}C\n" if data.temp_max != 0
    end
  end

  def self.print_month_data(weather_data, avg_highest_temp, avg_lowest_temp, avg_humidity, method, year, month)
    case method
    when '-b'
      show_data_for_b(avg_highest_temp, avg_lowest_temp, avg_humidity, month, year)
    when '-c'
      show_data_for_c(weather_data, month, year)
    when '-d'
      show_data_for_d(weather_data, month, year)
    end
  end

  def self.print_year_data(max_temp, min_temp, max_humid, year)
    puts "Highest and Lowest Temperature and Highest Humidity in #{year}\n"
    puts "Highest On #{max_temp.date} #{max_temp.temp_max}C"
    puts "Lowest On #{min_temp.date} #{min_temp.temp_min}C"
    puts "Humidity On #{max_humid.date} #{max_humid.humidity_max}C"
  end
end
