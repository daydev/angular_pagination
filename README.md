[![Build Status](https://drone.io/github.com/daydev/angular_pagination/status.png)](https://drone.io/github.com/daydev/angular_pagination/latest)

## Description

Simple utility module for the [angular.dart](https://github.com/angular/angular.dart).
Includes `pagination` angular filter to paginate items of a `List`.
Filter uses `Paginator` object that provides methods to navigate pages and deals with edge cases and illegal states,
so the filter itself doesn't have to.

## Usage

Add dependency.
In `pubspec.yaml`:

```
dependency:
  angular_pagination
```
Do `pub get`.

Import
```dart
import 'package:angular_pagination/angular_pagination.dart';
```

Install Angular module
```dart
class YourModule extends Module {
  YourModule() {
    install(new AngularPaginationModule());

    //Your other angular bootstrap stuff
  }
}
```

Create `Paginator` object somewhere in angular scope where it is convenient for you and pass it to `pagination` filter.
For example, if you created `Paginator` directly in root `scope`:
```html
<span ng-repeat="item in items | pagination:paginator">...</span>
```
Then act on created `Paginator` object whatever way you like and filter will recompute visible items.
For example
```html
<button ng-click="paginator.goNext()">Next</button>
```
```dart
document.querySelector("select#some-input").onChange.listen((e) => scope.paginator.pageSize = int.parse(e.target.value));
```
Etc.

**Important** `Paginator` is not a singleton service (or else there would be only one pagination per app possible).
You create one instance for every isolated pagination you need and pass reference around as you would with any normal object.
`Paginator` is **not** injected via DI (there is no need, it has no dependencies).

See [example](https://github.com/daydev/angular_pagination/tree/master/example) to see how this utility library can be used to create reusable pager component (e.g. like Twitter Bootstrap pager).
