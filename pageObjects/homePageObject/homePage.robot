*** Settings ***
Resource            ../../pageObjects/base/base.robot
Variables           homepage_locators.yaml
Library             AppiumLibrary
  

*** Keywords ***
Verify Home Page Appears
    Wait Until Element Is Visible    ${logo_homePage}

Click Sign In Button in Home Page
    Click Element                    ${signIn_homePage}

Verify User is Logged In
    Wait Until Element Is Visible    ${username_homePage}

Click Search Button in Main Page
    Click Element                    ${search_main}    