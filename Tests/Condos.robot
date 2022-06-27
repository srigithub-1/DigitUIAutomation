*** Settings ***
Documentation    Test Suite For Condos.ca
Resource        ../Resources/FrontOfficeApp.robot
Resource        ../Resources/CommonWeb.robot
Test Setup      Begin Web Test
Test Teardown   End Web Test


*** Test Cases ***
TC01_Search Condos in Toronto
    [Tags]    Regression
    When I Navigate to the "Condos.ca" Page
    # Then The Condos Home Page Should Be Displayed
    Then I Wait for the Search Box to be enabled and search for Properties       Toronto
    And Properties Page Should Be Displayed
    Then PropertyDetails Should be Shown

TC02_Search Condos in Vancouver
    [Tags]    Regression
    When I Navigate to the "Condos.ca" Page
    # Then The Condos Home Page Should Be Displayed
    Then I Wait for the Search Box to be enabled and search for Properties       Vancouver
    And Properties Page Should Be Displayed
    Then PropertyDetails Should be Shown
