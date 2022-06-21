*** Settings ***
Documentation       Locators

*** Variables ***
${SearchTextBox}        xpath=//div//input[@type='text']
# ${Selection_Option}     xpath=//div[contains(@class,'Result')]//div[text()=''+${City}]
${Selection_Option}     xpath=//div[contains(@class,'container--first')]/ul/li/div/div/div
${Condos.caDisplay}     xpath=//body