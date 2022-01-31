*** Settings ***
Resource    ./PO/Landing.robot
Resource    ./PO/Properties.robot
Resource    ./PO/PropertyDetails.robot

*** Keywords ***
I Navigate to the "Condos.ca" Page
    The "Condos.ca" page should load

I Wait for the Search Box on "Condos.ca" to be enabled and search for Toronto Properties
    The Search Box should be enabled on the Landing Page and User should be able to enter "Toronto" in it

Properties Page Should Be Displayed
    All the Properties Should be Shown

PropertyDetails Should be Shown
    SelectedProperty Amenities should be shown
