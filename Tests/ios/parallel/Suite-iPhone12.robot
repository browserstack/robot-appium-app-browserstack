*** Settings ***
Library    AppiumLibrary
Library    String
Resource   ../../common/KeywordsFile.robot
Test Setup  Open app
Test Teardown   Close app

*** Test Cases ***
Test iOS app
    test ui element

*** Keywords ***
Open app
    Open Application    ${REMOTE_URL}   platformName=ios    platformVersion=17   deviceName=iPhone 12   app=bs://<app-id>