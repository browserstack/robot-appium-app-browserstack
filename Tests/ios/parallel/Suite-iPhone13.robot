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
    Open Application    ${REMOTE_URL}   platformName=ios    platformVersion=17.0   deviceName=iPhone 13   app=bs://c492ed2b9e05857e9c95a240d813afe7bd3a8a7a