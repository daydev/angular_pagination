library angular.pagination.hop_runner;

import 'package:hop/hop.dart';
import 'package:hop/hop_tasks.dart';
import 'dart:io';
import 'dart:async';

main(List<String> args) {
  addTask('test', unitTestTask());
  runHop(args, paranoid: false);
}

Task unitTestTask() {
  final allPassedRegExp = new RegExp('All \\d+ tests passed');
  return new Task ((TaskContext ctx) {
    ctx.info("Running Tests....");
    var result = Process.run('content_shell', ['--dump-render-tree', 'test/angular_pagination_spec.html'])
    .then((ProcessResult process) {
      ctx.info(process.stdout);
      if (!allPassedRegExp.hasMatch(process.stdout)) {
        ctx.fail("Some tests failed");
      } else {
        ctx.info("All tests passed");
      }
    });
    return result;
  });
}