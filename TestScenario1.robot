*** Settings ***
Library     SeleniumLibrary
Resource        login2.robot
*** Variables ***

${create}       //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]
${specialchar}      hello+!@%^&
${withunderscore}       testing_Underscore
${testingSpace}     testing Space
${testingValid}     Space Underscore_token
${1char}        a
${2char}        ab
${32char}       asdfghjklpoiuytrewsdfghjklpoinmw
${33char}       asdfghjklpoiuytrewsdfghjklpoinmwq

${inputtoken}       //*[@class="dc-input__field"]

${tokencopied}      //*[text()="Token copied!"]
${copyicon}     //*[@class="dc-icon dc-clipboard da-api-token__clipboard"]
${deleteicon}       //*[@class="dc-btn dc-btn--secondary dc-btn__small"]

${noIcon}       //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr[1]/td[5]/div/button[1]
${yesIcon}      //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr[1]/td[5]/div/button[2]

*** Test Cases ***
Test Scenario 1
        ApiPage       ${my_email}     ${my_pw}
        click element       //*[text()="Read"]
        sleep       2
        checkbox should be selected         //*[@class="dc-checkbox__input" and @name="read"]
        click element       //*[text()="Trade"]
        sleep   2
        checkbox should be selected         //*[@class="dc-checkbox__input" and @name="trade"]
        click element       //*[text()="Payments"]
        sleep   2
        checkbox should be selected         //*[@class="dc-checkbox__input" and @name="payments"]
        click element       //*[text()="Admin"]
        sleep   2
        checkbox should be selected         //*[@class="dc-checkbox__input" and @name="admin"]
        click element       //*[text()="Trading information"]
        sleep   2
        checkbox should be selected         //*[@class="dc-checkbox__input" and @name="trading_information"]


Test token name
        click element       ${inputtoken}
        element should be disabled      ${create}

        input text      ${inputtoken}       ${specialchar}
        element should be disabled      ${create}
        clear input     ${inputtoken}

        input text      ${inputtoken}       ${1char}
        element should be disabled      ${create}
        clear input     ${inputtoken}

        input text      ${inputtoken}       ${33char}
        element should be disabled      ${create}
        clear input     ${inputtoken}

        input text      ${inputtoken}       ${withunderscore}
        element should be enabled       ${create}
        clear input     ${inputtoken}

        input text      ${inputtoken}       ${testingSpace}
        element should be enabled       ${create}
        clear input     ${inputtoken}

        input text      ${inputtoken}      ${2char}
        element should be enabled       ${create}
        clear input     ${inputtoken}

        input text      ${inputtoken}       ${32char}
        element should be enabled       ${create}
        clear input     ${inputtoken}

Creating token

#testing is all scopes are checked
        input text      ${inputtoken}    Token 1
        click element     ${create}
        sleep   3

#testing if 1 box are checked
        click element       //*[text()="Read"]
        input text      ${inputtoken}    Token 2
        click element     ${create}
        sleep   3

        #testing if more than 2 scope are checked
        click element       //*[text()="Trade"]
        click element       //*[text()="Read"]
        input text      ${inputtoken}    Token 3
        click element     ${create}
        sleep   3

        #testing if 3 box are checked
        click element       //*[text()="Payments"]
        click element       //*[text()="Trade"]
        click element       //*[text()="Read"]
        input text      ${inputtoken}    Token 4
        click element     ${create}
        sleep   3

        #testing if 4 box are checked
        click element       //*[text()="Admin"]
        click element       //*[text()="Payments"]
        click element       //*[text()="Trade"]
        click element       //*[text()="Read"]
        input text      ${inputtoken}    Token 5
        click element     ${create}
        sleep   3

        #testing if 0 box are checked
        input text      ${inputtoken}    Token 6
        element should be disabled      ${create}

Delete token and copy token

        wait until page contains element       ${copyicon}
        click element       ${copyicon}
        wait until element is visible      ${tokencopied}
        element should be visible       ${tokencopied}

        wait until page contains element        ${deleteicon}
        click element       ${deleteicon}
        wait until page contains element        ${noIcon}
        click element       ${noIcon}

        wait until page contains element        ${deleteicon}
        click element       ${deleteicon}
        wait until page contains element        ${yesIcon}
        click element       ${yesIcon}

Close Settings

        click element       //*[@class="dc-page-overlay__header-close"]






*** Keywords ***
