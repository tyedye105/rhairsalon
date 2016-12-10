

#Hair Salon

####A web app that allows the user to manage their stylists, and clients 12/9/16

#### By _Marty Kovach_

## Description

_This web app allows for users to add, update, or delete, stylists, and clients alike, while also allowing for adding clients to a specific stylist._


## Setup/Installation Requirements

###Database setup.

####1. In PSQL:
* CREATE DATABASE hair_salon
CREATE TABLE stylists (id serial PRIMARY KEY, name varchar, client_id int)
CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int)

####2. The files:
* Clone this repository
* install ruby (if not already there)
* launch it in the terminal with ruby app.rb



## Known Bugs



## Support and contact details

_For problems, or inquiries please contact me at tyedye105@yahoo.com_

## Technologies Used
HTML, Bootstrap, CSS, Ruby,

### License

*MIT*

Copyright (c) 2016 **_Marty Kovach_**
