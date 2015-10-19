#Summary
*(in no more than 4 sentences, briefly introduce your data visualization and add any context that can help readers understand it)*

The visualization communicates a simple message and answers two questions: 
- What are the 10 largest airports in US by the number of domestic flights in 2008 ? 
- How many flights occured between these airports ?

Usage notes: 
* Point your mouse over a red circle to see data
* The arrows designate the outgoing flights 
* The text on the tips of the arrows is the total number of outgoing flights from the selected origin to a destination

The original dataset was downloaded from [here](http://stat-computing.org/dataexpo/2009/2008.csv.bz2) and [here](http://stat-computing.org/dataexpo/2009/airports.csv)

Exploratory data analysis and construction of the datasets for a visualization is done with R (see eda.R). 

#Design
*(explain any design choices you made including changes to the visualization after collecting feedback)*
* The position of a circle corresponds to the position of the airport in the US map, this way helping users to get a better idea where an airport is located. 
* The size of the circle corresponds to the total amount of flights for an airport. This helps a reader to qualitatively estimate the difference in flights among airports. 
* The color of all circles was chosen to be uniform, because there exists no intended data to encode by color.
* If the mouse is hovered over the circle, the tooltip appears to show the exact number of flights for the corresponding airport with its IATA code and name. In addition, the arrows show up which point to the destination airports with a number of flights from the origin for each of them. This information could't be shown statically because of the space limitations. 
* The color map's land and state boundaries is chosen to be as dim as possible not to distract a reader from more important data shown in the visualization.

#Feedback 
*(include all feedback you received from others on your visualization from the first sketch to the final visualization)*

#Resources 
*(list any sources you consulted to create your visualization)*
* http://d3js.org/
* https://github.com/mbostock/d3/wiki/Geo-Projections
* http://bl.ocks.org/mbostock/3734308
* https://github.com/mbostock/d3/wiki/SVG-Shapes
* http://www.w3schools.com/js/js_math.asp
