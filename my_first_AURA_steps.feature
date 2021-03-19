@regression @pagination @All_Themes_page @jira(XPRESS-2054)
Feature: Pagination panel

    As a User I want to see how many pages with search results I have
    I want to have convenient navigation through results list pages

    Rule: Users can navigate through the pages on the search result list using next, back and page mumber buttons
      Background: 
        Given the User is logged in
        And the "Praktische thema's" tab is clicked 
        And Eventually "All Themes page" is loaded
        And the "search input" field is typed with "wet"
        And Eventually "search result list" page should be loaded
    
      @smoke
      Scenario Outline: Scenario Outline name: 1. Navigation with page counter
        When <filter name> tab is clicked
        And <page number> button is clicked
        Then eventually "search result list" page should be loaded
        And <page number> button should be highlighted ? selected
        And the text of "page results counter" should contain "<number of results>"
        And page URL should contain "<URL page number>"
        
        Examples:
            | filter name             | page number  | number of results | URL page number |
            | Alles                   | 4            | 31 - 40           | ?pagina=4       |
            | Thema's                 | 3            | 21 - 30           | ?pagina=3       |
            | Praktische hulpmiddelen | 2            | 11 - 20           | ?pagina=2       |
            | Inzichten & tips        | 2            | 11 - 20           | ?pagina=2       |


      Scenario Outline: 2. Navigation with Next pagination button at the <place> pagination panel 
        Given <place> panel should be in the viewport
        When "next" button is clicked on
        Then eventually "search result list" page should be loaded
        And "page number 2" button should be highlighted ? selected
        And the text of "page results counter" should contain "11 - 20"
        And page URL should contain "?pagina=2"

        Examples:
            | place  |
            | top    |
            | bottom |

      Scenario Outline: 3. Navigation with Back pagination button at the <place> pagination panel
        When "<page number>" button is clicked on
        And  <place> panel should be in the viewport
        Then eventually "search result list" page should be loaded

        When "back" button at the <place> panel is clicked
        Then eventually "search result list" page should be loaded
        And "<result page number>" button should be highlighted ? selected
        And the text of "page results counter" should contain "<number of results>"
        And page URL should contain "?pagina=2" 

        Examples:
            |page number| place  | result page number | number of results | URL page number |
            | 3         | top    | 2                  | 11 - 20           | ?pagina=2       |
            | 2         | bottom | 1                  | 1 - 10            | ?pagina=1       |

      @smoke
      Scenario Outline: 4. Navigation with <direction> pagination button at the <place> paginaton panel
        When "<page number>" button is clicked
        And <place> panel should be in the view port
        And <direction> button is clicked
        Then eventually "search result list" page should be loaded
        And "<page number>" button should be highlighted ? selected
        And page URL should contain "<URL page number>"

        Examples:
            |page number | place  | direction | page number | URL page number |
            |2           | top    | next      | 3           | ?pagina=3       |
            |3           | top    | back      | 2           | ?pagina=2       |
            |1           | bottom | next      | 2           | ?pagina=2       |
            |4           | bottom | back      | 3           | ?pagina=3       |