*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary


*** Variables ***

${user_name}       rahulshettyacademy
${invalid_pwd}        12345678
${valid_pwd}        learning
${url}            https://rahulshettyacademy.com/loginpagePractise/
${Shop_page_load}        xpath:/html/body/app-root/app-shop/div/div/div[1]/div/a[1]


*** Keywords ***
open the browser with the Mortgage payment Url
    Create Webdriver    Chrome
    Go To    ${url}

Close Browser session
    Close Browser

Wait Until Element is located in the page             # this wait mechanism also become generic
    Wait Until Element Is Visible    ${Shop_page_load}
