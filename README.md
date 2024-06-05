# MessageMe
This project was developed in order to demonstrate the ability to manipulate the DOM through a WebSocket channel in Hotwire Turbo's streams, broadcasts and frames in addition to supporting authentication and a authorization. Furthermore, this project was created in order to learn how to build, test and deploy a Ruby on Rails project with CI/CD capabilities. 

## This project was developed with:

* Ruby 3.2.2

* Rails 7.1.3.2

* SQLite3

* SemanticUI

* JQuery

### Hotwire's Turbo
Hotwire's Turbo package has become a standard in Ruby on Rails 7 allowing for real time DOM manipulation through Turbo frames and streams which allow you to stream to a specific frame another frame. In this project users are able to edit their profiles on their profile page as well as admin users can edit other users on their respective profile pages. This allows for minimal page reloading. Additionally, the main feature on this project is a chatroom where users can message one another and see the message board update in real time. With Turbo Broadcasts this project utilizes a Websocket channel to listen to updates to the messages index and updates the message board as needed with some help from JQuery. 

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
