*** Settings ***
Library  SeleniumLibrary  screenshot_root_directory=\screenshot


*** Keywords ***

User is in Onet Poczta site and is not logged in
    Open browser    ${LOGIN URL}   ${BROWSER}
    Title Should Be    Onet Poczta – najlepsza skrzynka pocztowa
User clicks the Rodo button
    wait until element is visible  css=button.cmp-button_button.cmp-intro_acceptAll
    Click Element  css=button.cmp-button_button.cmp-intro_acceptAll
User inputs the username
    Input Text	id=f_login	validmail@onet.pl
User inputs the password
    Input Text  id=f_password   validpassword
User clicks the login button
    click element  css=input.loginButton
User see the email list
    page should contain element  id=NewMail-button
    Capture Page Screenshot  maillist.png
User input the invalid login
    Input Text	id=f_login  blednylogin@onet.pl
User input the invalid password
    Input Text  id=f_password   blednehaslo1
User see an alert about incorrect attempt to log in
    wait until element is visible   class=messageContent
    get text  class=messageContent
    Should Contain Any	${list}	Niepoprawny e-mail lub hasło.   Wprowadź poprawne dane.
    Capture Page Screenshot  alert.png