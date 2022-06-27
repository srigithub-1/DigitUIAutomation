*** Settings ***
Documentation    Test Suite For Condos.ca
Resource        ../Resources/FrontOfficeApp.robot
Resource        ../Resources/CommonWeb.robot
Test Setup      Begin Web Test
Test Teardown   End Web Test


*** Test Cases ***
TC03_Search Houses in Toronto
    [Tags]    Regression
    When I Navigate to the "Condos.ca" Page
    # Then The Condos Home Page Should Be Displayed
    And I Click On "Property.ca" page
    Then I Wait for the Search Box to be enabled and search for Properties       Toronto
    And Properties Page Should Be Displayed
    Then PropertyDetails Should be Shown
