#AWAD Group Assignment Report
**Dylan Hanning & Charlie Egan**

**Project Name:** Travel Turbine

**Heroku URL:** [http://travel-turbine.herokuapp.com](http://travel-turbine.herokuapp.com)

* Example User: reguser@hello.com, helloworld123
* Admin: da_admin@traveller.com, password123

***
####Introduction

Travel Turbine is a web app that allows users to compare one-way journeys between British cities and towns; and suggests the best option.

Travel Turbine achieves this by scraping data from National Rail, Megabus and Tripsta, and then compares the results (on duration and cost). Car journey statistics are also included on every query.

It does not require registration to use,  but creating an account allows users to access a list of their past queries. So the effective levels of access are: **guest, user** and **admin**.



####Functions
* Queries live travel data
* Aggregates and displays response from 3 sources
* Saves all queries in a cache to boost speed (even guest queries)
* Links queries to user accounts
* Layout responds to different screen sizes
* Admin accounts can only be created by existing admins
* Twitter Buttons and Permalinks enable social sharing of queries
* Users can clean up their lists by hiding journeys, however they remain in the cache.

####Know Issues
There are a few little bugs that remain:

* The datepicker on the home page doesn't work after logging out, and navigating back. The page needs to be refreshed.
* When you sign up for an account the sign-up form doens't warn of an invalid password, only refeshes the page without any message. Invalid forms are not saved (alphanumeric, 6 or more).

####Design
We've used the Twitter Bootstrap with the flatly theme to sytle the majority of the application. [http://bootswatch.com/flatly/bootstrap.min.css](http://bootswatch.com/flatly/bootstrap.min.css)

We wanted to keep the design as simple and clean as possible, we like to think we've achieved that. Whereever possible we aim to tell the user what's going on.
####Development
We each mainly covered different sections.

**Dylan**

* User Accounts
* Admin Actions
* Access Privileges
* Devise related database work

**Charlie**

* Search Algorithm
* Page Styling
* Journey and Location related database work & caching
* User and Journey linking

**Shared Tasks**

* Heroku push and Remote Repo Managment
* Testing
* Routing

####Implementation
Description per Function as Listed Above

***Queries live travel data***

* Create a uri to query on each site based on information stored in the `Location` table
* Uses Nokogiri to parse xml response, regular expressions are also used for finishing touches
* Responses are stored in a multi-level array. Only duration and cost are stored.
* The link to the results is stored also to provide a link to users should they want to buy the tickets.

***Aggregates and displays response from 3 sources***

* After calling the getter methods for each site we compare all the results relative to the average of the whole set. This can lead to buses and planes winning due to cheaper costs and plane shorter times. Both duration and cost are weighted equally.
* This data is then displayed in a tabulated format in the view.

***Saves all queries in a cache to boost speed (even guest queries)***

* As soon as a valid jouney is created it's data from is written to the database.
* On the creation of a new journey thee existing table is checked to for equal journeys created in the last day.
* If an equal journey is found then it's data rather than the new data is displayed for reduce load times.

***Links queries to user accounts***

* Using a the current_user devise helper new journeys are automatically linked to user accounts in the owner field.
* If there is no user, i.e the user is a guest then the journey is assigned to the guest user. The reguser@hello.com is can view the guest queries.

***Layout responds to different screen sizes***

* The Twitter bootstrap makes this fairly painless. In general pages look good on all sizes of screen.
* On the index there is a message that only displays when the screen is very small, if there was a mobile app then we might put a link to it there.

***Admin accounts can only be created by existing admins***

* The existing admin, da_admin@traveller.com, has been created in the seeds. They are the only admin at the start. Other admins can create more once they are granted permission from the original admin.

***Twitter Buttons and Permalinks enable social sharing of queries***

***Users can clean up their lists by hiding journeys, however they remain in the cache.***

####Installation
To get the application running on your machine:

1. `cd` into project directory

2. `bundle install`

3. `rake db:create`

4. `rake db:migrate`

5. `rake db:seed` (need this to create the first admin)
6. `rails s`

######Dependencies
The app was built with Rails 4.0 and Ruby 2.0,  so use different versions at your own risk. 

#### Usage
Anyone can use the app to query a journey, user accounts are not mandatory. However if you do have an account your queries will be saved for later review.

Visit the homepage to make a query.

1. First choose a origin or start town from the first drop down. This is where we'll look for journeys from in our queries.
2. Next you'll need to specify a destination, this must be different from the start point.
3. Specify a date using the wonderfully simple yet near-possible to program datepicker. It should be reasonably simple to use. It even has a today button.
4. Click the **Search** button to start the query process.
5. After a few seconds the results will be returned in the area below the search form.
6. Your query is summarized and then followed by the result that's best, see the technical section for details on what this means.
7. Below that are all the results found, along with links to the relevent sites to book tickets.
8. The car directions at the bottom, these give an estimated fuel cost and a total mileage as well as a link to the google directions page.
9. If you'd like to share the results on your favorite social network there's a permalink and tweet button at the bottom to satisfy your needs.
10. If you're logged in all queries will be saved to your account.
11. If you run a query that you have done before (within a short period of time), we present a cached version of the result in order to save time.
