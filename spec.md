# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
My CLI class contains methods (#show_list, #menu, #show_details, #exit_program) that represent the different stages in the CLI. The #show_list and #menu methods are encapsulated in the #call method, while the others are encapsulated in the #menu method.

- [x] Pull data from an external source
My data comes from three pages on the runrocknroll.com site. The cities and URLs for each individual race come from the runrocknroll.com homepage. The date, description, and event hashtag attributes were scraped from each individual race page. The distance information was scraped from a "Distances" page that exist for every race site (i.e., http://www.runrocknroll.com/raleigh/the-races/distances/).

- [x] Implement both list and detail views
Upon starting the CLI, the user is shown a list of scraped cities from runrocknroll.com. The user is prompted to select one of the races (by number) and he/she is then shown details (date, distances, description, the event hashtag, and the race-specific URL).
