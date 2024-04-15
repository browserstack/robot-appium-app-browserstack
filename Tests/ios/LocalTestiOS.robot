*** Settings ***
Library    AppiumLibrary
Resource   ../common/KeywordsFile.robot
Library    String
Test Setup    Local Test Setup
Test Teardown    Local Test Teardown

*** Variables ***
${APP_ID}=     bs://<app-id>

*** Test Cases ***
Test Networking app
    Test connection
    Validate output

*** Keywords ***
Open app
    ${options}=    Create Dictionary
    ...    projectName=First Robot Local project
    ...    buildName=browserstack-build-1
    ...    sessionName=BStack local_test
    ...    local=true

    Open Application    ${REMOTE_URL}
    ...  platformName=ios
    ...  platformVersion=17
    ...  deviceName=iPhone 13
    ...  app=${APP_ID}
    ...  bstack:options=${options}

    IMPLICIT WAIT    5

Local Test Setup
    Start Local testing
    Open app

Local Test Teardown
    Close app
    Stop Local testing

Test connection
    click element    id=TestBrowserStackLocal

Validate output
    ${output}=      get text    id=ResultBrowserStackLocal
    run keyword and return if    "${output}"=="Up and running"   TEST STATUS    passed  Test passed!
    run keyword and return    TEST STATUS    failed   Test failed!
