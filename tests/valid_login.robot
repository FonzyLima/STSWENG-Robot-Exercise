*** Settings ***
Documentation   A Test Suite with a Single Test for Valid Login
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
    # Logs in
    Click Button    login-button
    # Checks if Error Message Shown
    Page Should Contain     Epic sadface: Username and password do not match any user in this service
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
    # Logs in
    Click Button    login-button
    # Checks if Error Message Shown
    Page Should Contain     Epic sadface: Sorry, this user has been locked out.
    # Close Browser
    [Teardown]      Close Browser

