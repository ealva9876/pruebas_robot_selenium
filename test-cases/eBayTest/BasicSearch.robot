*** Settings ***
Documentation    Basic search functionality
Library    SeleniumLibrary
#Library    Selenium2Library
Test Teardown    Close Browser
Resource            ../../resources/variables.robot
Resource            ../../resources/keywords.robot

*** Variables ***
${REF_LINK_BUSCADO}    partial link:accesorios de cocina
${REF_PALABRA_CLAVE}    cocina accesorios
${EBAY_INPUTE_TEXT}    //*[@id="gh-ac"]
${EBAY_SEARCH_BUTTON}    id=gh-btn
*** Test Cases ***
Search Google ebay sampe test
    [Documentation]     Test eBay
    [Tags]    PruebaNavegacion
    Open Url With Chrome    ${EBAY_URL}
    Enter Keyword    ${REF_PALABRA_CLAVE}
    Click Search Button
    Filter result by condition
    Wait Until Element Is Visible   ${REF_LINK_BUSCADO}
    Page Should Contain Element     ${REF_LINK_BUSCADO}
    Sleep    2s
    Obtiene Link    ${REF_LINK_BUSCADO}
    
   # Click Link    partial link:accesorios de cocina
    Sleep    5s

*** Keywords ***
Enter Keyword
    [Arguments]     ${keyword}
    Input Text      ${EBAY_INPUTE_TEXT}     ${keyword}

Click Search Button    
    Wait Until Element Is Visible       ${EBAY_INPUTE_TEXT}
    Click Element    ${EBAY_SEARCH_BUTTON}
    #Click Element                       ${EBAY_INPUTE_TEXT}
    #Press Keys    ${EBAY_INPUTE_TEXT}    RETURN
    
Obtiene Link
    [Arguments]    ${Url} 
    Click Link    ${Url} 
    #Press Keys    css:#gh-ac

Filter result by condition
    Wait Until Element Is Visible    //*[@id="mainContent"]/div[1]/div/div[2]/div[2]/div[2]/span
    Click Element    //*[@id="mainContent"]/div[1]/div/div[2]/div[2]/div[2]/span
    Mouse Over    //*[@id="mainContent"]/div[1]/div/div[2]/div[2]/div[2]/span
    Mouse Down    //*[@id="mainContent"]/div[1]/div/div[2]/div[2]/div[2]/span
    Click Element    //*[@id="s0-60-0-12-8-4-1-0-4[0]-68[1]-23-content-menu"]/li[2]/a
