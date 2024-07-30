*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    ../customLibraries/Shop.py                  # ../<directory>/<python file>
Test Setup        open the browser with the Mortgage payment Url                #browser invoke-> resource file
Test Teardown        Close Browser Session                                        #browser close-> resource file
Resource        Generic.robot                                      #common files fetched from resource file

#this file is fetches reusable/common files from Generic.robot
*** Variables ***
${Error_Message_Login}    css:.alert-danger
${Shop_page_load}        xpath:/html/body/app-root/app-shop/div/div/div[1]/div/a[1]

*** Test Cases ***
validate UnSuccessful Login  # invalid login - TC-1

    Fill the Login form    ${user_name}    ${invalid_pwd}
    Wait Until Element is located in the page    ${Error_Message_Login}
    Verify error message is correct

validate Successful Login   # valid login - TC-2

     Fill the Login form    ${user_name}    ${valid_pwd}
     Wait Until Element is located in the page    ${Shop_page_load}
     Hello World


*** Keywords ***

Fill the Login form
    [Arguments]    ${username}    ${password}    #this arguments capture data wat we send
    Input Text         id:username    ${username}       # call the above arguments inside teststeps
    Input Password     id:password    ${password}     # now this method is generic works for valid & invalid
    Click Button       signInBtn

Wait Until Element is located in the page             # this wait mechanism also become generic
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

Verify error message is correct
    #${result}=    Get Text    ${Error_Message_Login}
    #Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.  #tiz line perform->action of above 2 line
                              # actual                    # expected
#Element Text Should Be -> built it keyword from sel-lib -> verify & compare the text


