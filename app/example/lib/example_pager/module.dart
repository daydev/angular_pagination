library angular.pagination.example.pager;

import 'package:angular/angular.dart';
import 'package:angular_pagination/angular_pagination.dart';

part 'example_pager.dart';

class ExamplePagerModule extends Module {
  ExamplePagerModule() {
    type(NgxExamplePager);
  }
}
