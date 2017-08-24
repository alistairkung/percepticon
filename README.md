# Percepticon
[![Build Status](https://travis-ci.org/tbscanlon/percepticon.svg?branch=master)](https://travis-ci.org/tbscanlon/percepticon)
[![Stories in Ready](https://badge.waffle.io/tbscanlon/percepticon.svg?label=ready&title=Ready)](http://waffle.io/tbscanlon/percepticon)

Send an article headline found on the Internet and THE PERCEPTICON will tell you if it's good or bad journalism!

[The API is live here](https://perceptron.herokuapp.com) - it's an API only Rails project so there's now views. See the front-end demo for instructions on how to use it.

[Check out the Frontend demo for a demonstration](http://www.github.com/tbscanlon/percepticon-frontend)

This was created as part of the final project at [Makers Academy](www.makersacademy.com). It is a sample implementation of a (pre-taught) Perceptron algorithm that's accessible using a HTTP GET request.

Other components of the final project:
- [Percepticon Frontend](http://www.github.com/tbscanlon/percepticon-frontend)
- [Perceptron](https://github.com/terminalobject/Perceptron)

Tech used in this project:
- Rails
- PostgreSQL
- Heroku
- TravisCI

## Installation

1. Clone this repo by running `git clone git@github.com:tbscanlon/percepticon.git`
2. Install dependencies by running `bundle install` (you may need to `gem install bundle`)
3. Set up the databases: `bin/rake db:migrate`

## Usage
### Article Titles Considered Bad
1. Launch the server by running `bin/rails s`
2. Send a GET request to the following route, with a query string similar to the example:

```
http://localhost:3000/scores/new?title="22 Weird Pictures of Kim Kardashian that Broke the Internet"
```

You'll get a response back with the following JSON object:
```
"created_at": "2017-08-24T16:59:53.118Z",
"expected": null,
"id": 26,
"result": 1,
"updated_at": "2017-08-24T16:59:53.144Z",
"vector": [
    "1",
    "1",
    "1",
    "1",
    "0",
    "0"]
}
```

A result greater than ```0``` indicates a bad article title.

### Article Titles Considered Good
1. Launch the server by running `bin/rails s`
2. Send a GET request to the following route, with a query string similar to the example:

```
http://localhost:3000/scores/new?title="Businesses Uncertain over Brexit"
```

You'll get a response back with the following JSON object:
```
"created_at": "2017-08-24T16:59:53.118Z",
"expected": null,
"id": 26,
"result": 0,
"updated_at": "2017-08-24T16:59:53.144Z",
"vector": [
    "1",
    "0",
    "0",
    "0",
    "0",
    "0"]
}
```

A result equal to ```0``` indicates a good article title.

## Credits
Created by *Team Vectorspace*:
- [Alistair Kung](https://github.com/alistairkung)
- [Alessandro Noiato](https://github.com/terminalobject)
- [Corina Gheorghe](https://github.com/corina)
- [Jini Coroneo](https://github.com/jinimcoroneo)
- [Tom Scanlon](https://github.com/tbscanlon)
