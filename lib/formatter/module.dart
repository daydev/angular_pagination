library angular.pagination.formatter;

import 'dart:math' as math;

import 'package:angular/angular.dart';
import 'package:angular_pagination/core/core.dart';

part 'src/pagination_formatter.dart';

class AngularPaginationModule extends Module {
  AngularPaginationModule() {
    type(PaginationFormatter);
  }
}

