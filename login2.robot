*** Settings ***
Documentation    Suite description
Library      SeleniumLibrary

*** Variables ***
${url}      https://app.deriv.com
${pwField}  //*[@type="password"]
${LogInButton}  //*[text()="Log in"]
${emailField}   name=email


*** Keywords ***
ApiPage
    [arguments]     ${email}    ${pw}
    Open Browser    ${url}    chrome
    maximize browser window
    wait until page contains element    dt_login_button     20
    click element   dt_login_button
    wait until page contains element    name=email      10
    input text      ${emailField}      ${email}
    input text      ${pwField}      ${pw}
    click element   ${LogInButton}
    wait until page does not contain element        xpath://*[@id="dt_core_header_acc-info-preloader"]    20
    click element       //*[@class="dc-icon"]
    wait until page contains element        //*[@id="dc_api-token_link"]        10
    click element       //*[@id="dc_api-token_link"]
    wait until page does not contain element        //*[@class="initial-loader account__initial-loader"]        10


Clear Input
    [Arguments]    ${input_field}
    Wait Until Page Contains Element    ${input_field}    5
    ${current_value}=    Get Element Attribute    ${input_field}    value
    ${value_length}=    Get Length    ${current_value}
    # sometimes text cursor starts from the middle, so delete front and back characters
    Repeat Keyword    ${value_length}    Press Keys    ${input_field}   BACKSPACE
    Repeat Keyword    1   Press Keys    ${input_field}   DELETE