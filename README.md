# music-gen-AI

`beatovenWorkflow.py`: Code for querying and downloading songs from beatoven.ai
- make sure to put all email accounts and passwords in a local pwordProtect.py file before running. `pwordProtect_template.py` provides a working template of the structure without real emails

`sunoWorkflow.py`: Code for querying and downloading songs from Suno
- store Sterne emails/passwords in a .txt file called accounts.txt, where each line is a email, followed by a comma and then the password (no spaces)
- For now, keep num_drivers<5 to avoid crashing. To use other accounts, just reorder your accounts.txt file
- Be careful for some microsoft login errors (sometimes asks to login via code instead of password - must manually bypass)

`stableAudioWorkflow.py`: Code for querying and downloading songs from Stable Audio

`mubertWorkflow.py`: Code for querying and downloading songs from Mubert
- Need to create more facebook accounts to run multi-account workflows
- Login is (relatively) slow on purpose just to bypass facebook bot detection

## Chrome Versioning

undetected-webdriver gets really particular about what version of Chrome is running. You may get an error like this: 

```
selenium.common.exceptions.SessionNotCreatedException: Message: session not created: cannot connect to chrome at 127.0.0.1:54171
from session not created: This version of ChromeDriver only supports Chrome version 130
Current browser version is 137.0.7151.120
```

You'll need to specify whatever _your_ version of Chrome is (137 in the above example). Set this in a `.env` file in the project root:

```
CHROME_VERSION=137
```

Each script will try to read the `CHROME_VERSION` environment variable to determine what version to try and load.

## Setting the number of drivers

Use `MAX_DRIVERS` environment variable to specify the maximum number of chrome browsers to launch at a time. As noted above, some workflows will only work with a few instances running at once