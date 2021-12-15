*** Settings ***
Documentation    Suite description
Library      SeleniumLibrary

*** Variables ***
${url}      https://app.deriv.com
${pwField}  //*[@type="password"]
${LogInButton}  //*[text()="Log in"]
${emailField}   name=email


*** Keywords ***
Login
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
    wait until page contains element    xpath://*[@id="dt_core_account-info_acc-info"]      20

    click element   xpath://*[@id="dt_core_account-info_acc-info"]
    wait until page contains element   //*[text()="Real" and contains(@class,"active")]        10
    click element   dt_core_account-switcher_demo-tab
    click element       //*[@id="dt_VRTC5169182"]


