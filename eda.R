
df = read.csv("2008.csv")

library("dplyr")
n = 10
outgoing = group_by(df, Origin) %>% 
  summarize(flights = n()) %>%
  arrange(desc(flights)) %>%
  slice(1:n)
names(outgoing)[names(outgoing) == 'Origin'] <- "airport"
str(outgoing)
head(outgoing, n + 1)

incoming = group_by(df, Dest) %>% 
  summarize(flights = n()) %>%
  arrange(desc(flights)) %>%
  slice(1:n)
names(incoming)[names(incoming) == 'Dest'] <- "airport"
str(incoming)
head(incoming, n + 1)

#nrow(filter(df, Origin == "LAX", Dest == "SFO"))
#for (i in 1:n) {
mutual = data.frame()
for (origin_airport in outgoing$airport) {
  for (destination_airport in incoming$airport) {
    if (origin_airport == destination_airport)  
      next
    #print(c(origin_airport, destination_airport))
    k = nrow(filter(df, Origin == origin_airport, Dest == destination_airport))
    mutual = rbind(mutual, data.frame(origin_airport, destination_airport, flights = k))
  }
  
}
#}

head(mutual)
nrow(mutual)
summary(mutual$flights)

airports = read.csv("airports.csv")
str(airports)


airports_size <- outgoing
for (x in outgoing$airport) {
  airports_size$flights[airports_size$airport == x] = airports_size$flights[airports_size$airport == x] +
    incoming$flights[incoming$airport == x]
}

#airport_size$flights = max(airport_size$flights) - min(airports_size)

airports_sel = subset(airports, iata %in% mutual$origin_airport | iata %in% mutual$destination_airport)
write.csv(mutual, "mutual.csv")
write.csv(airports_sel, "airports_sel.csv")
write.csv(airports_size, "airports_size.csv")
