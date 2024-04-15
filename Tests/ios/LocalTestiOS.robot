*** Settings ***
Library    AppiumLibrary
Resource   ../common/KeywordsFile.robot
Library    String
Test Setup    Open app
Test Teardown    Close app

*** Variables ***
${APP_ID}=     bs://<app-id>

*** Test Cases ***
Test Networking app
    Test connection
    Validate output

*** Keywords ***
Open app
    open application    ${REMOTE_URL}    app=${APP_ID}   platformName=ios    platformVersion=17   deviceName=iPhone 13    browserstack.local=true     autoGrantPermissions=true
    IMPLICIT WAIT    5

Test connection
    click element    id=TestBrowserStackLocal

Validate output
    ${output}=      get text    id=ResultBrowserStackLocal
    run keyword and return if    "${output}"=="Up and running"   TEST STATUS    passed  Test passed!
    run keyword and return    TEST STATUS    failed   Test failed!
