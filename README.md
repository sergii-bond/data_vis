#Summary
*(in no more than 4 sentences, briefly introduce your data visualization and add any context that can help readers understand it)*

The visualization communicates the following finding: 
- Outgoing flights mostly happened to nearby airports, but not always.

Usage notes: 
* Circle's area is proportional to the airport's total number of domestic
incoming and outgoing flights from/to all airports accross US (not just top
15). The legend in the top right corner gives a sense of how this number
corresponds to a circle's size. 
* The arrows designate the outgoing flights. The text on the tips of the arrows is the total number of outgoing flights from the
selected origin to a destination. The text size is proportional to this number.
A color of an arrow designates one of three bins in which this number falls.
The bins are calculated by dividing an interval between minimum and maximum
numbers of outgoing flights for a given origin in three parts. The legend shows
the range of values inside each bin. 

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
  * Revision resulted in index\_2.html

* Iteration 2

  Statements that assume possible revision:

  * Comment 1: "As mentioned above, cutting at the top ten really misses important
    airports. There are three New York city airports: EWR, LGA, JFK that carry
    very large amounts of traffic. The US has hub airports and missing from
    your story are Minneapolis-St Paul , Philadelphia, Charlotte, St Louis.
    Dulles and Reagan in Dc are pretty busy as well. Those are what I can think
    of. Although Seattlle in North West may not be that busy it is isolated. I
    guess my recommendation is to include as many airports as possible until
    the lines between them get too many. (and showing the New York airports
    will be a challenge)"
  * Answer 1: "I agree that it is possible to develop this visualization further
    and, for example, include controls on the number of airports displayed, and
    as Todd mentioned, focus on a particular area of the map. This would
    require more work. Otherwise if I simply include more than 10 airports into
    the dataset, the arrows and texts may overlap and make the chart hard to
    read"

  * Comment 2: "I think the radius is misleading and it is better to use square
    root of number flights to set the radius, then the are will look more
    realistic - compare Los Angles and Chicago
  * Answer 2: If I use proportionality to circle's area, then I am afraid some
    quick findings may not be apparent, for example, the one mentioned by Todd
    and Stephen, that San Francisco has the smallest number of flights"

  * Comment 3: "The numbers on the arrows don't add to the total in the tooltip
    (mouseover) - maybe i misunderstand.
  * Answer 3: the numbers do not add up to the total, because the total counts
    both incoming and outgoing"

  * Comment 4: "You choose to only plot outgoing flights. As a user, i am
    obviously curious about incoming as well. But , are they very different?
    every plane has to return eventually, but some may fly a number of stops
    before returning. It just feels incomplete to show outgoing only" 
  * Answer 4: "If you are interested in incoming flights, you could highlight
    the opposite airport and see its outgoing flights to the airport of
    interest. It would be better to add a control switch to decide what to
    show, incoming or outgoing. Again, we can see that the space for
    improvement is large"

  * Comment 5: "You may want to experiment with width of lines set to number of
    flights - it may need a minimum and maximum width. This wont be perfect but
    may give a better visual sense. Perhaps try log of the number of flights" 
  * Answer 5: "I considered to use line thickness encoding, but rejected it,
    because the eye differentiates line thickness difference not very well,
    unless the thickness increments are significant. But in the latter case,
    the thick lines will make other components of the picture less visible"

  * Comment 6: "Use a modern font for title and text" 
  * Answer 6: "The font could be improved, I agree. But I do not consider the
    style to be of importance in this project, so I didn't experiment with
    various fonts and colors here"

* Iteration 3 (index\_3.html)

  Statements that assume possible revision:

  * Comment 1: "The numbers are off From Chicago, there are ten arrows each with
    a number 10,000. So the maximum total is <100,000 The mouse over on Chicago
    shows 700,000. All the cities have this problem. Something is wrong, the
    difference is not inbound"
  * Answer 1: "I like that you pay attention to accuracy, I would do the same thing.
    After I read your comment I was sure I had a bug in data processing.
    However after reviewing the codes I realized that everything is right except
    explanation in the graph. The total flights number counts all incoming and
    outgoing flights from/to all airports in US, not just top 10. I apologize
    for forgetting this and not writing explicitly. I will correct the description below the chart"

  * Comment 2: Visualizations always have problems with numbers of lines etc
    and these problems need to be solved. A USA air travel story that doesn't
    include New York airports or any airport on the eastcoast of the USA feels
    very incomplete when that is, as best I know, the busiest air space in the
    world. See this thread for example www.airliners.net/aviation-forums/general_aviation/read.main/3255739/
    if you look at Busiest airports by aircraft movement1, there is a lot in
        common with your list, but San Franciso is only number 24 . Your list
        correspond mostly but does not include Charlotte or Philadelphia. I
        tried to look at your data but it is already summarized.
  * Answer 2: "I was able to increase the number of airports to 15 without sacrificing the quality of the picture.
    Now Charlotte is included, as well as Newark. Thank you for the links. Please also note that the data describe domestic flights only, international are not included"

  * Comment 3: "Fonts for heading and text - I think style is always important,
    particularly in visualizations. Its not about optimizing every element, but
    its important to ensure that elements do not detract. In this case there is
    no need to experiment with many fonts, just choose a more modern font than
    what I think is the browser default font from when the web was invented. I
    have simply used font-family: "Helvetica Neue",Arial,sans-serif; Of course
    this is all subjective ..." 
  * Answer 3: "You convinced me. I have changed the default font family for the entire
    html."
  * Revision resulted in index\_3.html

* Iteration 4 (index.html)
  * This iteration was made after the feedback from Udacity coach. The
     feedback itself is not documented here.
  * The following changes were made: 
        * Now circle's area is proportional to the total number of flights, not
          its radius
        * Added a legend for circle sizes
        * Encoded the arrows by color and added the legend
        * Changed the title and added a main takeaway from the visualization,
          making it more explanatory rather than exploratory
  * Revision resulted in index.html

[Here](https://discussions.udacity.com/t/project-feedback-d3-visualization/35446) is the link to the page with the feedbacks listed above.

#Resources 
*(list any sources you consulted to create your visualization)*
* http://d3js.org/
* https://github.com/mbostock/d3/wiki/Geo-Projections
* http://bl.ocks.org/mbostock/3734308
* https://github.com/mbostock/d3/wiki/SVG-Shapes
* http://www.w3schools.com/js/js_math.asp
* https://www.stat.auckland.ac.nz/~joh024/Research/D3js/SelNavSVG/SelNavSVG.html
* http://www.d3noob.org/2013/03/a-simple-d3js-map-explained.html
