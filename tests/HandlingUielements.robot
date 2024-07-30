*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    Collections
Test Setup        open the browser with the Mortgage payment Url                #browser invoke-> resource file
#Test Teardown        Close Browser Session                                        #browser close-> resource file
Resource        Generic.robot                                      #common files fetched from resource file
*** Variables ***
#${Shop_page_load}        xpath:/html/body/app-root/app-shop/div/div/div[1]/div/a[1]
#${product_name}        Blackberry

*** Test Cases ***
Select the particular item from shopping_page   # valid login - TC-2
     Fill the Login form    ${user_name}    ${valid_pwd}
     Select the option from radio button
     Handle Alert after clicking radio button
     Select the option from static dropdown
     Click on the check box as agree
     #Click signin button to login
    # Wait Until Element is located in the page    ${Shop_page_load}
    #Verify Card titles in the Shop page
    # Select the particular item    ${product_name}

*** Keywords ***
Fill the Login form
    [Arguments]    ${username}    ${password}    #this arguments capture data wat we send
    Input Text         id:username    ${username}       # call the above arguments inside teststeps
    Input Password     id:password    ${password}     # now this method is generic works for valid & invalid
   # Click Button       signInBtn

Select the option from radio button
   Click Element     css:input[value='user']

Handle Alert after clicking radio button
    Wait Until Element Is Visible    css:.modal-content
    Click Button    okayBtn
    Click Button    okayBtn  #issue repeating twice
    Wait Until Element Is Not Visible    css:.modal-content

Select the option from static dropdown
    Select From List By Value    css:select.form-control    teach

Click on the check box as agree
    Select Checkbox    terms
    Checkbox Should Be Selected    terms

#Click signin button to login
#Wait Until Element is located in the page             # this wait mechanism also become generic
#    [Arguments]    ${element}
#    Wait Until Element Is Visible    ${element}

#Verify Card titles in the Shop page
#    @{expectedlist}=    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
#   ${elements}=    Get Webelements    css:.card-title
#   @{actuallist}=    Create List    #new list -> to capture-> webelements from browser
#     Log    ${element.text}
#     Append To List    ${actuallist}    ${element.text}  #append the elements to list
#   END                                                 # @ - new list  # $ - using already existing list
#   Lists Should Be Equal    ${expectedlist}     ${actuallist}  #compare both list matches(given list = browser list)

#Select the particular item
#    [Arguments]        ${product_name}
#    ${elements}=    Get Webelements    css:.card-title
#    ${index}=       Set Variable    1
#   FOR    ${element}    IN    @{elements}

#        Exit For Loop If    '${product_name}' == '${element.text}'
#        ${index}=    Evaluate    ${index} + 1
#    END
 #   Click Button    xpath:(//*[@class='card-footer'])[${index}]/button
 #   Sleep    15s
