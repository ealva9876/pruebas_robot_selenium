*** Settings ***
Documentation       Search Google
Library             SeleniumLibrary
Test Teardown       Close Browser
Resource            ../resources/variables.robot
Resource            ../resources/keywords.robot


*** Test Cases ***
Search Google with "Google Search" button via Chrome
    [Documentation]    Google test
    [Tags]    testfuncional
    Open Url With Chrome            ${GOOGLE_URL}
    #Switch to English language
    Enter Keyword                   Github
    Click Search Button
    Wait Until Element Is Visible   partial link:github
    Page Should Contain Element     partial link:github
    Click Link    partial link:github

Search Google with "Google Search" button via Firefox
    [Documentation]    Firefox Test
    [Tags]    testfuncional
    Open Url With Firefox           ${GOOGLE_URL}
   #Switch to English language
    Enter Keyword                   Github
    Click Search Button
    Wait Until Element Is Visible   partial link:github
    Page Should Contain Element     partial link:github
    Click Link    partial link:github

*** Keywords ***
Switch to English language
    Click Element   xpath://a[contains(text(), "English")]

Enter Keyword
    [Arguments]     ${keyword}
    Input Text      name:q     ${keyword}

Click Search Button
    Wait Until Element Is Visible       xpath://textarea[@class="gLFyf"]
    Click Element                       xpath://textarea[@class="gLFyf"]
    Press Key    class:gLFyf    \\13

Click Search ButtonF
    Wait Until Element Is Visible       xpath://input[@class="fake-editable"]
    Click Element                       xpath://input[@class="fake-editable"]
    Press Key    class:fake-editable    \\13   