
  

<div  id="top"></div>

![Generic badge](https://img.shields.io/badge/Status-Development-orange.svg) [![style: lint](https://img.shields.io/badge/style-lint-4BC0F5.svg)](https://pub.dev/packages/lint) [![wakatime](https://wakatime.com/badge/user/9d195fb9-343f-40d6-9803-21db49aef0ba/project/4b9e673c-08ac-445e-9cc1-a4f5650616a6.svg)](https://wakatime.com/badge/user/9d195fb9-343f-40d6-9803-21db49aef0ba/project/4b9e673c-08ac-445e-9cc1-a4f5650616a6)

<br  />
<div  align="center">
	<h3  align="center">Man</h3>
	<p  align="center">
		A simple, easy to use state management and navigation package.
	</p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
	<summary>Table of Contents</summary>
	<ol>
		<li><a  href="#roadmap">Roadmap</a></li>
		<li><a  href="#about-the-project">About The Project</a></li>
		<li><a  href="#getting-started">Getting Started</a></li>
		<li><a  href="#usage">Usage</a></li>
		<ul>
			<li><a  href="#state-management">State Management</a></li>
			<li><a  href="#navigation">Navigation</a></li>
	    </ul>
		<li><a  href="#contributing">Contributing</a></li>
		<li><a  href="#license">License</a></li>
		<li><a  href="#contact">Contact</a></li>
	</ol>
</details>

## Roadmap

- [x] Basic state management
- [x] List - Map - Set implementation on [Managed](https://github.com/ertgrulll/man/blob/master/lib/src/state_manager/managed/managed_imp.dart)
- [x] Navigation using Navigator Key
- [x] Enter page transitions (Created 20 transition)
- [x] Named routes
- [ ] Route transitions to animating both enter and exit pages
- [ ] Transition gifs
- [ ] Code samples for readme
- [ ] Example project
- [ ] Documantation
- [ ] Multi-language docs
	- [ ] Türkçe
	- [ ] English

<p  align="right">(<a  href="#top">back to top</a>)</p>  

## About The Project

Reactive state management and navigation library. Easy to use, not requires fancy things. Not dependent any other package. 'Man' name comes from 'manager'.

<p  align="right">(<a  href="#top">back to top</a>)</p>

## Getting Started
Add dependency to your pubspec.yaml
```yaml
man:
  path: path/to/man/folder
```

### Prerequisites
Import man:
```dart
import 'package:man/man.dart';
```

<p  align="right">(<a  href="#top">back to top</a>)</p>  

## Usage
> _If you are planning to use state management only, nothing extra requires. Skip the step below, you are good to go._

___Man___ uses navigation key to navigate between pages, assign ___Man___ key to MaterialApp's navigatorKey like below.

```dart
  MaterialApp(
    navigatorKey: Man.navigator.key,
  );
```

### State Management
___Man___ updates your UI's related section only, this why it's performant. Declare a managed variable and wrap the widget that you want to update with `Man`.

```dart
var myVariable = 'Maan this is awesome'.man;

// Anywhere in your code update variable, also related widget will update.
myVariable.value = 'Maaaann this is really awsome';

@override
  Widget  build(BuildContext  context) {
    return  Man(
	    builder: () => Text(myVariable),
 	);
}
...
```
Easy right? 

>Boring tech: Man uses custom-implemented callbacks to update the widget tree. Basically it works like ValueNotifier and ValueListenableBuilder in the broader scope. Also `Man` takes an optional bindings parameter as a `List`, this ensures the relevant `Man` is updated only when the binding variable changes.

See [state management section of the example project](https://github.com/ertgrulll/man/blob/master/example/lib/state_management.dart) to complete usage.

### Navigation
___Man___ __has 20 different__ navigation transition. Transitions can be found at [Transition Definitions](https://github.com/ertgrulll/man/blob/master/lib/src/navigation/transition_definitions.dart) page.

 Navigation methods accepts a widget and optional transition parameter to creating transition between pages. Method names same as Flutter's names, except of `Man.pushAndRemoveAll` and `Man.pushNamedAndRemoveAll`.  

For example, this is equal with Flutter's push method:
```dart
  Man.push(Home());	
```

Navigation applying a transition:
```dart
  Man.push(Home(), transition: ManTransitions.circularFromCenter);
```

See [navigation section of the example project](https://github.com/ertgrulll/man/blob/master/example/lib/navigation.dart) to complete usage.


#### Named Routes
> _If you don't plan to use named routes skip this step, you are good to go._

In man, route params starts with a colon(:). Create your routes and assign them to `Man.navigator.routes` and assign ___Man___ handler to MaterialApp's onGenerateRoute.
___Man___ handles your routes using this handler, applies route animations in this way.

```dart
class  App  extends  StatelessWidget {
  App({Key? key}) : super(key: key) {
    // Assign your routes to man routes
	Man.navigator.routes = ManRoutes(
	  {
	    'app': (p) =>. MyApp(),
        'home': (p) =>  Home(),
	    'user/:id': (p) => User(id: p[0]),
        'user/:id/profile': (p) => User(id: s[0]),
  	    'user/:id/posts/:postId': (p) => Post(userId: p[0], postId: p[1]),
  	    'unknown': (p) => Unknown(),
      },
      initialRoute: 'app',
      unknown: 'unknown',
   );
}

  @override
  Widget  build(BuildContext  context) {
    return  MaterialApp(
      initialRoute: 'app',
      navigatorKey: Man.navigator.key,
      // Assign man handler to MaterialApp's onRouteGenerate
      onGenerateRoute: Man.navigator.routeHandler,
    );
  }
}
```

<p  align="right">(<a  href="#top">back to top</a>)</p>
  

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".

Don't forget to give the project a star! Thanks again!  

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p  align="right">(<a  href="#top">back to top</a>)</p>

## License

Distributed under the GPLv3 License throughout the development process. See `LICENSE` for more information.

<p  align="right">(<a  href="#top">back to top</a>)</p>

## Contact

Ertuğrul Yakın - ertgrulll@outlook.com
Project Link: [https://github.com/ertgrulll/man](https://github.com/ertgrulll/man)

<p  align="right">(<a  href="#top">back to top</a>)</p>