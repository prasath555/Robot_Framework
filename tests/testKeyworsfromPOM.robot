*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library     Collections
Test Setup        open the browser with the Mortgage payment Url                #browser invoke-> resource file
Test Teardown        Close Browser Session                                        #browser close-> resource file
Resource        Generic.robot                                      #common files fetched from resource file
Resource        ../PageObjectModel/Landingpage.robot    #keywords are fetched to testcase
Resource        ../PageObjectModel/Shoppage.robot
Resource        ../PageObjectModel/Checkoutpage.robot
Resource        ../PageObjectModel/Confirmationpage.robot
Library            ../customLibraries/Shop.py
#this file is fetches reusable/common files from Generic.robot


*** Variables ***
@{list_of_products}           Blackberry    iPhone X    
#note test data can be located here but not locators
${country_name}    India

*** Test Cases ***
#validate UnSuccessful Login
#    Fill the Login form    ${user_name}    ${invalid_pwd}
 #   Landingpage.Wait until it checks and displays error message
#    Landingpage.Verify error message is correct


End to End Ecommerce product validation
     Landingpage.Fill the Login form    ${user_name}    ${valid_pwd}
     Shoppage.Wait Until Element is located in the page
     Shoppage.Verify Card titles in the Shop page
     select The Particular Item    ${list_of_products[0]}
     Checkoutpage.verify item in the checkout page and proceed
     Confirmationpage.Enter the Country and select the terms    ${country_name}
     Confirmationpage.Purchase the product and confirm the purchase
   #  Select The Particular Item    @{list_of_products}


# 2 resources files are there -> avoid conflict -> keyword -> from particular page is mentioned as
#Landingpage.Fill the Login form    ${user_name}    ${valid_pwd} -> keywors from pom -> landingoage
