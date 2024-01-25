*** Settings ***
Resource         ../../pageObjects/base/base.robot
Resource         ../../pageObjects/homePageObject/homePage.robot
Variables        loginpage_locators.yaml
Library          AppiumLibrary


*** Keywords ***
Verify Login Page Appears
    Wait Until Element Is Visible        ${username_input_loginPage}
    Wait Until Element Is Visible        ${password_input_loginPage}
    Wait Until Element Is Visible        ${signIn_loginPage}

Input Username on Login Page
    [Arguments]       ${email}
    Input Text        ${username_input_loginPage}    ${email}

Input Password on Login Page
    [Arguments]       ${password}
    Input Text        ${password_input_loginPage}    ${password}

Click Sign In Button on Login Page
    Click Element    ${signIn_loginPage}

Verify User Failed Login
    Wait Until Page Contains   ${invalid_message_loginPage} 

User Success Login
    [Arguments]                        ${username}    ${password}
    Verify Home Page Appears
    Click Sign In Button in Home Page
    Verify Home Page Appears
    Input Username on Login Page        ${username}
    Input Password on Login Page        ${password}
    Click Sign In Button on Login Page
    Verify User is Logged In