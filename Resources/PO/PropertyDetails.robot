*** Settings ***
Documentation     Property Page Logic
Library     SeleniumLibrary
Library     Collections

*** Variables ***
@{Amenity}
#   ${PropertyDetailsLdPg}  xpath=//a[text()='For Sale']
${PropName}             xpath=//h1
${PropSize}             xpath=//div[contains(@class,'FeaturesBlock')]//div[contains(@class,'ListingDetail')]//div[1]//div[contains(text(),'sqft')]
${ListofAmenities}      xpath=//div[contains(@class,'CollapseContainer')]//div[2]//div//div//div//div[contains(@class,'AmenityIconContainer')]/div
${TypeofProperty}       xpath=//button/div[text()='Rented']

# Variable assignment
${j}=    Set Variable    1

*** Keywords ***
SelectedProperty Amenities should be shown

    #Switch to the Active window
    Switch Window       NEW     timeout=10

    #Reload the Page
    Reload Page

    #Wait till the Property Name field is shown in the page
    Wait Until Page Contains Element    ${PropName}   timeout=10
    ${PropNameStatus}   Run Keyword And Return Status    Element Should Be Enabled    ${PropName}

    IF  ${PropNameStatus} == True
        # Fetch Property Name and Property Size
        ${PropertyName}      Get Text    ${PropName}
        Log to Console      Property Name: ${PropertyName}
        ${PropertySize}      Get Text    ${PropSize}
        Log to Console      Property Size: ${PropertySize}

        # Fetch the count of Amenities
        ${AmenitiesCount}   Get Element count   ${ListofAmenities}

        IF   ${AmenitiesCount} > 0
            # Amenities 1-line header
            Log to Console      Property Amenities Include:
            # For Loop for fetching the Amenities list should contain sub list
            FOR  ${j}  IN RANGE  1  ${AmenitiesCount}
                ${AmenityName}      Get Text     xpath=//div[contains(@class,'CollapseContainer')]//div[2]//div//div//div//div[contains(@class,'AmenityIconContainer')]//div[${j}]//div[2]
                #Append to the List
                Append To List     ${Amenity}    ${AmenityName}
            END
            # Display the Amenities on Console
            FOR  ${Amen}  IN  @{Amenity}
                Log to Console      ${Amen}
            END
        ELSE
            Log To Console    No Amenities. Individual House
        END

    ELSE
        Log To Console    Property Name Not Shown
        Close All Browsers

    END
