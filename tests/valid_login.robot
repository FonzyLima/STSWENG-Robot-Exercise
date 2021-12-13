*** Settings ***
Documentation   A Test Suite with a Single Test for Valid Login
...             
...             This Test Follows follow the example using keywords from 
...             the Selenium Library
Library         SeleniumLibrary

*** Variables ***


*** Keywords ***


*** Test Cases ***
Valid Login 
    Open Browser    https://www.saucedemo.com/      chrome
    Maximize Broswer Window