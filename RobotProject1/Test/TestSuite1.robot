*** Settings ***
Library    SeleniumLibrary  

Suite Setup    Log    I am inside Test Suite Setup   
Suite Teardown    Log    I am inside Test Suite Teardown   
Test Setup    Log    I am inside Test Setup 
Test Teardown    Log    I am inside Test Teardown    

Default Tags    sanity          

*** Test Cases ***
MyFirstTest
    [Tags]   smoke 
     Log    Hello World...   
     
MySecondTest
     Log    I'm inside second test  
     Set Tags       regression1  
     Remove Tags    regression1

MyThirdTest
     Log    I'm inside third test  
    
FirstSeleniumTest
    Open Browser    https://google.com    chrome
    Set Browser Implicit Wait    5
    Input Text       name=q    Automation step by step
    Press Keys    name=q    ENTER
    Click Button    name=btnK    
    Sleep    2        
    Close Browser
    Log    Test Completed    
    
SampleLoginTest
    [Documentation]    This is a sample logging test
    Open Browser    ${URL}    chrome
    Set Selenium Implicit Wait    3 
    LoginKW
    Click Element    link=Directory
    Click Element    link=Dashboard       
    Click Element    id=welcome
    Sleep    2          
    Click Element    link=Logout
    Close Browser     
    Log        Test completed 
    Log        This test was executed by %{username} on %{os}
    

*** Variables ***
 ${URL}    https://opensource-demo.orangehrmlive.com/  #SCALAR
 @{CREDENTIALS}      Admin    admin123     #List
&{LOGINDATA}     username=Admin    password=admin123   #Dictionary

#Types of variables: 
# SCALAR, LIST, DICTIONARY, ENVIRONMENT & BUILT-IN
    
*** Keywords ***
LoginKW             
    Input Text    id=txtUsername  @{CREDENTIALS}[0]  
    Input Password    id=txtPassword  &{LOGINDATA}[password]
    Click Button    id=btnLogin
            
    