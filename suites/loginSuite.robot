*** Settings ***
Resource    ../pageObjects/base/base.robot
Resource    ../pageObjects/homePageObject/homePage.robot
Resource    ../pageObjects/loginPageObject/loginPage.robot

Test Setup           Open Flight Application
Test Teardown        Close Flight Application

*** Variables ***
${VALID_EMAIL}            support@ngendigital.com
${VALID_PASSWORD}         abc123
${INVALID_EMAIL}          email
${INVALID_PASSWORD}       pass

*** Test Cases ***
User should be able to sign in with valid credentials
    #Step 1 : Verify home page appears
    Verify Home Page Appears
    #Step 2 : Click Sign in button in home page
    Click Sign In Button in Home Page
    #Step 3 : Verify login page appears
    Verify Login Page Appears
    #Step 4 : Input username
    Input Username on Login Page        ${VALID_EMAIL}
    #Step 5 : Input password
    Input Password on Login Page        ${VALID_PASSWORD}
    #Step 6 : Click Sign in button in login page
    Click Sign In Button on Login Page
    #Step 7 : Verify user is logged in
    Verify User is Logged In

User should not be able to sign in with invalid credentials
    #Step 1 : Verify home page appears
    Verify Home Page Appears
    #Step 2 : Click Sign in button in home page
    Click Sign In Button in Home Page
    #Step 3 : Verify login page appears
    Verify Login Page Appears
    #Step 4 : Input username
    Input Username on Login Page        ${INVALID_EMAIL}
    #Step 5 : Input password
    Input Password on Login Page        ${INVALID_PASSWORD}
    #Step 6 : Click Sign in button in login page
    Click Sign In Button on Login Page
    #Step 7 : Verify user failed logged in
    Verify User Failed Login

User should not be able to sign in with Username Field Empty
    #Step 1 : Verify home page appears
    Verify Home Page Appears
    #Step 2 : Click Sign in button in home page
    Click Sign In Button in Home Page
    #Step 3 : Verify login page appears
    Verify Login Page Appears
    #Step 4 : Input password
    Input Password on Login Page        ${VALID_PASSWORD}
    #Step 5 : Click Sign in button in login page
    Click Sign In Button on Login Page
    #Step 6 : Verify user failed logged in
    Verify User Failed Login

User should not be able to sign in with Password Field Empty
    #Step 1 : Verify home page appears
    Verify Home Page Appears
    #Step 2 : Click Sign in button in home page
    Click Sign In Button in Home Page
    #Step 3 : Verify login page appears
    Verify Login Page Appears
    #Step 4 : Input username
    Input Username on Login Page        ${VALID_EMAIL}
    #Step 5 : Click Sign in button in login page
    Click Sign In Button on Login Page
    #Step 6 : Verify user failed logged in
    Verify User Failed Login

User should not be able to sign in with Empty Field
    #Step 1 : Verify home page appears
    Verify Home Page Appears
    #Step 2 : Click Sign in button in home page
    Click Sign In Button in Home Page
    #Step 3 : Verify login page appears
    Verify Login Page Appears
    #Step 4 : Click Sign in button in login page
    Click Sign In Button on Login Page
    #Step 5 : Verify user failed logged in
    Verify User Failed Login