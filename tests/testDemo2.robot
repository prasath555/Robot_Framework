*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Test Teardown  Close Browser
#Test Teardown -> runs last of each and every testcase (close browser/ clear cookies)
#close browser-> built in keyword in selenium lib -> closes current browser after each testcase
#usage of variable module    //locators are stored as variable => ${variablename}
*** Variables ***
${Error_Message_Login}    css:.alert-danger

*** Test Cases ***
validate UnSuccessful Login
    open the browser with the Mortgage payment Url
    Fill the Login form
    Wait until it checks and displays error message
    Verify error message is correct

*** Keywords ***
open the browser with the Mortgage payment Url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the Login form
    Input Text         id:username    rahulshettyacademy
    Input Password     id:password    rahulshetty
    Click Button       signInBtn

Wait until it checks and displays error message
    Wait Until Element Is Visible    ${Error_Message_Login}

Verify error message is correct
    ${result}=    Get Text    ${Error_Message_Login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.  #tiz line perform->action of above 2 line
                              # actual                    # expected
#Element Text Should Be -> built it keyword from sel-lib -> verify & compare the text

# Define additional keywords for interacting with the login form and verifying error messages
# Example:
# Fill the Login form
# Wait until it checks and displays error message
# Verify error message is correct
