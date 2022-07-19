*** Settings ***
Documentation   This automation is created to submit a side file on WebFileExpress
Library         SeleniumLibrary


*** Variables ***
${WEBFILEEXPRESS URL}   https://webfileexpressapp.returns.ci.avalara.io/
${BROWSER}              Chrome


*** Test Cases ***
Fill WebFileExpress Form
    Open WebFileExpress
    Choose Side File        C:\\Users\\abhinav.jindal\\Downloads\\USCODR0100_NonZero_EFT_Final (15).side
    Enter DOR Base URL      https://www.colorado.gov/revenueonline/_/
    Enter Country           US
    Enter Scraper Region    CO
    Enter Tax Form Code     USCODR0100
    Click On Next Button


*** Keywords ***
Open WebFileExpress
    Open Browser            ${WEBFILEEXPRESS URL}               ${BROWSER}
    Title Should Be         WebFileExpress

Choose Side File
    [Arguments]             ${sideFilePath}
    Choose File             id:sideFilePath                     ${sideFilePath}

Enter DOR Base URL
    [Arguments]             ${dorBaseURL}
    Input Text              id:validationDORBaseURL             ${dorBaseURL}

Enter Country
    [Arguments]             ${country}
    Input Text              id:validationInputCountry           ${country}

Enter Scraper Region
    [Arguments]             ${region}
    Input Text              id:validationInputScraperRegion     ${region}

Enter Tax Form Code
    [Arguments]             ${taxFormCode}
    Input Text              id:validationInputTaxFormCode       ${taxFormCode}

Click On Next Button
    Click Button            xpath://button[@type='submit']