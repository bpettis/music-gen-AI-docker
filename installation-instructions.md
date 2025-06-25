**Part One: Setup**

1. Check if you have python installed on your system. Open Terminal (/Applications/Utilities/Terminal) and run this command: `which python`
2. If you get output like `/usr/bin/python3` or `/opt/homebrew/bin/python3` move ahead to the next step
3. Trigger macOS to install some other necessary components (Command Line Developer Tools) by running this command in the Terminal: `python3 --version`
4. In the dialog box that pops up, choose to install the developer tools
5. Quit and restart the Terminal once the installation completes

**Part Two: Get the Code**

Next, we’ll clone a local copy of the code repository:

1. Head to the GitHub repository, and copy the clone URL. Click on the green “Code” button and click the copy icon next to the HTTPS URL: .

2. Open Terminal (if it’s not already running)
3. Run the command: `git clone https://github.com/akstuhl/music-gen-AI.git`
    (After typing 'git clone ' you can paste the URL you copied directly into the Terminal)
4. This will copy a local version of the code to your computer in a new folder with the name of the repository (music-gen-AI). Enter this directory by running this command: `cd music-gen-AI`

**Part Three: Install Python Packages**

Next we’ll install the necessary libraries and dependencies for the code to work.

1. Run: `pip3 install -r requirements.txt`  
    This will read the requirements.txt file and install the listed packages
2. Run: `pip3 install setuptools`  
    This package (sometimes) needs to be installed and set up after all of the others
3. Run: `pip3 install --upgrade --force-reinstall chromedriver-binary-auto`  
    I needed to reinstall this package after everything else in order to get things to work

**Part Four: Set Up Accounts Document and Settings**

1. Create a new document in the music-gen-AI folder to store the account information by running this command: `touch accounts.txt`  
    <br/>
2. Open that document in TextEdit by running this command: `open -e accounts.txt`  

3. In that document, enter the email address and password combinations for the accounts that you want to use on the various websites. Each account should be on its own line, with the email address first, then a comma, and finally the password. As an example, the document might look like:
```
    <example@example.com>,password123  
    <example2@example.com>,password123  
    <example3@example.com>,password123
```

Save the file and close it once you’re done editing it.  

4. Create a new document in the music-gen-AI folder to store some settings (which we may need to edit later). Run this command: `touch .env`  
    <br/>Note that the filename starts with a period. This means that it will be invisible if you look at the folder in Finder. But don’t worry, it’s there!  

5. Open that document in TextEdit by running: `open -e .env`  
    <br/>This document is where we’ll set things like the Chrome version and the number of browser copies that we want to run at a time. As you’ll see in some of Andy’s notes, some of the scripts don’t play nicely if you open a _ton_ of browsers at once. To start out, copy/paste this into the document:  

```
CHROME_VERSION=137  
MAX_DRIVERS=3  
BASE_OUTPUT_DIRCTORY=~/Downloads/  
```

Save and close the file once you’re done editing it.  

**Part Five: Run the Music Generators**

Okay, we’re finally ready to run things! You can skip to this section in the future - no need to re-install stuff every time.

Whenever you are ready to experiment with the generator workflows, you’ll follow this general workflow:

1. Open Terminal
2. Enter the music-gen-AI folder by running: `cd music-gen-AI`
3. Run the command: `python3 name-of-script-file.py`  
    <br/>Be sure to swap in whichever script you want to use, for example:  
    `python3 stableAudioWorkflow.py`  
    `python3 sunoWorkflow.py`  
    `python3 beatovenWorkflow.py`  
    <br/>and so on…  

4. In general, once each script starts, it will begin by launching a bunch of copies of the Chrome browser.  
    <br/>macOS _might_ ask for you to give permission for Terminal and/or python to control other applications. You’ll need to allow this for things to work.  

5. Once the browsers have opened, head back to the Terminal, where you should see a prompt asking if you’re ready to login. Hit ‘y’ and enter, then sit back and wait a while. Hopefully, you’ll eventually see something like “You are now logged in”
6. _If_ the scripts were able to log in okay, you’ll eventually be taken to some next prompts, asking if you want to use a batch of prompts, or the option to generate additional songs (if you say no to the batch options).  
    <br/>

**Part Six: Troubleshooting**

There are a lot of imperfections, and some things will go wrong. Here are some common problems that I ran into:

**Chrome Version Mismatch**

Your version of Google Chrome must match what the scripts are expecting. You might see something like this in your terminal output:

```
selenium.common.exceptions.SessionNotCreatedException: Message: session not created: cannot connect to chrome at 127.0.0.1:56044 from session not created: This version of ChromeDriver only supports Chrome version 138

Current browser version is 137.0.7151.122
```

Note the current browser version is listed as 137, and the ChromeDriver wants version 138

To fix this, Open Google Chrome (separately) and update (“Chrome” -> “About Google Chrome”). You will probably need to quit and restart all Chrome windows before continuing.  
If you still have a mismatch, the script you’re running might be specifying an exact version in its code. Open the ‘.env’ file we set up earlier (by running: open -e .env) and change the number after ‘CHROME_VERSION’ – for example, based on the above error code, I changed my .env file to look like this:  

```
CHROME_VERSION=138
MAX_DRIVERS=1
BASE_OUTPUT_DIRECTORY=~/Downloads/
```

**Script Hangs Forever**

This can happen. Often it’s because it wasn’t able to “find” the button/link that it was trying to click. If things have truly stalled, you can force the process to end by heading back to the terminal and pressing `CTRL + C`  
<br/>Please note that this will immediately close the additional browsers that you have open, and you may lose any progress.