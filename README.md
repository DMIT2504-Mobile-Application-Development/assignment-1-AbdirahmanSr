[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/4v9Zy8o7)
# DMIT2504 Assignment 01 - Dart Language Primer

**Weight:** 10% of final mark

**Submission requirements:** On or before the deadline, push your final solution to the GitHub repository. **You must commit and push to the classroom assignment repository supplied for the assignment**; do not create your own repository. It is your responsibility to ensure that your work is in the correct repository. **_Work not in the repository will not be graded_**.

## Weather API and Data Model

This assignment will require you to sign up for an account with [OpenWeather](https://openweathermap.org/) to use their [current weather API](https://openweathermap.org/current). [Sign up](https://home.openweathermap.org/users/sign_up) for an account to receive your secret API key that can be used to send requests to the OpenWeather API endpoints. Specifically, this assignment will require you to use the [Current weather data](https://openweathermap.org/current) endpoint. Check the documentation to acquaint yourself with the API.

1. Create a Weather Service API

- Create a `services/` directory in the `lib/` directory.
- Create a `weather_api.dart` file in the `services/` directory, this is where you will write your API
  functions.
- The following requirements must be met:
  - The OpenWeather API key must be exported as a constant named `weatherApiKey`
  - The current weather endpoint must be exported as a constant named `currentWeatherEndpoint` with a value that matches the provided format `https://api.openweathermap.org/data/2.5/weather`.
  - A `getWeatherForCity` function must be exported. The function accepts the `city` as a _named parameter_
    and will return the `dynamic` JSON data object received from the OpenWeather API endpoint `https://api.openweathermap.org/data/2.5/weather?units=metric&q={city name}&appid={API key}` (use the `currentWeatherEndpoint` from a previous step above to create the full URL).
    - If the response status code is anything other than 200, throw an `Exception` with a message in the following format: `There was a problem with the request: status <status code> received`.
    - If an exception occurs when accessing the endpoint, throw an `Exception` with a message in the following format: `There was a problem with the request: <original exception message>`.

2. Create a CurrentWeather class

- Create a `models/` directory in the `lib/` directory.
- Create a `current_weather.dart` file in the `models/` directory, this is where you will write your
  `CurrentWeather` class.
- The `CurrentWeather` class requires the following members and methods:
  - private members for:
    - city (string)
    - description (string)
    - currentTemp (double)
    - currentTime (date time)
    - sunrise (date time)
    - sunset (date time)
  - The following getters and setters for the private members
    - all private members must have a getter
    - setter for city must ensure city is not empty
      - throw an `Exception` with message 'City cannot be empty'
    - setter for description must ensure description is not empty
      - throw an `Exception` with message 'Description cannot be empty'
    - setter for currentTemp must ensure currentTemp is between -100 and 100
      - throw an `Exception` with message 'Temperature must be between -100 and 100'
    - setter for currentTemp must ensure currentTime is not in the future
      - throw an `Exception` with message 'Current time cannot be in the future'
    - setter for sunrise must ensure sunrise is on the same day as currentTemp and not after sunrise
      - throw an `Exception` with message 'Sunrise must be on the same day as current time' for the former
      - throw an `Exception` with message 'Sunrise cannot be after sunset' for the latter
    - setter for sunset must ensure sunset is on the same day as currentTemp and not before sunrise
      - throw an `Exception` with message 'Sunset must be on the same day as current time' for the former
      - throw an `Exception` with message 'Sunset cannot be before sunset' for the latter
  - Must have a generative constructor with required named params for each of the members
  - Must have a factory constructor that accepts a single `dynamic` data param representing the OpenWeather data object for the current weather
    - The method must parse out the required fields for the generative constructor and use the generative constructor to produce the object to return
  - Must override the `toString()` method to return a string in the following format:
    - `City: <city>, Description: <description>, Current Temperature: <currentTemp>, Current Time: <currentTime>, Sunrise: <sunrise>, Sunset: <sunset>'` where the angle brackets/values must be replaced with the actual member values.
  - **NOTE: you will need to think about validation for the sunrise and sunset members in the constructor and the setters, since one necessisarily relies of the value of the other.**

## Submission Requirements

Be sure to follow the rules and conventions of the Dart programming language. See [Effective Dart](https://dart.dev/effective-dart) for details. Your code must compile and not throw any unexpected runtime exceptions. **Code that does not compile will not be graded.** Your code must be committed and pushed to the GitHub classroom assignment repository before the deadline. **Any code pushed to the repository after the deadline will not be graded.** If you require clarification or have any questions about the assignment requirements, be sure to contact your instructor as soon as possible. Use the provided automated tests (`$ dart test`) and built-in analyzer (`$ dart analyze`) to check your current work status as you progress on your assignment. The formatting of your code, analysis of your code, and automated tests will all be checked when you push to your assignment repository.

## Marking Rubrics

### Weather API [4%]

| Mark | Description                                                                                                                                                   |
| ---- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 5    | Excellent – program passes all test cases, does not crash for any reason, and codingfollows best practices and class standards                                |
| 4    | Very Good – program passes all test cases, does not crash for any reason, but coding does not follow best practices and class standards                       |
| 3    | Acceptable – coded most the requirements, does not crash for any reason, and program produces the expected results for most of the test cases                 |
| 2    | Needs Work – coded some the requirements, the program crashes on invalid user input or internal processing, and the program fails to produce expected results |
| 1    | Unsatisfactory – code does not meet any of the requirements (some code has been submitted, but does not demonstrate the majority of the assessed outcome(s))  |
| 0    | Not done or the program does not compile                                                                                                                      |

### CurrentWeather Class [6%]

| Mark | Description                                                                                                                                                   |
| ---- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 5    | Excellent – program passes all test cases, does not crash for any reason, and codingfollows best practices and class standards                                |
| 4    | Very Good – program passes all test cases, does not crash for any reason, but coding does not follow best practices and class standards                       |
| 3    | Acceptable – coded most the requirements, does not crash for any reason, and program produces the expected results for most of the test cases                 |
| 2    | Needs Work – coded some the requirements, the program crashes on invalid user input or internal processing, and the program fails to produce expected results |
| 1    | Unsatisfactory – code does not meet any of the requirements (some code has been submitted, but does not demonstrate the majority of the assessed outcome(s))  |
| 0    | Not done or the program does not compile                                                                                                                      |
