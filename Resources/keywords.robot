*** Keywords ***
Begin Web Test
    Open Browser  about:blank  ${BROWSER}
    Go To Web Page
    Maximize Browser Window
Go To Web Page
    Load Page
    Verify Page Loaded
Load Page
    Go To  ${URL}
Verify Page Loaded
    Wait Until Page Contains  When do you want to make your trip?
Go To Create User
    Click Button  //*[@id="createUser"]
    Verify Create User Loaded
Verify Create User Loaded
    Wait Until Page Contains  Create a new user
Sign Into User Account
    Enter Account Information
    Click Button  //*[@id="login"]
    Wait Until Page Contains  Logout
Enter Account Information
    Input Text  //*[@id="email"]  ${MAIL}
    Input Password  //*[@id="password"]  ${PASSWORD}
Go To Car Rental Page
    Click Button  //*[@id="continue"]
    Wait Until Page Contains  What would you like to drive?
User Books A Car
    Scroll Element Into View  //*[@id="carTable"]/tbody/tr[16]/td[1]
    Wait Until Page Contains  Model S
    Click Button  //*[@id="bookModelSpass5"]
    Wait Until Page Contains  Confirm booking of Tesla Model S
Select Car Not Signed In
    Click Button  //*[@id="bookQ7pass5"]
Verify Alert Box Appears
    Alert Should Be Present
Confirm Booking Car
    Enter Payment Information
Enter Payment Information
    Input Text  //*[@id="cardNum"]  1234123412341234
    Input Text  //*[@id="fullName"]  Hiroshi Teshigahara
    Input Text  //*[@id="cvc"]  000
    Select From List By Index  //*[@id="confirmSelection"]/form/select[1]  6
    Select From List By Index  //*[@id="confirmSelection"]/form/select[2]  6
    Press Confirm To Book Car
Press Confirm To Book Car
    Click Button  //*[@id="confirm"]
    Wait Until Page Contains  A Tesla Model S is now ready for pickup
User Gets Confirmation The Car Is Booked
    Wait Until Page Contains  A Tesla Model S is now ready for pickup
    Wait Until Page Contains  You can view your booking on your page
Cancel Creating User
    Click Button  //*[@id="cancel"]
    Verify Cancel Creating User Loaded
Verify Cancel Creating User Loaded
    Wait Until Page Contains  When do you want to make your trip?
User Is At Date Selection
    Click Element  //*[@id="title"]
    Wait Until Page Contains  When do you want to make your trip?
End Web Test
    Close Browser



