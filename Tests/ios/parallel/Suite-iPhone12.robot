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
    ${options}=    Create Dictionary
    ...    projectName=First Robot project
    ...    buildName=browserstack-build-1
    ...    sessionName=BStack parallel_test

    Open Application    ${REMOTE_URL}
    ...  platformName=ios
    ...  platformVersion=17
    ...  deviceName=iPhone 12
    ...  app=bs://<app-id>
    ...  bstack:options=${options}
    IMPLICIT WAIT    5