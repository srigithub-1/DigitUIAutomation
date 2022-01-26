*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}      gc
${BROWSER_URL}  http://www.condos.ca

*** Keywords ***
Begin Web Test
        Open Browser    ${BROWSER_URL}     ${BROWSER}
        Maximize Browser Window

End Web Test
        Close Browser