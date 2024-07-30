*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    String
Library    Collections
Test Setup        open the browser with the Mortgage payment Url                #browser invoke-> resource file
Test Teardown        Close Browser Session                                        #browser close-> resource file
Resource        Generic.robot                                      #common files fetched from resource file

#this file is fetches reusable/common files from Generic.robot
*** Variables ***

*** Test Cases ***
Validate child window functionality
    select the link of child window
    verify the user is switched to child window
    Grab the email id in the child window
    Switch to parent window and enter the email

**** Keywords ***
select the link of child window
    Click Element    css:.blinkingText
    Sleep    5

verify the user is switched to child window
    Switch Window    NEW
    Element Text Should Be    css:.inner-box    DOCUMENTS REQUEST

Grab the email id in the child window
    ${text}=    Get Text    css:.red
    @{words}=    Split String     ${text}    at
    #0 -> please email u
    #1 -> mentor@rahulshetty.com with below template to receive response
    ${text_split}=    Get From List    ${words}    1
    Log    ${text_split}
    @{words-2}=    Split String    ${text_split}   #splits blank space if nothing is declared
    #0 -> mentor@rahulshetty.com
    ${email}=    Get From List    ${words-2}    0   # note even $ - @ symbol declaration may lead to error
    Set Global Variable    ${email}

Switch to parent window and enter the email
    Switch Window    MAIN
    Title Should Be        LoginPage Practise | Rahul Shetty Academy
    Input Text        id:username   ${email}
