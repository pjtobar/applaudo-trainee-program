# Date validator

validation of dates in a given file, for conversion to time zone EST sorted from earliest date to latest. Two files are generated, one with results of valid dates and the other with invalid dates. A graph is generated with the results obtained from the validation

## Starting 🚀

Mira **Deployment** para conocer como desplegar el proyecto.


### Pre requirements 📋

- Ruby v2.5.3
- events.csv file

### Executing project 🔧

- Open the linux bash
- navigate to the folder called week2 that contains the project and execute the command:

```
ruby timezone.rb
```
- enter the name of the two resulting files.
  First the name of the file for valid dates.
  second the name of the file for invalid dates

- will be displayed in bash, the line number of the source file where the invalid date is
- A graph will be shown in bash with the results obtained from the evaluation of dates (valid dates and invalid dates)
- The resulting files are generated in the folder that contains the execution file timezone.rb
