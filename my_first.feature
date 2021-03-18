Feature: Pagination panel

    Feature Description

    Rule: Users can navigate through the pages from the search result list
      Background: 
        Given the User is logged in
        And the User on the All Themes page
        And the User run search query
    
      Scenario: Page counter
        Given the first page in search result list is displayed
        When the user clicks on any page number exept the first
        Then corresponding page of the search result list is displayed
        And corresponding page number is highlighted   

      Scenario Outline: Next pagination button at the <place> of the page
        Given the first page in search result list is displayed
        When the user clicks on next button at the <place> panel
        Then the page number 2 is displayed

        Examples:
            | place  |
            | top    |
            | bottom |

      Scenario Outline: Back pagination button at the <place> of the page
        Given any page exept the first in search result list is displayed
        When the user clicks on next button at the <place> panel
        Then the previous page number is displayed  

        Examples:
            | place  |
            | top    |
            | bottom |

