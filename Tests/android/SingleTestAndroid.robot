*** Settings ***
Library    AppiumLibrary
Library    String
Resource   ../common/KeywordsFile.robot
Test Setup  Open app
Test Teardown   Close app

*** Test Cases ***

Sample test on Wikipedia apk
    Search for keyword browserstack in wiki app
    Validate search test

*** Keywords ***
Open app
    Open Application    ${REMOTE_URL}   platformName=android    platformVersion=9.0   deviceName=Google Pixel 3   app=bs://<app-id>
