##0.2.0
Updated to conform with breaking changes in angular.dart 0.10.0

##0.1.5
Added `identity` getter to `Paginator` to circumvent angular change detection algorithm limitations (it will check current and previous values for identity, not equality).

##0.1.3
Removed conversion of numeric strings. Moved conversion of values mapped through `ng-model` to separate library [angular_convert](https://github.com/daydev/angular_convert.dart)

##0.1.1 and 0.1.2
Added conversion of numeric strings to integers when mapping `Paginator`'s fields through `ng-model`.

##0.1.0
Initial release. `pagination` angular filter and `Paginator` utility object to hadndle transitions.



