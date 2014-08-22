Feature: Google search

  Background:I'm on google home pge
    Given I am on google home page

  Scenario Outline: when I type lotus, search result should display Lotus cars
    When I fill in search query with <keyword>
    And I click on google search
    Then I should see <result>
  Examples:
    | keyword | result          |
    | Lotus   | Lotus cars:home |

  #Scenario Outline: when I type nothing in search field, nothing should happen when I perform search
  #  When I fill in search query with nothing
  #  And I click on google search
  #  Then I should see nothing
  #Examples:
  #  |  |
