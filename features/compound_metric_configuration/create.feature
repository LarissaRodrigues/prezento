Feature: Compound Metric Configuration Creation
  In order to register my compound metric configurations
  As a regular user
  I should be able to create compound metric configurations

  @kalibro_restart @javascript
  Scenario: compound metric configuration creation
    Given I am a regular user
    And I am signed in
    And I own a sample configuration
    And I have a reading group named "Scholar"
    And I have a sample metric configuration within the given mezuro configuration
    And I am at the Sample Configuration page
    And I click the add_metric link
    And I click the compound_metric link
    When I click the "created_metrics" h3
    Then I see the sample metric configuration name
    And I see the sample metric configuration code
    When I fill the Name field with "my_compound_metric"
    And I fill the Description field with "some_description"
    And I fill the Code field with "mcm"
    And I fill the Script field with "8*8;"
    And I fill the Weight field with "8"
    And I set the select field "scope" as "Class"
    And I set the select field "reading_group" as "Scholar"
    And I press the save button
    Then I should see "my_compound_metric"
    When I click the show link of "my_compound_metric"
    Then I should see "my_compound_metric"
    And I should see "mcm"
    And I should see "8"
    And I should see "AVERAGE"
    