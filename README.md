[![Build Status](https://drone.io/github.com/daydev/angular_pagination/status.png)](https://drone.io/github.com/daydev/angular_pagination/latest)

## Description

This is paging formatter for [angular.dart](https://github.com/angular/angular.dart) similar to `limitTo`, `orderBy` and `filter` formatters provided by angular.dart itself.
The formatter uses `Paginator` object which provides methods to navigate pages and deals with edge cases and illegal states.

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

Create `Paginator` object somewhere in angular scope where it is convenient for you and pass it to `pagination` formatter.
For example, if you created `Paginator` directly in root `scope`:
```html
<span ng-repeat="item in items | pagination:paginator.instance">...</span>
```
####Very Important Note
You should pass `paginator.instance` to the formatter and not `paginator` itself.
This is because angular.dart's change detection algorithm checks current and previous values of an object for identity, not equality.
So it will not react to changes of `paginator`'s state if the object's reference stays the same.
The `instance` getter is a workaround to circumvent this issue. It will return a new reference if `paginator`'s state has changed since last call,
and the same reference if it hasn't.
You should use `instance` getter **only** when passing argument to formatter and nowhere else.
**You** work with `paginator` object directly, but angular change detection is forced to look at it through `instance` "proxy" if this makes sense.

Then act on created `Paginator` object whatever way you like and formatter will recompute visible items.
For example
```html
<button ng-click="paginator.goNext()">Next</button>
```
```dart
document.querySelector("select#some-input").onChange.listen((e) => scope.paginator.pageSize = int.parse(e.target.value));
```
Etc.

**Important** `Paginator` is not a singleton service (or else there would be only one pagination per app possible).
You create one instance for every isolated pagination you need and pass the reference around as you would with any normal object.
`Paginator` is **not** injected via DI (there is no need, it has no dependencies).

Refer to [example](https://github.com/daydev/angular_pagination/tree/master/example) to see how this utility library can be used to create a reusable pager component (e.g. like Twitter Bootstrap pager).
Make note that `ctrl.paginator.instance` is used only as formatter's argument, two-way data binding is through `ctrl.paginator` itself.
