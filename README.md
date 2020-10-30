# Battle Ship

## Contributors

[Travis McKinstry](https://github.com/TravisGM92) and [Luke Hunter James-Erickson](https://github.com/LHJE).

## Info

Because this program is so simple, you can just put in the following command into your terminal to clone it into your local computer: `git clone https://github.com/TravisGM92/battle_ship`
<br><br>
- In order to start the battle ship game, after you've cloned a copy into your computer, enter the repo (`cd battle_ship`) and put the following command into your terminal: `ruby runner.rb`

### About this Project 

This was one of the first projects Luke and I did while attending the Turing School of Software & Design backend program. The goal was to create a program using Ruby, that could simulate the popular board game 'Battle Ship'.
<br><br>
Luke and I didn't know much about programming, so we decided to focus a lot on user experience. When you run the program, it feels a lot like a simple CLI game; there's a start screen, there's playful dialogue, etc. Luke and I put a lot of good work into it and have definitely improved a lot since then. 
<br>
<br>
#### -a user can register and subsequently login/logout of the app<br><br>
![Register gif](https://media.giphy.com/media/3LKT2cHV2H1mXtB3I6/source.gif)
<br><br><br>
#### -a user can search through a list of 40 movies, taken from [theMovieDB API](https://developers.themoviedb.org/)<br><br>
![Top 40 Movies](https://media.giphy.com/media/e5LEivhRVFI7LMDx8b/source.gif)
<br><br><br>
#### -a user can then click on a movie, and see details such as; that movie's title, the cast, etc.<br><br>
![Movie show page](https://media.giphy.com/media/bThbLOC44JDcfP1ajK/source.gif)
<br><br>

### Learning Goals 

The purpose of this project was to get first-time practice and implemenation of API exposure and consumption as well as utilization of Continuous Integration using Travis CI. Although not required for this project, we wanted to learn how to mock external HTTP requests, which we were able to achieve with Webmock. We had a goal to implement mocking with VCR, but were unable to reach this goal within our deadline. Refactoring using Facade Design Patter was strongly encouraged for this project, which we decided as a team would be a goal for us. We achieved implementation of this design pattern and in doing so it allowed for better abstraction, encapsulation, single-responsibility. 

We also used knowledge built on previous projects, such as; flash messages, CRUD functionality, MVP design patterns, and more. 

## Features
  - A new user can register with a username, email, and password. We used 'bcrypt' for password security and encryption
  - Once logged in, a user can discover the top 40 movies, as well as search for movies based on a keyword
  - On the movies index page, each movie title is a link, where a user can click to find more information about that particular movie
  - If a user navigates back to their dashboard, they can 'Add Friends'! Search for friends by typing in their email, and if that      email is associated with a registered user, then they will be added as a friend! Friendships are reciprocal, so once added by the user, that two-way friendship is created
  - If a user has added friends, they have the ability to create a viewing party! They can select which friends they would like to invite, and select a movie to show!
  - 'Recommended movies', and 'top rated movies' are both extra pieces of functionality that required additional API calls
  
  ## Wishlist
  - Going forward we would love to incorporate sending an email once a user has either created a viewing party, or been invited to one. This email would serve as a notification, because currently, a user needs to sign into our app to see whether or not they have any viewing parties. This email could also include an option to 'accept' or 'decline' an invitiation
  
  - Incorporaing more JavaScript, especially for the index page to see all the movies. Currently, the styling is basic CSS/HTML cards. Eventually we'd like to be able to have nice styling effects for each movie (hover and the movie info appears, etc.).
  
