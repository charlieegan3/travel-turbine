# Travel Planner

#### Introduction
Travel planner (and other names) is a web app that allows users to compare one-way journeys between British cities and towns.

The application takes in a single query, e.g Aberdeen to London on the 21/11/13 and uses that information as parameters to search 3 travel websites and generate driving statisitcs. Searches can take upto 12 seconds to complete.

#### Usage
Anyone can use the app to query a jounney, user account are not madatory. However if you do have an account your queries will be saved for later review.

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

#### Best Route Calculation
The best option overall and best of each method are calculated in the same way.

1. Given a list of prices and durations the averages are calculated.
2. Then each result in the list is given a score based on it's relation to the mean. Price and duration are equally weighted.
3. The element with the lowest score wins, as it is the one that is the largest ammount below average.


