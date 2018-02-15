# Module One Final Project Guidelines

Congratulations, you're at the end of module one! You've worked crazy hard to get here and have learned a ton.

For your final project, we'll be building a Command Line database application.

## Project Requirements

### Option One - Data Analytics Project

1. Access a Sqlite3 Database using ActiveRecord.
2. You should have at minimum three models including one join model. This means you must have a many-to-many relationship.
3. You should seed your database using data that you collect either from a CSV, a website by scraping, or an API.
4. Your models should have methods that answer interesting questions about the data. For example, if you've collected info about movie reviews, what is the most popular movie? What movie has the most reviews?
5. You should provide a CLI to display the return values of your interesting methods.  
6. Use good OO design patterns. You should have separate classes for your models and CLI interface.

### Option Two - Command Line CRUD App

1. Access a Sqlite3 Database using ActiveRecord.
2. You should have a minimum of three models.
3. You should build out a CLI to give your user full CRUD ability for at least one of your resources. For example, build out a command line To-Do list. A user should be able to create a new to-do, see all todos, update a todo item, and delete a todo. Todos can be grouped into categories, so that a to-do has many categories and categories have many to-dos.
4. Use good OO design patterns. You should have separate models for your runner and CLI interface.

### Brainstorming and Proposing a Project Idea

Projects need to be approved prior to launching into them, so take some time to brainstorm project options that will fulfill the requirements above.  You must have a minimum of four [user stories](https://en.wikipedia.org/wiki/User_story) to help explain how a user will interact with your app.  A user story should follow the general structure of `"As a <role>, I want <goal/desire> so that <benefit>"`. In example, if we were creating an app to randomly choose nearby restaurants on Yelp, we might write:

* As a user, I want to be able to enter my name to retrieve my records
* As a user, I want to enter a location and be given a random nearby restaurant suggestion
* As a user, I should be able to reject a suggestion and not see that restaurant suggestion again
* As a user, I want to be able to save to and retrieve a list of favorite restaurant suggestions

## Instructions

1. Fork and clone this repository.
2. Build your application. Make sure to commit early and commit often. Commit messages should be meaningful (clearly describe what you're doing in the commit) and accurate (there should be nothing in the commit that doesn't match the description in the commit message). Good rule of thumb is to commit every 3-7 mins of actual coding time. Most of your commits should have under 15 lines of code and a 2 line commit is perfectly acceptable.
3. Make sure to create a good README.md with a short description, install instructions, a contributors guide and a link to the license for your code.
4. Make sure your project checks off each of the above requirements.
5. Prepare a video demo (narration helps!) describing how a user would interact with your working project.
    * The video should:
      - Have an overview of your project.(2 minutes max)
6. Prepare a presentation to follow your video.(3 minutes max)
    * Your presentation should:
      - Describe something you struggled to build, and show us how you ultimately implemented it in your code.
      - Discuss 3 things you learned in the process of working on this project.
      - Address, if anything, what you would change or add to what you have today?
      - Present any code you would like to highlight.   
7. *OPTIONAL, BUT RECOMMENDED*: Write a blog post about the project and process.






# Plan of Action

  1. Set up connection to API
    a) Refine data pull (what data, what API call specifically)
    b) Formatting of data to fit within guidelines
    c) Call to a second email
  2. Pull in seed data for database
  3. Plan and create methods to extract data
  4. Create CLI to interface with user

We pull in data from a music API to extract Artist data, we then seed our database with that data and run some methods on that data to answer fun and interesting questions.

Pulling data from the API >> Selecting where that data will go in relation to the tables we have setup

Artists  ---<< Songs    (Have many)
Artists  >>-<< Genres   (Have many through)
Genres   ---<< Songs    (Have many)
Songs    --->> Lyrics   (Belong to)

  Table Artists (artist_id, artist_title)
  Table Genres (genre_id, genre_title)
  Table Songs (song_id, song_title, genre_id)

  #INVALID ABOVE MY DUYDE ^^

  NEW BAZINGUH HERE
/////////////////////////
USERS ---<< SONGS >>--- ARTISTS
          <lyrics>

USER INPUT
----------
Ask user to create a profile
  user's have a name and a list of songs they like/liked

Ask user to search for a song's lyrics by song and artists
  take the lyrics data and put it into a database?

  take that data and put it into the user's personal instance?

  and/or whenever the user uses a SAVE method we save the name of whatever the song was that they were searching for



# API data, with multiple sources, getting results - so if a user calls in one song, we might have to sort through thousands of songs or so. Better to have more clarifying data aka ask them for a song, then ask them for a artist so that our API call can be even more accurate



# Trouble areas, interacting with APIs
# Creating CLI interface


YO YO YO YO!
BY THE WAY
%20 = SPACE IN URL SPEAK 
%27 = APOSTPRHE IN URL SPEAK

NEW GOALS

We are modeling our CLI and API after Starwars API Iterations Project


1.) Add new Favorites Model
  Update relationships
  Update DB tables

2.) Move API pull requests to separate API file
  Update GIT with new layout

<!-- When the pull is successfull

When user name is entered >> DB


When song is entered
When artists is entered
These save to variable

Interpolated into API pull request

IF successfull API call - then we populate with song name and artist name and lyrics to their respective date tables
 -->
