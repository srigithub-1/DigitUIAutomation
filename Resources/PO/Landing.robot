*** Settings ***
Documentation     Landing Page Logic
Library     SeleniumLibrary
Library     Collections

*** Variables ***
${Search_Box}           xpath=//div//input[@type='text']
${Selection_Option}     xpath=//div[contains(@class,'Result')]//div[text()='Toronto']

*** Keywords ***
The "Condos.ca" page should load
    PRESS KEYS                          xpath=//body            TAB
    Sleep                               10s

The Search Box should be enabled on the Landing Page and User should be able to enter "Toronto" in it

    # Wait Until Search Box is Enabled and enter "Toronto"
    Wait Until Element Is Enabled       ${Search_Box}           timeout=10
    Input Text                          ${Search_Box}           Toronto

    # Wait Until Toronto shows up and click on it
    Wait Until Page Contains Element    ${Selection_Option}     timeout=5
    Click Element                       ${Selection_Option}

