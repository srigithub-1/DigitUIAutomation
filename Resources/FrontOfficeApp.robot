*** Settings ***
Resource    ./PO/Landing.robot
Resource    ./PO/Team.robot
Resource    ./PO/TopNav.robot

*** Keywords ***
I Navigate to the "Condos.ca" Page
    The "Condos.ca" page should load

