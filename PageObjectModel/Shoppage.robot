*** Settings ***
Documentation    All the page objects and keywords of shop page
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${Shop_page_load}        xpath:/html/body/app-root/app-shop/div/div/div[1]/div/a[1]
${country_name_load}     xpath://a[normalize-space()='India']
*** Keywords ***
Wait Until Element is located in the page             # this wait mechanism also become generic
    Wait Until Element Is Visible    ${Shop_page_load}

Verify Card titles in the Shop page
    @{expectedList}=    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements}=    Get Webelements    css:.card-title
    @{actualList}=    Create List
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        Log    ${text}
        Append To List    ${actualList}    ${text}
    END
    Lists Should Be Equal    ${expectedList}    ${actualList}

Select The Particular Item
    [Arguments]    ${product_name}
    ${elements}=    Get Webelements    css:.card-title
    ${index}=    Set Variable    1
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        Exit For Loop If    '${product_name}' == '${text}'
        ${index}=    Evaluate    ${index} + 1
    END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button
    Sleep    15s