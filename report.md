#AWAD Group Assignment Report
**Dylan Hanning & Charlie Egan**

**Project Name:** Travel Turbine

**Heroku URL:** [http://travel-turbine.herokuapp.com](http://travel-turbine.herokuapp.com)

***
####Introduction

Travel Turbine is a web app that allows users to compare one-way journeys between British cities and towns.

It does not require registration to use,  but creating an account allows users to access a list of their past queries for easy access.

####Functions (perhaps merge with use section?)

Users choose two cities from the drop-down menus, and a departure date. The app then queries the three websites of 

The app automatically saves queries to the database, and displays 'permalinks' which allows users to bookmark the journey summary or share it with friends.

#(More sections to expand below)
####design
####development
####implementation
####installation
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
