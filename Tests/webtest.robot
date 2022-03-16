*** Settings ***
Documentation  Testing Infotiv Car Rental Page
Resource  ../Resources/keywords.robot
Library  SeleniumLibrary
Suite Setup  Begin Web Test
Suite Teardown  End Web Test


*** Variables ***
${BROWSER}  chrome
${URL}  http://rental3.infotiv.net/
${MAIL}  hiroshi.teshigahara789@gmail.com
${PASSWORD}  secret

*** Test Cases ***
User Can Cancel Creating a User
    [Documentation]  Testing that user can cancel creating a user.
    [Tags]  G_krav_1
    Go To Create User
    Cancel Creating User
    User Is At Date Selection
User Need To Be Signed In To Book A Car
    [Documentation]  Testing that an alert box will appear if user is not signed in when booking car.
    [Tags]  G_krav_2
    Go To Car Rental Page
    Select Car Not Signed In
    Verify Alert Box Appears
    User Is At Date Selection

User Can Book A Car
    [Documentation]  Testing that a user can book a car.
    [Tags]  VG_test
    Given User Is At Date Selection
    And Sign Into User Account
    And Go To Car Rental Page
    When User Books A Car
    And Enter Payment Information
    Then User Gets Confirmation The Car Is Booked
