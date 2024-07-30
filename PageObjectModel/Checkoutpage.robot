*** Settings ***
Documentation    All the page objects and keywords of Landing page
Library    SeleniumLibrary

*** Variables ***
${checkout_page}        css:.btn-success



*** Keywords ***

verify item in the checkout page and proceed
    Click Element    css:.btn-primary 
    Wait Until Element Is Visible    ${checkout_page}
    Click Element    css:.btn-success
    sleep    5s  
    