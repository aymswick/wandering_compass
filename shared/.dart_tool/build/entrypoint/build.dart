// @dart=3.6
// ignore_for_file: directives_ordering
// build_runner >=2.4.16
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:build_runner/src/build_plan/builder_factories.dart' as _i1;
import 'package:dart_mappable_builder/dart_mappable_builder.dart' as _i2;
import 'package:source_gen/builder.dart' as _i3;
import 'package:stormberry/builder.dart' as _i4;
import 'dart:io' as _i5;
import 'package:build_runner/src/bootstrap/processes.dart' as _i6;

final _builderFactories = _i1.BuilderFactories(
  builderFactories: {
    'dart_mappable_builder:dart_mappable_builder': [_i2.buildMappable],
    'source_gen:combining_builder': [_i3.combiningBuilder],
    'stormberry:database_schema': [_i4.buildDatabaseSchema],
    'stormberry:runner': [_i4.buildRunner],
    'stormberry:schema': [_i4.buildSchema],
    'stormberry:stormberry': [_i4.analyzeSchema],
  },
  postProcessBuilderFactories: {'source_gen:part_cleanup': _i3.partCleanup},
);
void main(List<String> args) async {
  _i5.exitCode = await _i6.ChildProcess.run(
    args,
    _builderFactories,
  )!;
}
