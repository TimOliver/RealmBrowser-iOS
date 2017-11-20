## Realm Browser for iOS
> An on-device debugging framework for introspecting local Realm files.

<img src="https://raw.githubusercontent.com/TimOliver/RealmBrowser-iOS/master/screenshot.jpg" />

**This library is still a heavy WIP with several relatively crucial features still missing. In any case, it's finished to the point where it's presentable, so I figured I'd stop hoarding it to myself. Enjoy!**

The Realm Browser for iOS is an unofficial debugging framework for apps that implement [Realm](http://realm.io). It uses the Objective-C dynamic runtime to monitor an app's interaction with Realm, and then allows developers to present a UI dialog displaying the contents of any Realm files in the app.

When developing an app using Realm, sometimes it is very important to be able to inspect the contents of the Realm file to make sure the right data is getting saved. While this is easy on the Simulator, it's a lot harder on an actual device to get at the Realm file. The goal here is that the Realm Browser can be embedded in debug builds of apps, and able to be used to inspect the contents of Realm files at any given moment, even when away from a Mac.

## Disclaimer
This is not an official project of Realm. It was one I did in my free time as a development tool for one of my apps. Please ensure to file issues and bug reports here, and not on the main Realm repo.

## License
Realm Browser for iOS is licensed under the MIT license. Please see the [LICENSE](License) file for more information.

## Credits

Realm Browser for iOS was designed and developed by [Tim Oliver](http://timoliver.blog).

iPad Pro mockup by [Pixeden](http://pixeden.com).

