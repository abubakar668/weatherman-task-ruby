***WeatherMan Task***

Description:

This is an application that generates the following reports.

1. For a given year display the highest temperature and day, lowest temperature and day, most humid day and humidity.

2. For a given month display the average highest temperature, average lowest temperature, average humidity.

3. For a given month draw two horizontal bar charts on the console for the highest and lowest temperature on each day. Highest in red and lowest in blue.

4. BONUS TASK. For a given month draw one horizontal bar chart on the console for the highest and lowest temperature on each day. Highest in red and lowest in blue.


The results are being calculated by fetching data from files of different cities and years and calculating the required information from them.



How to run the program:
=> The command is run on the terminal with filename and other arguments as follows:
         
        ruby Start_weather_man.rb -{method} {year} /path/to/filesFolder

In this case it is:
 
1. For a given year display the highest temperature and day, lowest temperature and day, most humid day and humidity.
        ruby Start_weather_man.rb -a 2008 lahore_weather/lahore_weather  

2. For a given month display the average highest temperature, average lowest temperature, average humidity.
        ruby Start_weather_man.rb -b 2008/6 lahore_weather/lahore_weather

3. For a given month draw two horizontal bar charts on the console for the highest and lowest temperature on each day. Highest in red and lowest in 
        ruby Start_weather_man.rb -c 2008/6 lahore_weather/lahore_weather

4. For a given month draw one horizontal bar chart on the console for the highest and lowest temperature on each day. Highest in red and lowest in blue.
        ruby Start_weather_man.rb -d 2008/6 lahore_weather/lahore_weather


Requirements to run the program:
=> Ruby must be installed
