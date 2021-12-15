*** Settings ***
Documentation    Suite description
Resource        task3.robot

*** Variables ***
${stake}        //*[@id="dc_stake_toggle_item"]
${barrierInput}     dt_barrier_1_input

*** Keywords ***
Task4
        [arguments]     ${barrierValue}
        wait until page contains element        ${stake}
        click element       ${stake}
        clear input     ${barrierInput}
        input text      ${barrierInput}     ${barrierValue}
        clear input     //*[@id="dt_amount_input"]
        input text      //*[@id="dt_amount_input"]      10

