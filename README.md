# Tekken Frame Data App

## Project Description

Hello, and welcome to my app. As a project to explore and practice Rails, I wanted to make a website centered around something I love: fighting games, and sepcifically the game Tekken 7. All fighting games have characters with a lot of moves that players study obsessively to inorder to inform their desicion making mid-match. The characteristics for each move are broken down into characteristics that each move has and referred to as frame data.

I want to create a site for users to look up frame data for each character, with an attached forum to discuss the ins and outs, while also acting as a place to community build.

## Technologies Used

* Ruby on Rails
* Bulma
* API
* CSS


## Installiation

* Clone the repo to your computer
* Navigate to the directory and run `bundle install`
* run `rails db:migrate` and `rails db:seed`. This should take a couple seconds. The api has to pull 8460 moves and 45 characters.
* run `rails s`
* The site should be live at http://localhost:3000/

## Schema

My model schema is this:

A character <-> has many moves, that belong to a character

A forum <-> belongs to a character

A forum has many <-> posts and a post belongs to a user

A user has many <-> posts and a post belongs to a user

A favorite belongs to a User, and a character

## User Stories

My basic user stories are:

* A user can look up characters and their moves
* A user can make posts on a forum related to a specific character
* A user can edit and delete their own posts
* A user can read other user's posts, and look at those user's pages
* A user can edit thier own page
* A user can favorite a character and have a link to that character's page show up on thier page

## Walkthrough of Site Functionality:

The homepage for the app shows a welcome message, as well as login and signup buttons. The user can use either one to login, the signup will make a new user class for that user. After login, the site will redirect back to the page the user was on before. When seeing the home page while logged in, the user will see a message to them and a logout buttons.

At the top of the page, on the layout, there will always be buttons to the home page, character index page, and forum index pages. There are also login, signup, logout, and profile page buttons for the user depending on if they are logged in or not.

The character index page has all the characters images laid out in a grid, with buttons with their names on it that are links to that individual character's show page.

The individual character's show page 

## Stretch Goals

I'd honestly like to do a lot, here is what I have in mind. I'm prepared to not be able to do all these, but it would be neat to do.

* Limit how many posts show up on a forum page. Add buttons to load the next or previous batch of however many.

* Add search functionality for moves

* super fancy: Let users submit change requests for character pages/ move data. The admin would get an email about the request, and can see pending requests on an admin page. I need to research this. 