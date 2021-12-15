*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Keywords ***
Clear Input
    [Arguments]    ${input_field}
    Wait Until Page Contains Element    ${input_field}    5
    ${current_value}=    Get Element Attribute    ${input_field}    value
    ${value_length}=    Get Length    ${current_value}
    # sometimes text cursor starts from the middle, so delete front and back characters
    Repeat Keyword    ${value_length}    Press Keys    ${input_field}   BACKSPACE
    Repeat Keyword    1   Press Keys    ${input_field}   DELETE

Task3
        [arguments]     ${payout}    ${duration}
        wait until page does not contain element        //*[@class="chart-container__loader"]     30
        click element   //*[@class="cq-symbol-select-btn"]
        click element   //*[text()="Forex"]
        click element      //*[text()="AUD/USD"]
        wait until page does not contain element        //*[@class="trade-container__fieldset-wrapper trade-container__fieldset-wrapper--disabled"]        30
        wait until page does not contain element       //*[@aria-label="Loading interface..."]
        click element       //*[@id="dt_contract_dropdown"]
        click element       //*[@id="dt_contract_high_low_item"]
        clear element text  //*[@class="dc-input__field"]

        sleep   10
        input text      //*[@class="dc-input__field"]        ${duration}

        sleep       3
        Clear Input     //*[@id="dt_amount_input"]
#        clear element text  //*[@class="dc-input-wrapper__input input--has-inline-prefix input trade-container__input"]


        input text      //*[@id="dt_amount_input"]    ${payout}

        wait until page contains element        //*[@id="dc_payout_toggle_item"]
        click element       //*[@id="dc_payout_toggle_item"]

        wait until element is enabled       //*[@id="dt_purchase_put_button"]      5
        click element       //*[@id="dt_purchase_put_button"]
        sleep       8

