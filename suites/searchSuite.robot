*** Settings ***
Resource              ../pageObjects/base/base.robot
Resource              ../pageObjects/searchPageObject/searchPage.robot
Resource              ../pageObjects/loginPageObject/loginPage.robot
Resource              ../pageObjects/homePageObject/homePage.robot

Test Setup            Open Flight Application
Test Teardown         Close Flight Application

*** Variables ***
${VALID_EMAIL}            support@ngendigital.com
${VALID_PASSWORD}         abc123
${FLIGHT_NUMBER}          DA935
${INVALID_FLIGHT_NUMBER}  FLIGHT

*** Test Cases ***
User should be able to Search Booking Number
    # Step 1: User Success Login
    Verify Home Page Appears
    Click Sign In Button in Home Page
    Verify Login Page Appears
    Input Username on Login Page    ${VALID_EMAIL}
    Input Password on Login Page    ${VALID_PASSWORD}
    Click Sign In Button on Login Page
    Verify User is Logged In
    # Step 2: Click Search Button in Home Page
    Click Search Button in Home Page
    # Step 3: Verify Search Page Appears
    Verify Search Page Appears
    # Step 4: Input Flight Number
    Input Flight Number    ${FLIGHT_NUMBER}
    # Step 5: Click Search Button in Search Page
    Click Search Button in Search Page
    # Step 6: Verify Booking Number Appears 
    Verify Booking Number Appears

User should not be able to Search Booking Number with Invalid Number
    # Step 1: User Success Login
    Verify Home Page Appears
    Click Sign In Button in Home Page
    Verify Login Page Appears
    Input Username on Login Page    ${VALID_EMAIL}
    Input Password on Login Page    ${VALID_PASSWORD}
    Click Sign In Button on Login Page
    Verify User is Logged In
    # Step 2: Click Search Button in Home Page
    Click Search Button in Home Page
    # Step 3: Verify Search Page Appears
    Verify Search Page Appears
    # Step 4: Input Flight Number
    Input Flight Number    ${INVALID_FLIGHT_NUMBER}
    # Step 5: Click Search Button in Search Page
    Click Search Button in Search Page
    # Step 6: Verify Invalid Booking Number Appears 
    Error Message Appears

User should not be able to Search Booking Number with empty field
    # Step 1: User Success Login
    Verify Home Page Appears
    Click Sign In Button in Home Page
    Verify Login Page Appears
    Input Username on Login Page    ${VALID_EMAIL}
    Input Password on Login Page    ${VALID_PASSWORD}
    Click Sign In Button on Login Page
    Verify User is Logged In
    # Step 2: Click Search Button in Home Page
    Click Search Button in Home Page
    # Step 3: Verify Search Page Appears
    Verify Search Page Appears
    # Step 4: Click Search Button in Search Page
    Click Search Button in Search Page
    # Step 5: Verify Blank Message Appears 
    Error Message Appears

User should not be able to Search Booking Number without Login
    #Step 1: Click Search Button in Home Page
    Verify Home Page Appears
    Click Search Button in Main Page
    #Step 2: Verify Search Page not Appears
    Verify Search Page not Appears