# Hacker News

Flutter News App

## Demo (Gif)

![Demo](hnapp_demo.gif)

## Features

- Theme support (light/dark)
- Nexted Infinite Scroll for a better UX
- Seperation of concerns ie UI, Services, Controller, Model
- I/O operation
- Design System

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

#### Model

Create a model using `https://app.quicktype.io/`

#### Service

Create Services to fetch data and map with model

#### Controller

1. Created different controllers to manage the state of various types of data such as top, new, best

2. Feed data to infinite scroll pagination to create infinite UX experience and also support refresh

3. Created like controller to manage the state of likes as well as read/write to disk

#### Theme

1. Created light and dark theme
2. Created Text components while keeping system theme color

### How load the data

#### Challenge

top, new, best api sends 500 items at a time; loading 500 stories for all 3 types means loading 1500 stories which will slow down initial loadtime

#### Solutiosn

1. fetch ids of each stories ie 3 api calls
2. for each page, load first 20 stories
3. as user scrolls, keep fetching preceeding 20 stories
4. on refresh fresh everything and start with 1

## Development

### install dependencies

```code
$ flutter pub get
```

### Run app

```code
$ flutter run
```
