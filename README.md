# API-Disney
***
  ## Table of Contents
1. [Installation](#Installation)
2. [Auth](#Auth)
3. [Characters](#Characters)
4. [Movies](#Movies)
5. [Filter](#Filter)


## Installation
***
```
$ git clone https://github.com/josefmr96/Api-Disney.git
$ cd ../path/to/the/file
$ npm run dev
```

## Auth - routes
 ### /auth/register

######  POST request for user registration and obtaining authorization Token
 
 ### /auth/login

###### POST request for the validation of the registered user and obtaining authorization Token
  ***
  
## Characters - routes
 ***
  ### /characters  
###### GET request to get all the characters, showing only the image and name

   ### /characters  
###### POST request to create characters

   ### /characters/:idpersonaje  
###### GET request to obtain the character selected by id

   ### /characters/:idpersonaje  
###### POST request to update a character

   ### /characters/:idpersonaje  
###### DELETE request to delete a character
***
## Movies - routes
***
  ### /movies  
###### GET request to get all the movies,  showing only the image title and creation date

 ### /movies  
###### POST request to create movies

   ### /characters/:idpelicula  
###### GET request to obtain the movie selected by id

   ### /characters/:idpelicula  
###### POST request to update a movie

  ### /characters/:idpelicula  
###### DELETE request to delete a movie

## Filter
***
  ### Characters 
  ###### characters?name=name . filtered by character name
  ###### characters?age=age . filtered by character age
  ###### characters?movies=idpelicula . filtered by movie id
***  
  ### Movies 
  ###### movies?name=name filtered by movie name
  ###### movies?genre=genre filtered by movie genre
  ###### movies?order=order filtered by ascending or descending movie creation date
