# FlightDatabase


Modifications
	We’ve made quite a few changes since the submission of Part A. Originally, we were looking to analyze data about individual flights and our questions were about specific flight paths. Additionally many of our questions from Part A required data from upwards of 4 different data sources. Once we did a deeper dive of our data we realized a couple of things. First of all our data source only had aggregated data about statistics for individual airports and airlines, not flight paths. We also decided to utilize the annual airline and airport rankings as a secondary data source to help build more interesting queries. Our final queries were the result of a couple rounds of edits but at the end of the day we’ve found some interesting insights and have been able to explore some fascinating data about the skies. 

Process
	The data cleaning for this assignment was tedious. To say the least. The data was formatted in the most bizarre way and took multiple steps to download, combine, and then clean. It was a big holdup for finishing part C on time, but was completed eventually.  
	Our first data source was from DataPlanet, a resource we accessed through Hopkins Libraries. We looked at the arrivals and departures statistics for all airlines and selected 75 of airports to focus on. We also chose 5-6 data points to focus on for each and looked for ones we thought would allow us the flexibility to ask interesting questions. 
https://dataplanet-sagepub-com.proxy1.library.jhu.edu/dataset?view=AAsBXQAAgABUAQAAAAAAAAAA3_zfPSgIJ8Ve1X%24GFlaG5ZSv8qTGcrGJQg1W85qgH2RtFFZPs4Hg8Po2rQUrGwfZFlAKlNYt5cHC_ZDnvMa8GaNEmGiauj4bvzmflEk8TPu70V3MTxRznUylj8bZWreeaRlYsnRIzmNwbqVmgmLwEExVXLPqXFJiOhwtg4Vfv0n0XB3ET6PnpEYZapHquNpk9tV0KYfbwdvAbNHznJBrnFeLxuFIdIaIAA 
	The second data source was the airline and airport rankings from the Bureau of Transportation Statistics. We used the available data, but were disappointed that we couldn’t find rankings for any year before 2008. An additional issue that we ran into was the fact that the two data sources had some variations of how they reported airline names, airport codes, and city names. This was particularly difficult because we were using the codes as primary keys so it was an additional hurdle to combine the rankings with the statistics. 
	https://www.bts.gov/topics/annual-airline-rankings
	https://www.bts.gov/topics/annual-airport-rankings

Successes
	Both of us are incredibly proud of this entire project. Being able to see it through from ideation to ‘publication’ has been really rewarding. There are a couple things that we’re especially proud of here. 
	1. The overall layout of our menu page: We know it wasn’t an explicit requirement but we did dedicate some time to updating our UX for the main page. We think that the clean consistent look brings together the project and enhances users’ ability to interact with all the hard work that went into the backend of the project. We used bootstrap to streamline the CSS and learned some new skills along the way. 
	2. Database Design, Data aggregation, & ER diagram: We put a lot of thought and hard work into truly building our database. We didn’t find something on kaggle and just upload it - we had to really rearrange the data, aggregate it, and then combine two very different data sets. This was a challenge, and at some points almost too much so, but the end result is a database that we’re both very familiar with and proud of. 
	3. Queries: We’re just proud of our queries. They went a couple of iterations and lots of testing and we’re confident that they are accurately pulling up accurate data. 
	4. Data Visualizations: It was great to work with the CanvasJS API and implement visualizations. It was tricky at first, but it was lots of fun to work with different visualizations and customization options. One thing in particular we’re proud of is the graph for query 11 and the dynamic graph titles for most of the graphs. 

Issues
	1. Some of our queries took a really really long time to run. We had to split some of our queries into two parts to minimize the runtime and avoid crashing the browser. 
	2. Our data sets are huge and the setup takes forever. For this reason we also had to limit most of our queries to 5 or 10 answers because it would simply take too long to load and print out entire lists. 
	3. Not all of the airlines load into the database properly. We’ve looked at the delimiters and other possible bugs but they’re still some that aren’t loading in correctly. To that end, query 8 can only look at some of the airlines instead of all. 
