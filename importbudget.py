import tkinter
import tkinter.filedialog as filedialog
import pathlib

# ask for a YNAB directory
root = tkinter.Tk()
root.withdraw() # we don't want a full GUI, so keep the root window from appearing
filename = filedialog.askopenfilename(title="Select your YNAB budget file") # show an "Open" dialog box and return the selected file
print(filename)

# scan for the most recently updated database file
# 4EA113CF-1B4A-F806-840F-AB1A1010A7A3 desktop copy 21 Nov

# does the selected file contain a data* folder?
# does the data* folder contain a devices folder?
# scan through the files in the devices folder to find the most recently updated device and gather it's guid
# 

# build DB (if not exists)

# import data to DB