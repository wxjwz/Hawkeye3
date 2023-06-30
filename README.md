[//]: # (# - language)
[![](https://img.shields.io/badge/english-000080?style=for-the-badge)](https://github.com/zrfisaac/DBMS-Easy/blob/main/README.en-US.md)
[![](https://img.shields.io/badge/português-008000?style=for-the-badge)](https://github.com/zrfisaac/DBMS-Easy/blob/main/README.pt-BR.md)


<h1 align="center">
<img src="https://github.com/zrfisaac/Hawkeye3/blob/master/art/Laure/hawkeye.jpg" width="80">
<p>Hawkeye 3</p>
</h1>

<p align="center">
	<a href="https://github.com/zrfisaac/Hawkeye3/releases/download/v3.0.0/Hawkeye.3.0.0.Install.exe">
		<img src="https://img.shields.io/badge/version-3.0.0-blue?style=flat-square" alt="Discord">
	</a>
	<a href="https://www.patreon.com/zrfisaac">
		<img src="https://img.shields.io/badge/$-donate-ff69b4.svg?&maxAge=2592000&amp;style=flat-square">
	</a>
</p>

<p align="center">
  <a href="#about">About</a> •
  <a href="#features">Features</a> •
  <a href="#building">Building</a> •
  <a href="#credits">Credits</a> •
  <a href="#license">License</a>
</p>

<p align="center">
<img src="https://user-images.githubusercontent.com/16006294/218315541-137cfe51-d15f-42bf-b3be-3d064acd6191.png">
</p>

## About

Debugging a managed Windows application is, most of the time, not an easy task. Thus, any tool that can help will make your life easier.

Hawkeye is the only .Net tool that allows you to view, edit, analyze and invoke (almost) any object from a .Net application. Whenever you try to debug, test, change or understand an application, Hawkeye can help.

With a unique option to attach to any running .Net process, Hawkeye offers an impressive set of functionalities seen in no other product.

## Features

* Attach to any .Net Process.
  * Hawkeye can be injected in any .NET process allowing you to easily hook and modify other processes.
  * You can even hook into Visual Studio and modify some of its (.NET) properties (E.g.: the Properties Editor from VS).
  * Since version 1.1.9, Hawkeye has support for 64bit so you can now attach Hawkeye to any x86 or x64 process.
* A properties editor like the one in Visual Studio that can be used to inspect or modify the properties of any object or control at runtime.
* Shows you **all the properties that are defined on an object** (even if they are not normally visible in the designer).
* Shows you **all the fields of an object** organized by the class in the hierarchy that owns that property.
* Shows all **the methods of an object** organized by the class and visibility of the method.
  * Provides a simple way to invoke methods on objects and pass arguments on any method (public, private ...).
* Shows you **all the events defined on an object** and **all the event listeners** registered to listen to a specific event (e.g.: Form_Load).
  * You can even Invoke an event listener.
* Shows process information including static information about `Application`, `CurrentContext`, `CurrentThread`, `CurrentPrincipal`, `CurrentProcess`, and garbage collection.
* Supports back/forward navigation between the last edited objects, and supports navigation to child items in collections, enumerations or arrays (E.g.: the `Controls` collection of a `Control`).
* Changes that you do to the code can be logged as C# code that can be just Copy&Pasted back into code.
* How about "Show Source Code"?
  * You just started in a new project and you don't know where to start? Select your element, open Red Gate's .NET Reflector (formerly Lutz Roeder's .NET Reflector) and select Show source code. Hawkeye will immediately ask Reflector to show you the source code of the selected element being it a field, property, event, method or class.

## Building

In order to build a version of Hawkeye that can target both .NET 2 and .NET 4 Windows Forms applications, one should use Visual Studio 2010. Indeed, it is the only version that compile C++/CLI targeting both .NET 2 and .NET 4 CLR. Any older version won't be able to target .NET 4 and any more recent version will not target .NET 2. That said, if only the .NET 4 target is required, using a more recent version of Visual Studio is just fine.

C++/CLI projects referenced in a C# project are not as well integrated as C# projects. This explains why when opening the solution or even after having built once, transitory errors can appear complaining for unknown namespaces in the bootstrapper C# projects. These errors should go away by themselves once Visual Studio finds the compiled binaries of the C++/CLI injector projects.

## Credits

* Hawkeye was originally created by Corneliu I. Tusnea (his blog: <http://www.acorns.com.au>) from Readify (<http://www.readify.net>)
* It was maintained and supported by Olivier Dalet (<http://odalet.wordpress.com>)
* It is now maintained and supported by Isaac Santana (<https://github.com/zrfisaac>)

## License

* License: [Ms-RL][msrl]
* History page: [Here][history]
* Credits page: [Here][credits]

  [msrl]: src/License.md "MS-RL License"
  [history]: src/History.md "History"
  [credits]: src/Credits.md "Credits"
