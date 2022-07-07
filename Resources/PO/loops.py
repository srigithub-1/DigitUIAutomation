try:
    from robot.libraries.BuiltIn import BuiltIn
    from robot.libraries.BuiltIn import _Misc
    from selenium import webdriver
    from SeleniumLibrary import SeleniumLibrary
    import robot.api.logger as logger
    from robot.api.deco import keyword
    ROBOT = False
except Exception:
    ROBOT = False


num1 = 0

#@keyword("Pass the URL as argument")
# def sample_func(num1, num2):
#     if num1 > num2:
#         return num1 + num2
#     elif num1 < num2:
#         return num2 - num1
#     elif num1 == num2:
#         return num1 * num2
#     else:
#         return 0

# from selenium import webdriver
# driver = webdriver.Chrome(executable_path='E:/Srinath/Canada/Selenium/Softwares/chromedriver_win32/chromedriver.exe')
#
# create new class that inherits from Selenium2Library
#class loops(SeleniumLibrary):

# create a new keyword called "get webdriver instance"
@keyword("Pass the URL as argument")
def get_webdriver_instance():
    selib = BuiltIn().get_library_instance('SeleniumLibrary')
    return selib.driver

@keyword("Addition Function")
def additionresult():
    num2 = num1+20
    return num2







# def open_page(link):
#     options = webdriver.ChromeOptions()
#     options.binary_location = "C:/Program Files/Google/Chrome/Application/chrome.exe"
#     chrome_driver_binary = "E:/Srinath/Canada/Selenium/Softwares/chromedriver_win32/chromedriver.exe"
#     driver = webdriver.Chrome(chrome_driver_binary, chrome_options=options)
#
#     driver.get('https://property.ca/toronto/homes-for-sale')
#     return driver.current_window_handle.tit

# mynum= [1,2,3,4,5]

# #for loop8
#s = sample_func(40, 60)

# def __init__(self,num1,num2):
#     self.arg1=num1
#     self.arg2=num2

# Casting
# x = int(4)      #4
# y = str(10)     #'10'

# Strings
# x = "Hello World"
# y = "    My name is Srinath    "
# z = "Welcome to Canada"
# print(x[1])     #prints the 1st character
# print(x[6:11])  #prints from 6th to 11th character
# print(len(x))     #prints length of the string i.e.11
# print(x.lower())    #prints string in lower case
# print(x.upper())    #prints string in upper case
# print(y.strip())    #Strips blanks spaces in the string
# print(y.replace("n","N"))   #Replace characters in the string
# print(z.split(" "))        #Split the string