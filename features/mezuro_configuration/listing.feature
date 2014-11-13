Feature: Configuration listing
  In order to interact with other configurations
  As a regular user
  I should have various listings

  Scenario: Listing configurations
    Given I am at the homepage
    When I click the configuration link
    Then I should see "configurations"
    And I should see "name"
    And I should see "description"
    And I should see "must_logged_configuration"

  @kalibro_restart
  Scenario: Should list the existing configurations
    Given I am a regular user
    And I am signed in
    And I have a sample configuration
    And I am at the All Configurations page
    Then the sample configuration should be there
    And I should not see "You must be logged in to create new Configurations."

  @kalibro_restart
  Scenario: Should show the existing configuration
    Given I am a regular user
    And I am signed in
    And I have a sample configuration
    And I am at the All Configurations page
    When I click the show link
    Then the sample configuration should be there