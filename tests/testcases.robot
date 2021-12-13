*** Settings ***
Documentation   A Test Suite with the Different Test Cases for STSWENG Exercise
...             
...             This Test Follows follow the example using keywords from 
...             the Selenium Library
Library         SeleniumLibrary

*** Test Cases ***
Valid User Log in
    # Open the website
    Open Browser    https://www.saucedemo.com/      chrome
    # Enlarge browser window to max
    Maximize Browser Window
    # Checks if in login page
    Page Should Contain Element     login-button
    # Input Valid username
    Input Text      user-name       standard_user
    # Input Valid Password
    Input Password  password        secret_sauce
    # Logs in
    Click Button    login-button        
    # Checks if in product page
    Element Text Should Be     class:title     PRODUCTS
    # Close Browser
    [Teardown]      Close Browser

Invalid User Log in
    # Open the website
    Open Browser    https://www.saucedemo.com/      chrome
    # Enlarge browser window to max
    Maximize Browser Window
    # Checks if in login page
    Page Should Contain Element     login-button
    # Input Valid username
    Input Text      user-name       standard_user
    # Input invalid Password
    Input Password  password        wrong_password
    # Log in Attempt
    Click Button    login-button
    # Checks if Error Message Shown
    Element Text Should Be      xpath://*[@id="login_button_container"]/div/form/div[3]/h3      Epic sadface: Username and password do not match any user in this service
    # Close Browser
    [Teardown]      Close Browser

Locked Out User Login Attempt
    # Open the website
    Open Browser    https://www.saucedemo.com/      chrome
    # Enlarge browser window to max
    Maximize Browser Window
    # Checks if in login page
    Page Should Contain Element     login-button
    # Input Locked out user's username
    Input Text      user-name       locked_out_user
    # Input valid Password
    Input Password  password        secret_sauce
    # Log in Attempt
    Click Button    login-button
    # Checks if Error Message Shown
    Element Text Should Be      xpath://*[@id="login_button_container"]/div/form/div[3]/h3     Epic sadface: Sorry, this user has been locked out.
    # Close Browser
    [Teardown]      Close Browser

Problem User Broken Inventory Page
    # Open the website
    Open Browser    https://www.saucedemo.com/      chrome
    # Enlarge browser window to max
    Maximize Browser Window
    # Checks if in login page
    Page Should Contain Element     login-button
    # Input Problem user's username
    Input Text      user-name       problem_user
    # Input valid Password
    Input Password  password        secret_sauce
    # Logs in
    Click Button    login-button
    # Checks if in product page
    Element Text Should Be     class:title     PRODUCTS
    # Clicks on the Sauce Labs Bolt T-Shirt item
    Click Element   item_1_title_link
    # Checks if different Item page shown
    Element Text Should Not Be      class:inventory_details_name        Sauce Labs Bolt T-Shirt
    # Close Browser
    [Teardown]      Close Browser

Sort Product Name (A To Z)
    # Open the website
    Open Browser    https://www.saucedemo.com/      chrome
    # Enlarge browser window to max
    Maximize Browser Window
    # Checks if in login page
    Page Should Contain Element     login-button
    # Input Valid username
    Input Text      user-name       standard_user
    # Input Valid Password
    Input Password  password        secret_sauce
    # Logs in
    Click Button    login-button        
    # Checks if in product page
    Element Text Should Be     class:title     PRODUCTS
    # Clicks on Sorting Element
    Click Element   class:product_sort_container
    # Clicks on A To Z Sort
    Click Element   xpath://*[@id="header_container"]/div[2]/div[2]/span/select/option[1]
    # Compares first element to be the first item chronologically
    Element Text Should Be      class:inventory_item_name       Sauce Labs Backpack
    # Close Browser
    [Teardown]      Close Browser

Sort Product Name (Z To A)
    # Open the website
    Open Browser    https://www.saucedemo.com/      chrome
    # Enlarge browser window to max
    Maximize Browser Window
    # Checks if in login page
    Page Should Contain Element     login-button
    # Input Valid username
    Input Text      user-name       standard_user
    # Input Valid Password
    Input Password  password        secret_sauce
    # Logs in
    Click Button    login-button        
    # Checks if in product page
    Element Text Should Be     class:title     PRODUCTS
    # Clicks on Sorting Element
    Click Element   class:product_sort_container
    # Clicks on Z To A Sort
    Click Element   xpath://*[@id="header_container"]/div[2]/div[2]/span/select/option[2]
    # Compares first element to be the first element in reverse chronological order
    Element Text Should Be      class:inventory_item_name       Test.allTheThings() T-Shirt (Red)
    # Close Browser
    [Teardown]      Close Browser

Sort Products by Price (Low to High)
    # Open the website
    Open Browser    https://www.saucedemo.com/      chrome
    # Enlarge browser window to max
    Maximize Browser Window
    # Checks if in login page
    Page Should Contain Element     login-button
    # Input Valid username
    Input Text      user-name       standard_user
    # Input Valid Password
    Input Password  password        secret_sauce
    # Logs in
    Click Button    login-button        
    # Checks if in product page
    Element Text Should Be     class:title     PRODUCTS
    # Clicks on Sorting Element
    Click Element   class:product_sort_container
    # Clicks on Price (Low to High) Filter
    Click Element   xpath://*[@id="header_container"]/div[2]/div[2]/span/select/option[3]
    # Compares first element to be the first item with the Lowest Price
    Element Text Should Be      class:inventory_item_name       Sauce Labs Onesie
    # Close Browser
    [Teardown]      Close Browser

Sort Product by Price (High To Low)
    # Open the website
    Open Browser    https://www.saucedemo.com/      chrome
    # Enlarge browser window to max
    Maximize Browser Window
    # Checks if in login page
    Page Should Contain Element     login-button
    # Input Valid username
    Input Text      user-name       standard_user
    # Input Valid Password
    Input Password  password        secret_sauce
    # Logs in
    Click Button    login-button        
    # Checks if in product page
    Element Text Should Be     class:title     PRODUCTS
    # Clicks on Sorting Element
    Click Element   class:product_sort_container
    # Clicks on Price (High to Low) Filter
    Click Element   xpath://*[@id="header_container"]/div[2]/div[2]/span/select/option[4]
    # Compares first element to be the first item with the Highest Price
    Element Text Should Be      class:inventory_item_name       Sauce Labs Fleece Jacket
    # Close Browser
    [Teardown]      Close Browser