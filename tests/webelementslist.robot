*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    Collections
Test Setup        open the browser with the Mortgage payment Url                #browser invoke-> resource file
Test Teardown        Close Browser Session                                        #browser close-> resource file
Resource        Generic.robot                                      #common files fetched from resource file
*** Variables ***
${Shop_page_load}        xpath:/html/body/app-root/app-shop/div/div/div[1]/div/a[1]

*** Test Cases ***
validate cards display in shopping page   # valid login - TC-2
     Fill the Login form    ${user_name}    ${valid_pwd}
     Wait Until Element is located in the page    ${Shop_page_load}
     Verify Card titles in the Shop page
*** Keywords ***
Fill the Login form
    [Arguments]    ${username}    ${password}    #this arguments capture data wat we send
    Input Text         id:username    ${username}       # call the above arguments inside teststeps
    Input Password     id:password    ${password}     # now this method is generic works for valid & invalid
    Click Button       signInBtn

Wait Until Element is located in the page             # this wait mechanism also become generic
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

Verify Card titles in the Shop page
    @{expectedlist}=    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements}=    Get Webelements    css:.card-title
    @{actuallist}=    Create List    #new list -> to capture-> webelements from browser
    FOR    ${element}    IN    @{elements}
     Log    ${element.text}
     Append To List    ${actuallist}    ${element.text}  #append the elements to list
    END                                                 # @ - new list  # $ - using already existing list
    Lists Should Be Equal    ${expectedlist}     ${actuallist}  #compare both list matches(given list = browser list)


