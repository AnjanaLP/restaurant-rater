# Restaurant-Rater
An application to duplicate the core functionality of Yelp, using Rails' MVC architectural pattern to divide concerns and Minitest for full model, controller and integration tests to experience a new testing framework. I have also decided to build out full user signup, login and authorisation from scratch without the use of a gem to gain a deeper understanding of the system to make customisation of any gems easier in future. I have configured the production application to use SSL & Puma and deployed to Heroku.

## Specifications
- Logged in users can create new restaurants - specifying the name, city, county and cuisine type as minimum requirements
- Logged in users can leave reviews for restaurants - they must provide a numerical score (1-5) and a comment (maximum 1000 characters) about their experience
- Logged in users can change their profile information
- Any user can visit the profile pages of other users to see a history of their reviews in reverse chronological order
- Any user can search for restaurants based on their required criteria (by name/ location /cuisine type)
- The search returns a list of restaurants matching the search criteria. Selecting a restaurant forwards the user to the restaurant's profile page.
- The restaurant's profile page displays the information provided on creation, all reviews in reverse chronological order, and its average rating
- Ratings and average ratings are displayed as stars rather than numbers
- Pagination for restaurant lists and reviews, displaying a maximum of 30 per page
- Use of Bootstrap & SCSS to enhance the overall design of the site
- Use of partials to refactor more complex views and render collections
- Use of helper methods
- Friendly forwarding by redirecting the user to the protected page they were trying to access before being prompted to login
- Admin status required to edit/delete restaurants and delete users.

### Homepage
![Imgur](https://i.imgur.com/vzGjePT.png?1)

### Signup page
![Imgur](https://i.imgur.com/eR9bFLQ.png?3)

### Search results
![Imgur](https://i.imgur.com/tENBTxG.png?1)

### Restaurant profile page
![Imgur](https://i.imgur.com/eEjgT5j.png?1)

### Admin rights
![Imgur](https://i.imgur.com/NZtXVCt.png?1)

## How to use
Visit https://anjana-restaurant-rater.herokuapp.com<br>

To use the app locally, please follow the below instructions:

### Install project dependencies
Clone the repo to your local machine, change into the directory, then:
```
$ bundle install
```

### Setup the databases
```
$ rails db:create
$ rails db:migrate

```

### Run the app
```
$ rails server
```
Visit http://localhost:3000

### Run tests
```
$ rails test
```

## Technologies used
* Bootstrap
* CSS
* Heroku
* HTML
* JavaScript
* jQuery
* PostgreSQL
* Ruby on Rails 
