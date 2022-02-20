# Hacker News

## Tutorial

### Structure

```
lib
├── constants
├────── app constants
├── controllers
├────── getx controller to manage the state of the app
├── models
├────── data model of the app
├── screens
├────── screens which consume controllers and models
├── services
├────── external services
├── theme
├────── themes data
├── views
├────── common UI components
├── views
├────── common UI components
└── main.dart
```

### Model

Create a model using `https://app.quicktype.io/`

### Service

Create Services to fetch data and map with model

### Controller

1. Created different controllers to manage the state of various types of data such as top, new, best

2. Feed data to infinite scroll pagination to create infinite UX experience and also support refresh

3. Created like controller to manage the state of likes as well as read/write to disk

### Theme

1. Created light and dark theme
2. Created Text components while keeping system theme color

## Development

### install dependencies

```code
$ flutter pub get
```

### Run app

```code
$ flutter run
```
