*** Settings ***
Documentation     Property Page Logic
Library     SeleniumLibrary
Library     Collections
Library     ExcelLibrary
Library     String
Library     loops.py

*** Variables ***
@{houses}           # List
@{property_prices}  # List
${Google_Maps}          xpath=//button[text()='Close Map']
${PropertyListPage}     xpath=//div[text()='toronto condos for Sale']
${PropertyCount}        xpath=//div[@id='listRow']/div
${SelectedProperty}     xpath=//div[@id='listRow']/div[5]/div/a/div[1]
${AppURL}
${addresult}

# Set initial value for variables
${Element}=     Set Variable    0
${i}=    Set Variable    1
${j}=    Set Variable    1
${count}=   Set Variable    1


*** Keywords ***
All the Properties Should be Shown

    #Get the URL of the page shown
    ${AppURL}=      Get Location
    Log To Console    The Page URL is: ${AppURL}

    # Call python function
    [Arguments]     ${num1}     ${num2}
    #${addresult}=   Call Method      s   ${num1}    ${num2}
    #${addresult}=   Custom Keyword to Add    ${${num1}}   ${${num2}}
    Pass the URL as argument
    ${Number}=      Addition Function
    Log To Console    Number is ${Number}
    # Log To Console    The URL of the page is  ${addresult}

    # Wait Until Page with Properties is shown. Then CLose the Maps to see full screen view
    Wait Until Page Contains Element   ${Google_Maps}           timeout=5
    Click Element                      ${Google_Maps}
    Wait Until Page Contains Element    ${SelectedProperty}     timeout=15

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
        #Append To List    @{property_prices}    ${AskPrice}
        ${Price} =      Set Variable     ${AskPrice}
        #${IntPrice} =   Get Substring  ${Price}    1  10
        ${NumericalPrice}=      Remove String       ${Price}     ,       $
        Append To List    ${property_prices}    ${NumericalPrice}
    END

    ${LC}=   Get Length     ${houses}

    # Write Excel Cell    row_num    col_num    value
    # Open the excel document for writing into it
    Open Excel Document    filename=Book1.xlsx  doc_id=docid

    #For Loop to store all the Property Price of all the houses shown in excel
    FOR   ${j}  IN RANGE  1  ${EndValue}

        # Write to excel document
        Write Excel Cell    ${j+1}   1   ${property_prices.__getitem__(${j-1})}
        # Save the excel
        Save Excel Document    filename=Book1.xlsx

    END

    ${col}=    Read Excel Column    1
    ${rowcount}=    Get Length    ${col}

    # Log To Console    Property Prices:
    FOR    ${count}    IN RANGE    2    ${rowcount}
        ${cellvalue}=   Read Excel Cell    ${count}    1
        # Log To Console    ${cellvalue}
    END
    
    # CLose the Excel Document
    Close Current Excel Document

    # Property Price 1-line header
    # Log to Console      Property Prices:
    #For Loop to store all the Property Price of all the houses shown in the First Page
    # FOR  ${Element}     IN      @{houses}
        # Show all the Property Prices on the Console
        # Log to Console  ${Element}
    # END

   # Click on the required Property
    Click Element       ${SelectedProperty}