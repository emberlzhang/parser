Parser
===========

Description
------------
Parser assembles a single set of records by parsing data from 3 different file formats and then displays these records sorted in 3 different ways.

### Input
A record consists of the following 5 fields: last name, first name, gender, date of birth and favorite color. You will be given 3 files, each containing records stored in a different format.

The pipe-delimited file lists each record as follows: 
LastName | FirstName | MiddleInitial | Gender | FavoriteColor | DateOfBirth
The comma-delimited file looks like this: 
LastName, FirstName, Gender, FavoriteColor, DateOfBirth
The space-delimited file looks like this: 
LastName FirstName MiddleInitial Gender DateOfBirth FavoriteColor

We assume the delimiters (commas, pipes and spaces) do not appear anywhere in the data values themselves. Parser reads in records from these files and combines them into a single set of records.

### Display
Parser displays 3 different views of the recordset:
Output 1 – sorted by gender (females before males) then by last name ascending.
Output 2 – sorted by birth date, ascending.
Output 3 – sorted by last name, descending.

The fields are displayed in the following order: last name, first name, gender, date of birth, favorite color. Display dates in the format MM/DD/YYYY

Parser supports Ruby version 1.9.3p374, rvm 1.18.5.

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

![alt text](https://github.com/janetchang/parser/raw/master/sample_output.png "Sample Terminal Output")