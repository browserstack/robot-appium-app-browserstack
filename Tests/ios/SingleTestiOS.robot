*** Settings ***
Library    AppiumLibrary
Library    String
Resource   ../common/KeywordsFile.robot
Test Setup  Open app
Test Teardown   Close app

*** Test Cases ***
Test iOS app
    test ui element

*** Keywords ***
Open app
    ${options}=    Create Dictionary
    ...    projectName=First Robot project
    ...    buildName=browserstack-build-1
    ...    sessionName=BStack first_test

    Open Application    ${REMOTE_URL}
    ...  platformName=ios
    ...  platformVersion=17.0
    ...  deviceName=iPhone 13
    ...  app=bs://<app-id>
    ...  bstack:options=${options}
    IMPLICIT WAIT    5
