*** Settings ***

Resource    ../homePageObject/homePage.robot
Variables   searchpage_locators.yaml
Library     AppiumLibrary


*** Keywords ***
Click Search Button in Home Page
    Click Element                        ${search_homepage}

Verify Search Page Appears
    Wait Until Element Is Visible        ${search_input_searchpage}

Input Flight Number
    [Arguments]                          ${flight_number}
    Input Text                           ${search_input_searchpage}    ${flight_number}

Click Search Button in Search Page
    Click Element                        ${search_button_searchpage}

Verify Booking Number Appears
    Wait Until Element Is Visible       ${logo_flight}

Verify Search Page not Appears
    Page Should Not Contain Element    ${search_input_searchpage}

Error Message Appears
    Page Should Contain Text           ${error_message}