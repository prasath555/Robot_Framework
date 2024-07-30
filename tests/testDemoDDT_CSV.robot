*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    DataDriver         file=resources/data.csv    encoding=utf_8    dialect=unix
 # to import data from csv file-> plugin & import is needed
Test Teardown  Close Browser
Test Template    Validate UnSuccessful Login    # Test Template used for DDT
#complete testcase is wrapped under keywords -> to perform DDT
*** Variables ***
${Error_Message_Login}    css:.alert-danger

*** Test Cases ***    username    password
#generic method to login
Login with user ${username} and password ${password}        xyb        werit   #default data

*** Keywords ***
validate UnSuccessful Login             # exact arugument should be present in csv column headers
    [Arguments]    ${username}    ${password}
    open the browser with the Mortgage payment Url
    Fill the Login form    ${username}    ${password}
    Wait until it checks and displays error message
    Verify error message is correct


open the browser with the Mortgage payment Url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the Login form
        [Arguments]    ${username}    ${password}
    Input Text         id:username    ${username}
    Input Password     id:password    ${password}
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
