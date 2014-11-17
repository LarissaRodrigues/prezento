Feature: Compound Metric Configuration edition
  In order to interact with compound metric configurations
  As a regular user
  I should edit the informations of compound metric configurations

  @kalibro_restart
  Scenario: the configuration is not mine
    Given I am a regular user
    And I am signed in
    And I have a sample configuration
    And I have a sample reading group
    And I have a sample metric configuration within the given mezuro configuration
    And I have a sample compound metric configuration within the given mezuro configuration
    When I am at the Sample Configuration page
    Then I should not see "Edit"

  @kalibro_restart
  Scenario: editing a compound metric configuration successfully
    Given I am a regular user
    And I am signed in
    And I own a sample configuration
    And I have a sample reading group
    And I have a sample metric configuration within the given mezuro configuration
    And I have a sample compound metric configuration within the given mezuro configuration
    And I am at the Sample Configuration page
    Then I should see "Compound"
    When I click the edit link of the Coumpound Metric
    And I fill the Script field with "Another javascript"
    And I fill the Code field with "Another code"
    And I press the save button
    Then I should see "Another code"
    And I should see "compound_metric_configurations_successfully"

  @kalibro_restart
  Scenario: trying to edit with blank fields
    Given I am a regular user
    And I am signed in
    And I own a sample configuration
    And I have a sample reading group
    And I have a sample metric configuration within the given mezuro configuration
    And I have a sample compound metric configuration within the given mezuro configuration
    When I visit the sample compound metric configuration edit page
    And I fill the Name field with " "
    And I fill the Script field with " "
    And I fill the Code field with " "
    And I fill the Weight field with " "
    And I press the save button
    Then I should see "title_compound_edit"
    And I should see "activemodel.errors.models.metric_configuration.attributes.name.blank"
    And I should see "activemodel.errors.models.metric_configuration.attributes.script.blank"
    And I should see "activemodel.errors.models.metric_configuration.attributes.code.blank"
    And I should see "activemodel.errors.models.metric_configuration.attributes.weight.not_a_number"


  @kalibro_restart
  Scenario: trying to edit with an existing code
    Given I am a regular user
    And I am signed in
    And I own a sample configuration
    And I have a sample reading group
    And I have a sample metric configuration within the given mezuro configuration
    And I have a sample compound metric configuration within the given mezuro configuration
    And I have another compound metric configuration with code "Another Code" within the given mezuro configuration
    When I visit the sample compound metric configuration edit page
    And I fill the Code field with "Another Code"
    And I press the save button
    Then I should see "Code There is already a MetricConfiguration with code Another_Code! Please, choose another one."

