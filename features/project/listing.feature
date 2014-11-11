Feature: Project listing
  In order to interact with other projects
  As a regular user
  I should have various listings

  Scenario: Listing projects
    Given I am at the homepage
    When I click the project link
    Then I should see "projects"
    And I should see "name"
    And I should see "description"
    And I should see "must_logged_create_projects"

  @kalibro_processor_restart
  Scenario: Should list the existing projects
    Given I am a regular user
    And I am signed in
    And I have a sample project
    And I am at the All Projects page
    Then the sample project should be there
    And I should not see "must_logged_create_projects"

  @kalibro_processor_restart
  Scenario: Should show the existing project
    Given I am a regular user
    And I am signed in
    And I have a sample project
    And I am at the All Projects page
    When I click the show link
    Then the sample project should be there