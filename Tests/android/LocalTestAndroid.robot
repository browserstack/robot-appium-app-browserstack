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
    ...  platformName=android
    ...  platformVersion=9.0
    ...  deviceName=Google Pixel 3
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
    click element    id=com.example.android.basicnetworking:id/test_action

Validate output
    Sleep    5s
    ${search_results}=    Get Web Elements    class=android.widget.TextView
    FOR    ${result}    IN    @{search_results}
        ${result_text}=    Get Text    ${result}
        ${modified_result_text}=    Replace String    ${result_text}    \n    ${EMPTY}
        ${match}=    Run Keyword If    'The active connection is wifi' in '${modified_result_text}'    Set Variable    True    ELSE    Set Variable    False
        Log    ${match}
    END
    Should Be True    ${match}
    Run Keyword If    ${match} is True    TEST STATUS    passed  Test results have been validated!
    Run Keyword If    ${match} is False    TEST STATUS    failed    Something went wrong!
