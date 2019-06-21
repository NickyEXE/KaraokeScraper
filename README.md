# README

singsingmedia.com/search has the song database and song numbers for most of the Karaoke places in New York City, including Gagopa, Sing Sing brand karaoke places, and more.

As they don't have a public facing API or a particularly friendly back-end for scraping (its XHR yields HTML directly rather than JSON data), I wrote this back-end to hit their servers and then parse the response from HTML into API friendly JSON data.

# HOW TO USE

When the server is running, it can take a basic URI encoded query routed to /search/:query.

  For example, the a GET to "/search/Bohemian%20Rhapsody" would yield:
  ```
  {
    number_of_results: 4,
    songs: [
      {
      number: "954157",
      song: "BOHEMIAN RHAPSODY [MV]",
      artist: "THE MUPPETS"
      },
      {
      number: "954089",
      song: "BOHEMIAN RHAPSODY [MV]",
      artist: "THE MUPPETS"
      },
      {
      number: "952102",
      song: "BOHEMIAN RHAPSODY [MV]",
      artist: "QUEEN"
      },
      {
      number: "902015",
      song: "BOHEMIAN RHAPSODY",
      artist: "QUEEN"
      }
    ]
  }
  ```
  # ON HEROKU 
