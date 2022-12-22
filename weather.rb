# frozen_string_literal:true

# Weather class to hold weather data
class Weather
  attr_accessor :date, :temp_max, :temp_mean, :temp_min, :humidity_max, :humidity_mean, :humidity_min

  def initialize(date, temp_max, temp_mean, temp_min, humidity_max, humidity_mean, humidity_min)
    @date = date
    @temp_max = temp_max.to_i
    @temp_mean = temp_mean.to_i
    @temp_min = temp_min.to_i
    @humidity_max = humidity_max.to_i
    @humidity_mean = humidity_mean.to_i
    @humidity_min = humidity_min.to_i
  end

  def to_s
    puts "#{@date} #{@temp_max} #{@temp_mean} #{@temp_min} #{@humidity_max} #{@humidity_mean} #{@humidity_min} "
  end
end
