*** Settings ***
Documentation    Suite description
Library      SeleniumLibrary

*** Keywords ***
Task2

    reload page
    wait until page does not contain element        //*[@class="chart-container__loader"]     30
    click element   //*[@class="cq-symbol-select-btn"]
    click element   //*[text()="Synthetic Indices"]


     click element      //*[text()="Volatility 10 (1s) Index"]
     wait until page does not contain element        //*[@class="trade-container__fieldset-wrapper trade-container__fieldset-wrapper--disabled"]        30
     wait until page does not contain element       //*[@aria-label="Loading interface..."]     30
     wait until page contains element       //*[@id="dt_purchase_call_button"]      30
     sleep   3
     click element      //*[@id="dt_purchase_call_button"]






