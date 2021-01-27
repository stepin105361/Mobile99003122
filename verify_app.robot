*** Settings ***
Library    AppiumLibrary    
Library    Process    


*** Test Cases ***

TC1_VerifyApp
    Open Application    http://localhost:4723/wd/hub
    ...    platformName=android
    ...    deviceName=asus
    ...    appPackage=com.bottleworks.dailymoney
    ...    appActivity=com.colaorange.dailymoney.ui.DesktopActivity
    ...    noReset=True
    
    Set Appium Timeout    40s
    
    Click Element    //*[@text='Add Detail']
    
    Click Element    //*[@text='Asset-Ashtro']
    Wait Until Page Contains Element    //*[@text='Income - Salary']    
    Click Element    //*[@text='Income - Salary']
    
    Click Element    //*[@text='Expense-Entertainment']
    Wait Until Page Contains Element    //*[@text='Personal']    
    Click Element    //*[@text='Personal']

    Click Element    xpath=//*[@resource-id='com.bottleworks.dailymoney:id/deteditor_prev']
    Click Element    xpath=//*[@resource-id='com.bottleworks.dailymoney:id/deteditor_prev']
    
    Input Text    xpath=//*[@resource-id='com.bottleworks.dailymoney:id/deteditor_money']    102000
    Input Text    xpath=//*[@resource-id='com.bottleworks.dailymoney:id/deteditor_note']    Expense of 25th Jan
    
    Click Element    //*[@text='CREATE']
    Click Element    //*[@text='CLOSE']
            
    
    Wait Until Page Contains Element    //*[@text='Weekly list']    
    Click Element    //*[@text='Weekly list']
    Go Back
    
    Wait Until Page Contains Element    //*[@text='Accounts']    
    Click Element    //*[@text='Accounts']
    
    Click Element    //*[@content-desc='More options']
    Wait Until Page Contains Element    //*[@text='New']
    Click Element    //*[@text='New']    
    
    Input Text    xpath=//*[@resource-id='com.bottleworks.dailymoney:id/acceditor_name']    Ashtro4
    Click Element    //*[@text='Income']
    Wait Until Page Contains Element    //*[@text='Asset']
    Click Element    //*[@text='Asset']

    Input Text    //*[@text='0']    500000
    Click Element    xpath=//*[@resource-id='com.bottleworks.dailymoney:id/acceditor_cash_account']
    
    Click Element    //*[@text='CREATE']
    Click Element    //*[@text='CLOSE']
    Go Back
    
    ${monthly_total}    Get Text    xpath=//*[@resource-id='com.bottleworks.dailymoney:id/dt_info_monthly_expense']
    Log To Console    ${monthly_total} 
    
    ${remain_total}    Get Text    xpath=//*[@resource-id='com.bottleworks.dailymoney:id/dt_info_cumulative_cash']
    Log To Console    ${remain_total}       