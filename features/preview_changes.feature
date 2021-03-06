Feature: Preview Changes
  In order to run quickly, we should update internal caches on file changes
  
  Scenario: A template changes contents during preview
    Given the Server is running at "preview-app"
    And the file "source/content.html.erb" has the contents
      """
      Hello World
      """
    When I go to "/content.html"
    Then I should see "Hello World"
    And the file "source/content.html.erb" has the contents
      """
      Hola Mundo
      """
    When I go to "/content.html"
    Then I should see "Hola Mundo"
    