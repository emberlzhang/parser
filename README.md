Parser
===========

Description
------------
Parser will parse and display demographic data, given text files as input. Text files can present the data in pipe-, comma-, or space-delimited format.

For example, comma-delimited data: "Abercrombie, Neil, Male, Tan, 2/13/1943"

Output can be sorted by gender, last name, or birthdate.

Usage
-----
To see the demo:

1. Fork the repo.
2. Navigate to the directory.
``` ruby
cd parser
```
3. Run the application.
``` ruby
ruby application.rb
```
4. View program outout with demo files:
``` 
Output 1\n
Hingis Martina Female 4/2/1979 Green\n
Kelly Sue Female 7/12/1959 Pink\n
Kournikova Anna Female 6/3/1975 Red\n
Seles Monica Female 12/2/1973 Black\n
Abercrombie Neil Male 2/13/1943 Tan\n
Bishop Timothy Male 4/23/1967 Yellow\n
Bonk Radek Male 6/3/1975 Green\n
Bouillon Francis Male 6/3/1975 Blue\n
Smith Steve Male 3/3/1985 Red\n
Output 2\n
Abercrombie Neil Male 2/13/1943 Tan\n
Kelly Sue Female 7/12/1959 Pink\n
Bishop Timothy Male 4/23/1967 Yellow\n
Seles Monica Female 12/2/1973 Black\n
Bonk Radek Male 6/3/1975 Green\n
Bouillon Francis Male 6/3/1975 Blue\n
Kournikova Anna Female 6/3/1975 Red\n
Hingis Martina Female 4/2/1979 Green\n
Smith Steve Male 3/3/1985 Red\n
Output 3\n
Smith Steve Male 3/3/1985 Red\n
Seles Monica Female 12/2/1973 Black\n
Kournikova Anna Female 6/3/1975 Red\n
Kelly Sue Female 7/12/1959 Pink\n
Hingis Martina Female 4/2/1979 Green\n
Bouillon Francis Male 6/3/1975 Blue\n
Bonk Radek Male 6/3/1975 Green\n
Bishop Timothy Male 4/23/1967 Yellow\n
Abercrombie Neil Male 2/13/1943 Tan\n
```