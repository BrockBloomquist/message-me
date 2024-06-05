# MessageMe
This project was developed in order to demonstrate the ability to manipulate the DOM through a WebSocket channel in Hotwire Turbo's streams, broadcasts and frames in addition to supporting authentication and a authorization. Furthermore, this project was created in order to learn how to build, test and deploy a Ruby on Rails project with CI/CD capabilities. 

## This project was developed with:

* Ruby 3.2.2

* Rails 7.1.3.2

* SQLite3

* SemanticUI

* JQuery

## CI/CD
It is important to note that this project's Github workflows/actions were implemented to catch, not fix formatting and security vulnerabilites in packages that are utilizing in this project. All fixes must be done in a PR/Commit on their own with the command line.

### Database
* SQLite3 - Local machine usage
* postgreSQL - Github workflow usage(will be main database eventually)


### Security Gems
* Brakeman
* Bundler-Audit
* Ruby Audit


### Linter
* Rubocop
