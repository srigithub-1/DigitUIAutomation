*** Settings ***
Documentation     Property Page Logic
Library     SeleniumLibrary
Library     Collections

*** Variables ***
@{houses}
${Google_Maps}          xpath=//button[text()='Close Map']
${PropertyListPage}     xpath=//div[text()='toronto condos for Sale']
${PropertyCount}        xpath=//div[@id='listRow']/div
${SelectedProperty}     xpath=//div[@id='listRow']/div[4]/div/a/div[1]

# Set initial value for variables
${Element}=     Set Variable    0
${i}=    Set Variable    1

*** Keywords ***
All the Properties Should be Shown

    # Wait Until Page with Properties is shown. Then CLose the Maps to see full screen view
    Wait Until Page Contains Element   ${Google_Maps}           timeout=5
    Click Element                      ${Google_Maps}
    Wait Until Page Contains Element    ${SelectedProperty}     timeout=10

        # Get the count of # of properties shown on the first page
    ${NoofHouses}=   Get Element Count      ${PropertyCount}
    #Assign the count to another variable
    ${EndValue}=    Set Variable    ${NoofHouses}

    #For Loop to store all the Property Price of all the houses shown in the First Page

    FOR   ${i}  IN RANGE  1  ${EndValue}
        #Fetch AskingPrice
        ${AskPrice}     Get Text    xpath=//div[@id='listRow']/div[${i}]//div[contains(@class,'AskingPrice')]
        # Append the Property Price to the {houses} List array
        Append To List     ${houses}    ${AskPrice}
    END

    # Property Price 1-line header
    Log to Console      Property Prices:
    #For Loop to store all the Property Price of all the houses shown in the First Page
    FOR  ${Element}     IN      @{houses}
        # Show all the Property Prices on the Console
        Log to Console  ${Element}
    END

   # Click on the required Property
    Click Element       ${SelectedProperty}
