*** Settings ***
Library     SeleniumLibrary
Resource    common.robot
Resource    task2.robot
Resource    task3.robot
Resource    task4.robot

*** Variables ***
${pay}      15.5
${dur}      2
${barrierValue}     +0.12


*** Test Cases ***
Open Deriv
    Login       ${my_email}     ${my_pw}
    Task2
    Task3       ${pay}       ${dur}
    Task4       ${barrierValue}
#    Close Browser

#*** Settings ***
#Library     SeleniumLibrary
#
#*** Variables ***
#${url1}     http://the-internet.herokuapp.com/login
#${browser}      chrome
#
#*** Test Cases ***
#practiceform
#    launchingbrowser    ${url1}     ${browser}
##    inputingvalues
#
#*** Keywords ***
#launchingbrowser
#    [Arguments]     ${weburl}   ${webbrowser}
#    open browser    ${weburl}   ${webbrowser}
#
#    maximize browser window
#    input text      xpath://*[@id="username"]   Amazon
#    input password      xpath://*[@id="password"]   Vishnu


