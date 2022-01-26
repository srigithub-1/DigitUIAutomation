*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${Menu_Item_Team}       css=div[role='combobox'] input[placeholder*='Neighbourhood']

*** Keywords ***
The "Condos.ca" page should load
    Wait Until Page Contains Element    ${Menu_Item_Team}       timeout=90
    Click Element                       ${Menu_Item_Team}
    Input Text                          ${Menu_Item_Team}       Toronto

