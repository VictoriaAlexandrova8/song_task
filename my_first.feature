@regression @pagination @All_Themes_page @jira(XPRESS-2054)
Feature: Pagination panel

    As a User I want to see how many pages with search results I have
    I want to have convenient navigation through results list pages 

    Rule: Users can navigate through the pages on the search result list using next, back and page mumber buttons
      Background: 
        Given the User is logged in
        And the User is on the "All Themes page"
        And the User runs search "query"
    
      @smoke
      Scenario: 1. Navigation with page counter
        Given the "first" page in search result list is displayed 
        When the user clicks on "any page number" exept the first
        Then "corresponding" page of the search result list is displayed
        And "corresponding" page number is highlighted   

      Scenario Outline: 2. Navigation with Next pagination button at the <place> pagination panel
        Given the "first" page in search result list is displayed 
        When the user clicks on "next" button at the <place> panel
        Then the page number 2 is displayed

        Examples:
            | place  |
            | top    |
            | bottom |

      Scenario Outline: 3. Navigation with Back pagination button at the <place> pagination panel
        Given "any" page exept the first in search result list is displayed
        When the user clicks on "next" button at the <place> panel
        Then the "previous" page number is displayed  

        Examples:
            | place  |
            | top    |
            | bottom |

      @smoke
      Scenario Outline: 4. Navigation with <direction> pagination button at the <place> paginaton panel
        Given <page number> page in search result list is opened
        And <place> panel is in the view port
        When the user clicks <direction> button
        Then <corresponding> page is displayed
        And <corresponding> page number is highlighted

        Examples:
            |page number | place  | direction | corresponding |
            |2           | top    | next      | 3             |
            |3           | top    | back      | 2             |
            |1           | bottom | next      | 2             |
            |4           | bottom | back      | 3             |