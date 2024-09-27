*** Settings ***
Documentation    Basic search functionality
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***
Input Search Text and Click Search
    [Arguments]     ${keyword}    ${input_text}    ${search_buton}
    Input Text      ${input_text}     ${keyword}  
    Wait Until Element Is Visible       ${input_text}
    Click Element    ${search_buton}
