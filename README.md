![Known Vulnerabilities](https://snyk.io/test/github/this-is-joeking/leaf-ledger-be/badge.svg)
![Github CI](https://github.com/this-is-joeking/leaf-ledger-be/actions/workflows/rubyonrails.yml/badge.svg)
[![codecov](https://codecov.io/gh/this-is-joeking/leaf-ledger-be/branch/main/graph/badge.svg?token=wNdmzeSeJZ)](https://codecov.io/gh/this-is-joeking/leaf-ledger-be)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)

![Leaf Ledger logo](/app/assets/images/logos/logo-transparent-png.png)

## Table of Contents
- [About Leaf Ledger](#about-leaf-ledger)
- [Deployed Site](#deployed-site)
- [Learning Goals](#learning-goals)
- [Setup](#setup)
- [Tech Stack](#tech-stack)
- [Database Schema](#database-schema)
- [API Requests](#api-requests)
- [APIs Used](#apis-used)



### About Leaf Ledger
Leaf Ledger is a tool for planning your garden and finding information about how to care for the plants in your garden. 

OpenAI's API is used for all gardening information. With the amount of data being requested for each plant the request runs as a background job using Redis/Sidekiq and a flash message will appear when the data is ready (usually within 10 seconds). 

Plant data does not tend to change so as users request new plants the response from OpenAI(ChatGPT) will be stored in the database for faster retrieval on future calls.

An extension that will come shortly after the above is implemented will be to add OpenAI(DALL-E) generated images for the plants as well. Using AWS s3 for image storage.

### Deployed Site
The backend is deployed [here](https://leaf-ledger-be.herokuapp.com/)

### Learning Goals
- Consume OpenAI API to get more experience with AI and chatGPT
- Self teach and implement a React.js front end
- Continued practice of CI/CD and Rails best practices
- Use AWS s3 for image storage

### Setup
This app uses Rails 7.0.5.1 and Ruby 3.2.2

1. Fork and clone this repository
1. `cd` into root directory
1. Run `bundle install`
1. Run `bundle exec figaro install`
1. In `app/config/application.yml` add your API key
    ```
    OPENAI_API_KEY: <API KEY GOES HERE>
    ```
      You can sign up for a OpenAI API key [here](https://platform.openai.com/account/api-keys)
1. Run `rails db:{drop,create,migrate}` to setup the databases
- To run the test suite: Run `bundle exec rspec`
### Tech Stack
- Ruby 3.2.2
- Rails 7.0.5.1

### Database Schema
![datbase diagram](/app/assets/images/db-diagram.png)

### API Requests
- [Get all plants](/docs/api_requests/plant_index.md)
- [Get a plant](/docs/api_requests/plant_show.md)
### APIs Used

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
