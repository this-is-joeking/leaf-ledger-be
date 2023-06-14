![Known Vulnerabilities](https://snyk.io/test/github/this-is-joeking/leaf-ledger-be/badge.svg)
![Github CI](https://github.com/this-is-joeking/leaf-ledger-be/actions/workflows/rubyonrails.yml/badge.svg)
[![codecov](https://codecov.io/gh/this-is-joeking/leaf-ledger-be/branch/main/graph/badge.svg?token=wNdmzeSeJZ)](https://codecov.io/gh/this-is-joeking/leaf-ledger-be)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)

![Leaf Ledger logo](/app/assets/images/logos/logo-transparent-png.png)


Leaf Ledger is a tool for planning your garden and finding information about how to care for the plants in your garden. 

It will use OpenAI's API for all gardening information. With the amount of data being requested for each plant the request runs as a background job using Redis/Sidekiq and a flash message will appear when the data is ready (usually within 10 seconds). 

Plant data does not tend to change so as users request new plants the response from OpenAI(ChatGPT) will be stored in the database for faster retrieval on future calls.

An extension that will come shortly after the above is implemented will be to add OpenAI(DALL-E) generated images for the plants as well.

![datbase diagram](/app/assets/images/db-diagram.png)
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
