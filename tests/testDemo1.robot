*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary

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
    Input Text    id:username  rahulshettyacademy
    Input Password    id:password  rahulshetty
    Click Button    signInBtn

Wait until it checks and displays error message
    Wait Until Element Is Visible    css:.alert-danger

Verify error message is correct
    ${result}=    Get Text    css:.alert-danger
    Should Be Equal As Strings    ${result}    Incorrect username/password.


# Define additional keywords for interacting with the login form and verifying error messages
# Example:
# Fill the Login form
# Wait until it checks and displays error message
# Verify error message is correct
