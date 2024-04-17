*** Settings ***
Library  AppiumLibrary
Library  manage_local_testing.py
Library  implicit_wait.py
Library  mark_test_status.py

*** Variables ***
${REMOTE_URL}                http://127.0.0.1:4723/wd/hub

# Android
${SEARCH_ACCESSIBILITY_ID}=  accessibility_id=Search Wikipedia
${SRC_ID}=                   id=org.wikipedia.alpha:id/search_src_text
${Browserstack}=             Browserstack
${Wikipedia}=                Wikipedia

# iOS
${SEARCH_TEXT_BUTTON}=       accessibility_id=Text Button
${SEARCH_TEXT_INPUT}=        accessibility_id=Text Input
${SEARCH_TEXT_OUTPUT}=       accessibility_id=Text Output
${VERIFY_TEXT_OUTPUT}=       hello@browserstack.com
${SRC_ID}=                   id=org.wikipedia.alpha:id/search_src_text
${TEST_TEXT}=                hello@browserstack.com

*** Keywords ***
Close app
    Close Application

Start Local testing
    START LOCAL

Stop Local testing
    STOP LOCAL

# Android test Keywords
Search for keyword browserstack in wiki app
    ${test_variable}=               Set Variable                   testing
    Log                             ${test_variable}    
    Log                             ${test_variable}[0]    
    Log                             ${test_variable}[-1]
    Log                             ${SRC_ID}
    wait until page contains        ${Wikipedia}                   
    click text                      ${Wikipedia}
    wait until element is visible   ${SRC_ID}
    input text                      ${SRC_ID}                      ${Browserstack}                  
    Log                             ${test_variable}

Validate search test
    BuiltIn.Log     hi
    ${length}=      get length    xpath=//android.widget.TextView
    BuiltIn.Log     ${length}
    Should Be True     ${length}>0

# iOS test Keywords
test ui element
    ${test_variable}=               Set Variable                   testing
    Log                             ${test_variable}    
    Log                             ${test_variable}[0]    
    Log                             ${test_variable}[-1]
    Log                             ${SRC_ID}
    wait until element is visible   ${SEARCH_TEXT_BUTTON}                   
    click element                   ${SEARCH_TEXT_BUTTON}
    wait until element is visible   ${SEARCH_TEXT_INPUT}
    input text                      ${SEARCH_TEXT_INPUT}           ${TEST_TEXT}\n
    ${OUTPUT_TEXT}                  get text                       ${SEARCH_TEXT_OUTPUT}
    Log                             ${OUTPUT_TEXT}
    should be equal                 ${OUTPUT_TEXT}                 ${VERIFY_TEXT_OUTPUT}  
