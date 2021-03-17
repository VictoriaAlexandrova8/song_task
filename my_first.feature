Feature: Pagination

    Feature Description
    Scenario: Page counter
    # The Page Counter should be verified at the top and the bottom of the page
    Given The User on the Home page
    When user enter search query 
    Then Search result list is displayed
    And Page counter is displayed
    