Feature: Project Creation
  In order to register my projects
  As a regular user
  I should be able to create projects

  Scenario: Should not create project without login
    Given I am at the All Projects page
    Then I should not see New Project

  @kalibro_processor_restart
  Scenario: project creation
    Given I am a regular user
    And I am signed in
    And I am at the New Project page
    And I fill the Name field with "Kalibro"
    And I fill the Description field with "Web Service to collect metrics"
    When I press the buttom_save button
    Then I should see "kalibro"
    And I should see "web_service_collect_metrics"

  @kalibro_processor_restart
  Scenario: project creation with already taken name
    Given I am a regular user
    And I am signed in
    And I have a project named "Kalibro"
    And I am at the New Project page
    And I fill the Name field with "Kalibro"
    And I fill the Description field with "Web Service to collect metrics"
    When I press the buttom_save button
    Then I should see "already_project_with_Kalibro"

  Scenario: project creation with blank name
    Given I am a regular user
    And I am signed in
    And I am at the New Project page
    And I fill the Name field with " "
    And I fill the Description field with "Web Service to collect metrics"
    When I press the buttom_save button
    Then I should see "name_blank"

  Scenario: click on button new project on my projects page
    Given I am a regular user
    And I am signed in
    And I am at the homepage
    And I click the your_projects link
    When I click the new_project link
    Then I should see "new_project"