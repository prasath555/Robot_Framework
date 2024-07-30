*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    Collections
Test Setup        open the browser with the Mortgage payment Url                #browser invoke-> resource file
#Test Teardown        Close Browser Session                                        #browser close-> resource file
Resource        Generic.robot                                      #common files fetched from resource file
*** Variables ***
${Shop_page_load}        xpath:/html/body/app-root/app-shop/div/div/div[1]/div/a[1]
${product_name}        Blackberry

*** Test Cases ***
Select the particular item from shopping_page   # valid login - TC-2
     Fill the Login form    ${user_name}    ${valid_pwd}
     Wait Until Element is located in the page    ${Shop_page_load}
     Verify Card titles in the Shop page
     Select the particular item    ${product_name} 
     
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

Select the particular item
    [Arguments]        ${product_name}
    ${elements}=    Get Webelements    css:.card-title
    ${index}=       Set Variable    1
    FOR    ${element}    IN    @{elements}

        Exit For Loop If    '${product_name}' == '${element.text}'
        ${index}=    Evaluate    ${index} + 1
    END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button
    Sleep    15s


    #get all webelements from the list
    #${elements}=    Get Webelements    css:.card-title
    #we dont know index -> assign variable-> loop starts with index 0 -> assign 1
    #${index}=    Set Variable    1
    #iterate through loop -> @{elements} -> contains all list of items
    #FOR    ${element}    IN    @{elements}
    #        Exit For Loop If       ${product_name} ==  ${element.text}    #within the list-> if name matched exit loop
                                                                       #variables should be wrapped in quote
    #           ${index}=    ${index} + 1    #if not matched-> increment to next index
   #END                                     # if it matches -> index will be captured-> passed to click button
   # Click Button    xpath:(//*[@class='card-footer'])[${index}]/button
    #xpath:(//*[@class='card-footer'])[4]/button
    #note: ${index}=    Evaluate   ${index} + 1 ( Evaluate ) keyword is necessary in incrementation( robo frame understands)
