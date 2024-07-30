*** Settings ***
Documentation    All the page objects and keywords of Landing page
Library    SeleniumLibrary
Resource        Generic.robot


*** Variables ***
${Shop_page_load}        css:.nav-link
${country_name}        xpath://a[text()='India']
${country_name_load}     xpath://a[normalize-space()='India']


*** Keywords ***
Enter the Country and select the terms
    [Arguments]    ${country_name}
    Input Text        country          ${country_name}
    Generic.Wait Until Element is located in the page      # //a[text()='${country_name}']
    sleep    5s
    Click Element       ${country_name_load} # xpath://a[text()='${country_name}']
    Click Element        css:.checkbox label

Purchase the product and confirm the purchase
    Click Element        xpath://*[@id="navbarResponsive"]/ul/li/a/span          #css:input[value='Purchase']                                  # xpath://input[@value='Purchase']
   #Click Element    css:input.btn.btn-success.btn-lg[type='submit']
    Page Should Contain    Success!

