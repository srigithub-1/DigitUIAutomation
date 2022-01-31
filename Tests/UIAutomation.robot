*** Settings ***
Documentation    Test Suite For Condos.ca
Resource        ../Resources/FrontOfficeApp.robot
Resource        ../Resources/CommonWeb.robot
Test Setup      Begin Web Test
Test Teardown   End Web Test


*** Test Cases ***
TC01_CondosApplicationAutomation
    [Tags]    Regression
    When I Navigate to the "Condos.ca" Page
    Then I Wait for the Search Box on "Condos.ca" to be enabled and search for Toronto Properties
    And Properties Page Should Be Displayed
    Then PropertyDetails Should be Shown