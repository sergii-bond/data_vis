#Summary
*(in no more than 4 sentences, briefly introduce your data visualization and add any context that can help readers understand it)*

The visualization communicates a simple message and answers two questions: 
- What are the 10 largest airports in US by the number of domestic flights in 2008 ? 
- How many flights occured between these airports ?

Usage notes: 
* Point your mouse over a red circle to see data
* Circle's radius is proportional to the total number of incoming and outgoing flights for the airport
* The arrows designate the outgoing flights 
* The text on the tips of the arrows is the total number of outgoing flights from the selected origin to a destination. 
The text size is proportional to this number

The original dataset was downloaded from [here](http://stat-computing.org/dataexpo/2009/2008.csv.bz2) and [here](http://stat-computing.org/dataexpo/2009/airports.csv)

Exploratory data analysis and construction of the datasets for a visualization is done with R (see eda.R). 

#Design
*(explain any design choices you made including changes to the visualization after collecting feedback)*
* The data to display has a nature of a graph. Airports are nodes and edges are flights among them. It is good to tie the nodes to a map, since each airport has a corresponding geographical location. In addition people usually think of travelling (change of location) when they hear a word 'flights'. Placing the edges on a map gives a sense of direction.
* The position of a circle corresponds to the position of the airport in the US map, this way helping users to get a better idea where an airport is located. 
* The size of the circle corresponds to the total amount of flights for an airport. This helps a reader to qualitatively estimate the difference in flights among airports. 
* The color of all circles was chosen to be uniform, because there exists no intended data to encode by color.
* If the mouse is hovered over the circle, the tooltip appears to show the exact number of flights for the corresponding airport with its IATA code and name. In addition, the arrows show up which point to the destination airports with a number of flights from the origin for each of them. This information could't be shown statically because of the space limitations. 
* The color map's land and state boundaries are chosen to be as dim as possible not to distract a reader from more important data shown in the visualization.

#Feedback 
*(include all feedback you received from others on your visualization from the first sketch to the final visualization)*
* Iteration 1
   
  Statements that do not assume revision of the visualization:

  * "It looks like San Francisco has way fewer outgoing flights than I expected"
  * "The total number of flights for an airport dwarfs the total number of flights to other top 10 US airports"
  * "It looks like for each airport, the largest number of outgoing flights go to the nearest airports"
  * "The northeast does not have any top 10 airports. I was surprised by this since it is very busy airspace with a large population"
  * "It was very easy to get a sense of scale - easy to see that Atlanta is far busier than San Francisco"

  Statements that assume possible revision:

  * Comment 1.1: "Is the number of outgoing flights proportional to the radius of the
airport marker or to the area of the airport marker?" 
  * Comment 1.2:"Does "Total Flights"
in the popup text box indicate the total number of inbound and outbound flights
for that airport, or just the total number of outbound flights?. 
  * Answer 1: added clarification under the chart that "Circle's radius is proportional to the
total number of incoming and outgoing flights for the airport".

  * Comment 2.1: "It looks like for each airport, the largest number of outgoing
flights go to the nearest airports. I wonder if there is a way to include this
in the visualization? Maybe the size of the other airport markers could change
to indicate the number of incoming flights when a user is hovering over a given
airport? This might be difficult to execute well; the number of incoming
flights for each of the other airports is very small in proportion to the
number of outgoing flights for the given airport, so keeping them all on the
same scale probably won't work. On the other hand, changing scales might be
confusing to the viewer". 
  * Comment 2.2: "I wonder if there is a way to get a sense of scale of
    outbound flights? Maybe thickness of the lines from the departing airport
    to the destination airport?"
  * Answer 2: Improved by changing the text size proportionally to the number of incoming flights. 

  * Comment 3: "I wonder what a similar graphic would look like if multiple airports in a small geographic
    region were aggregated? (NYC/Philly for example or Oakland/SFO)" 
  * Answer 3: The implementation of this idea  would require a considerable investment of time. I decided not to proceed, though generally it could be interesting.

#Resources 
*(list any sources you consulted to create your visualization)*
* http://d3js.org/
* https://github.com/mbostock/d3/wiki/Geo-Projections
* http://bl.ocks.org/mbostock/3734308
* https://github.com/mbostock/d3/wiki/SVG-Shapes
* http://www.w3schools.com/js/js_math.asp
* https://www.stat.auckland.ac.nz/~joh024/Research/D3js/SelNavSVG/SelNavSVG.html
