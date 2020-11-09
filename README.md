<!--
*** Thanks for checking out this Project. If you have a suggestion that would
*** make this better, please fork the repo and create a pull request or simply open
*** an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
-->





<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]



<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="#" align="center">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">App für betriebsinterne Kommunikation
und Terminvereinbarung (HTW)
(SHS APP)</h3>

  <p align="center">
    An awesome README template to jumpstart your projects!
    <br />
    <a href=""><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="">View Demo</a>
    ·
    <a href="">Report Bug</a>
    ·
    <a href="">Request Feature</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Built With](#built-with)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
* [Usage](#usage)
* [Roadmap](#roadmap)
* [Contributing](#contributing)
* [License](#license)
* [Contact](#contact)
* [Acknowledgements](#acknowledgements)



<!-- ABOUT THE PROJECT -->
## About The Project
The goal of this software development project is to create an application that
Automate, simplify and improve the scheduling, room and non-monetary bookings
accelerate. This should be executable on Android and IOS system and will be supported by
Flutter (frontend) and Back4App (backend) are being developed.







[![Product Name Screen Shot][product-screenshot]](https://example.com)
.

### Built With
Here are our tools:.
* [Flutter](https://flutter.dev/)
* [Back4App](https://www.back4app.com/)
* [qr_flutter](https://pub.dev/packages/qr_flutter)



<!-- GETTING STARTED -->
## Getting Started

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

### Prerequisites

#### Configure the Flutter SDK

1. Download the ([.zip file of the Flutter SDK](https://flutter.dev/docs/get-started/install/windows#get-the-flutter-sdk)).
2. Extract the .zip file in C disk. C:\flutter.
3. Press Windows key and in the search bar type variable.
4. Select Edit the system environment variables.
5. Click on Environment Variables.
6. In System variables select the Path variable and then click on Edit.
7. Click on New and paste the path of bin folder of Flutter:
    C:\flutter\bin
8. Now click on Ok in the 3 windows to save changes.

#### Install Android Studio
1. Download [Android Studio](https://developer.android.com/studio).
2. Run the installer.
3. Click on Next.
4. Mark all the boxes and click on Next 2 more times.
5. Click on Install.
6. When finished, click on Next and then click on Finish.
7. Now select Do not import settings and click on OK.
It will open Android Studio Setup Wizard.
8. Click on Next.
9. Select Custom and again click on Next.
10. Select the theme editor (I recommend Darcula) and click on Next.
11. Now download the Android SDK, to do this check all the check boxes.
12. Click on the button that has 3 points “…”.
The file browser will open.
13. Select the folder of your windows username, inside create a folder called Android and inside this a folder called SDK, and then select the folder SDK and click on OK.
    C:\Users\<YOUR_WINDOWS_USERNAME>\Android\SDK
14. Now click on Next 2 times and then click on Finish.
15. When the download is finished, click on Finish and Android Studio will open.

#### Install the Flutter Plugin on Android Studio
1. In the window Welcome to Android Studio click on Configure and then on Plugins.
2. In the search bar type in flutter and click on Search in repositories.
3. Click on the one that says Flutter, Then click on Install, Accept and Yes.
4. Now click on Restart Android Studio, then on OK, and on Restart.
5. Android Studio will open again.

#### Add the Android SDK to Flutter

1. Again open the Environment variables.
2. And in the System variables click on New.
3. In Variable name type ANDROID_HOME.
4. Click on Browse directory and select the path to download the Android SDK:
    C:\Users\<YOUR_WINDOWS_USERNAME>\Android\SDK
5. Now click on Ok in the 3 windows to save changes.
6. Press the Windows key and in the search bar type cmd and select the Command Prompt.
7. Type the command flutter doctor and press Enter.
8. You will notice that you need to accept Android licenses, so type the following command and press Enter:
    flutter doctor --android-licenses
9. Now you will be asked if you agree each license, in which you must type Y and press Enter for each license.
10. When you have accepted all the licenses you will get All SDK package licenses accepted and close the Command Prompt.

#### Create an Android Emulator on Android Studio
1. In Android Studio, click on Tools > AVD Manager.
2. Now click on Create Virtual Device.
3. Select a Nexus 5 and click on Next.
4. Select the system image that you downloaded with your Android SDK**, i**n my case it was Pie – 28 – x86 – Android 9.0, and then click on Next.
5. Click on Finish.
6. Now click on the button Run ▶ to run the Android Emulator and closes the window.

#### Run Flutter App on an Android Emulator from Android Studio
1. In the toolbar at the side of main.dart click the button Run ▶ to run the app on the emulator. The first time it runs it will take a little bit.
2. It will show the Flutter App on the emulator, which shows how many times you press a button.
3. Now close Android Studio and continue with the next step.

#### Install Visual Studio Code
1. Download [Visual Studio Code](https://code.visualstudio.com/).
2. Install it, the default configuration is more than enough.

#### Install the extension of Flutter on Visual Studio Code
1. Open Visual Studio Code.
2. Click on the Extensions or Ctrl+Shift+X.
3. In the search bar type flutter.
4. Select Flutter by the Author Dart Code.
5. Click on Install.
6. Click on Reload.

#### Run Flutter App on an Android Emulator from Visual Studio Code
1. In VS Code in the Explorer (Ctrl+Shift+E) open with double click the main.dart file that is in the folder lib (lib > main.dart).
2. Now in the toolbar click on View > Debug > Start Debugging or F5.
3. Select the Emulator that we created in Android Studio (In my case it is Nexus_5X_API_28) and press Enter.
4. Finally, the sample App will be executed.


### Installation

1. Get a free API Key at [https://example.com](https://example.com)
2. Clone the repo
```sh
git clone https://github.com/your_username_/Project-Name.git
```
3. Install NPM packages
```sh
npm install
```
4. Enter your API in `config.js`
```JS
const API_KEY = 'ENTER YOUR API';
```



<!-- USAGE EXAMPLES -->
## Usage

Use this space to show useful examples of how a project can be used. Additional screenshots, code examples and demos work well in this space. You may also link to more resources.

_For more examples, please refer to the [Documentation](https://example.com)_



<!-- ROADMAP -->
## Roadmap

See the [open issues](https://gitlab.rz.htw-berlin.de/softwareentwicklungsprojekt/wise2020-21/team3/issues) for a list of proposed features (and known issues).



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

Hadeel Al Tair -
Steve Junior Atabonfack Nkeneng -
Asyncrite Simo Simo - 

Project Link: [https://gitlab.rz.htw-berlin.de/softwareentwicklungsprojekt/wise2020-21/team3.git](https://gitlab.rz.htw-berlin.de/softwareentwicklungsprojekt/wise2020-21/team3.git)








<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=flat-square
[contributors-url]: https://github.com/othneildrew/Best-README-Template/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=flat-square
[forks-url]: https://github.com/othneildrew/Best-README-Template/network/members
[stars-shield]: https://img.shields.io/github/stars/othneildrew/Best-README-Template.svg?style=flat-square
[stars-url]: https://github.com/othneildrew/Best-README-Template/stargazers
[issues-shield]: https://img.shields.io/github/issues/othneildrew/Best-README-Template.svg?style=flat-square
[issues-url]: https://github.com/othneildrew/Best-README-Template/issues
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=flat-square
[license-url]: https://github.com/othneildrew/Best-README-Template/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/othneildrew
[product-screenshot]: images/screenshot.png







