# Tekken Frame Data App

## Project Description

Hello, and welcome to my app. As a project to explore and practice Rails, I wanted to make a website centered around something I love: fighting games, and sepcifically the game Tekken 7. All fighting games have characters with a lot of moves that players study obsessively to inorder to inform their desicion making mid-match. The characteristics for each move are broken down into characteristics that each move has and referred to as frame data.

I want to create a site for users to look up frame data for each character, with an attached forum to discuss the ins and outs, while also acting as a place to community build.

## Schema

My basic beginning schema is this:

A character <-> has many moves, that belong to a character

A forum <-> belongs to a character

A forum has many <-> posts and a post belongs to a user

A user has many <-> posts and a post belongs to a user

## User Stories

My beginning user stories are:

A user can look up characters and their moves
A user can make posts on a forum related to a specific character
A user can edit and delete their posts
A user can read other posts

## Weekend Plan

My beginning plan is to: 

* create the models above, with help from an api for characters and moves.

* Add a show page for users, with a bio they can add

* Make a basic character index page with links

* Make character show pages with moves below each character

* Create basic forum show and index pages

* Make posts for the forum pages, with full crud functionality

* Add log-in, log-out, and sign-up functions and pages for users

## Stretch Goals

I'd honestly like to do a lot, here is what I have in mind. I'm prepared to not be able to do all these, but it would be neat to do.

* Let users favorite characters. Links to their favorited characters will be on their show page.

* Limit how many posts show up on a forum page. Add buttons to load the next or previous batch of however many.

* Add search functionality for moves

* Be able to tag moves in a post. That post would then have a link to that spot on the character's page.

* Maybe add sub forums for users to create their own topics?

* Let users highlight moves to show up on their show page with an optional message as a sort of to-do list. This would be moves they need to practice, or study counter play to. Example, highlighting kazuya's d+4 kick, with a message "Kazuya players seem to like doing this after a blocked jab". 

* super fancy: Let users submit change requests for character pages/ move data. The admin would get an email about the request, and can see pending requests on an admin page. I need to research this. 

* I'm looking into Bulma, and will likely try and use it for styling.