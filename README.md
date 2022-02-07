# OC-P12-AG

This project use the following technologies:
- Python
- Django
- Django Rest Framework
- Virtual environment

This readme focus on how to set up your computer, launch the local server and use the different API's features with the following steps:
-download elements on your computer
-set your computer on the right configuration
-launch your local server
-use endpoints on Postman

### This program respect PEP8 writing conventions

Be careful: - In your powershell windows, using your right click will automatically paste
	    - In your terminal application for mac or linux use the right click and paste

## PYTHON INSTALLATION:
To run this code you need Python 3.8 version or further 
Download python's executable file on the following website: https://www.python.org/downloads/
Lauch the installation without any modification.

## POSTGRESQL INSTALLATION:
To run this code you need PostgreSQL 14 version 
Download PostgreSQL executable file on the following website: https://www.postgresql.org/download/
Choose your system to download the related version
Lauch the installation without any modification.

## CREATION OF THE WORKING REPOSITORY:
To run this code and find the informations you seek for, you need to create a working folder.
With your explorer go at the place you choose to work, create a new working folder. 

## SET YOUR SYSTEM TO THE RIGHT PLACE (your working folder pathway):
You now need to open your terminal:
- windows: use Windows Powershell(admin). to find it use windows + x as keyboard shortcut 
- mac: use terminal. to find it open your Utilities folder in applications
- linux: use terminal. to find it type terminal in your applications's research bar

In the new window, you have to put your working folder's path
For that go back to your windows explorer, go in your working folder.
now you're in, copy the pathway of your folder found in the adress bar (C:\Users\...\.... for windows)

In the terminal type ```cd ..``` several time. you need to be at the root of your computer (C: for Windows, /Home on Mac)
Next type ```cd 'yourfolderpathwaythatyoujustcopied'``` (keep the small quote marksand let a space after cd) and ENTER

## CREATE A SPECIAL WORKING ENVIRONMENT:
With Python, you have to create a special working environment to install specifics modules for each project.
In the terminal using the following command will set a new environment 'env':
```python -m venv env``` and ENTER

You now need to activate it, for that:
-On Windows: ```source env/Scripts/activate``` or ```env/Scripts/activate.ps1``` and ENTER
-On Mac and Linux: ```source env/bin/activate``` and ENTER

if you have any issue to activate your environment:
-go to the env folder and search for the folder name which contain the "activate" file 
-replace "Scripts" by this name

With this step your working environment is now running

## DOWNLOAD REQUESTED FILES AND MODULES:
Go to the following repository: https://github.com/Satupathe/OC-P12-AG
-find the green button
-clic on the arrow
-choose download ZIP
-download the zip file
-extract its content and put it in your working folder with extract here

Now use this command on the terminal:
- ```pip install -r requirements.txt```
This step will install necessary modules to execute the code. 
Let it work because it can take few minutes depending on your internet connection

## INSTALL PGADMIN:
Download PGAdmin executable file on the following website: www.pgadmin.org/download/pgadmin-4-windows
Install and Launch it
in the left column open "LocalPostgres":
Create Group Role:
	- Give it a name in 'General'
	- Give it a password if you need to in 'Definition'
	- Select all in 'Privileges'
Create Database:
	- Give it a name in 'General'
	- Give it a password in 'Connection' if you want
	- Choose your new group role as owner
	- Save it

## LINK YOUR POSTGRESQL SERVER TO YOUR APP/
In CRMproject and internalcrm repository open settings.py
Search for the part "DATABESES"
Change "NAME", "USER" and "PASSWORD" part to be the same as your newly created database in pgadmin
Save this file

##CREATE A SUPERUSER:
In your terminal: "python manage.py createsuperuser"
Complete all asked fields
Even if you type you password it'll not appear on your terminal but it's noraml, still proceed

## LAUNCH THE SERVER:
In your terminal be sure to be in CRMproject repository
Then type "python manage.py runserver" and after a few seconds you'll see the following messages:

System check identified 1 issue (0 silenced).
February 04, 2022 - 15:21:10
Django version 4.0.1, using settings 'internalCrm.settings'
Starting development server at http://127.0.0.1:8000/
Quit the server with CTRL-BREAK.

You have now activated your local server.

## CONNECTION IN YOUR ADMIN ADMINISTRATION:
In your browser go to http://127.0.0.1:8000/admin
And connect with your newly created super user with email and password
Be careful access to admin with superuser can broke your app if missused !!!
Make only the following steps:
- Create authorization groups and add authorization only of the following models: clients, contractsEvents, EmployeeApp
- Create a management employee:
	Give him an email and password click on save
	select "Management, "Management team" and "is_staff and others fields and save
- Log out and login with you newly created management team member

You can now create new employees and and each one with their right can or not create new clients, events...

## POSTMAN ENDPOINTS:
Go to the following url: https://documenter.getpostman.com/view/15685214/UVeFP7VR 
You can now launch Postman and start using endpoints following documentation


Thank you for reading this README and using this API
