import 'jp_environment.dart';

class Staging extends JPEnvironment {
  Staging(): super('https://staging.api.jp.jp.in');

  @override
  // TODO: implement apiVersion
  String get apiVersion => throw UnimplementedError();

  @override
  // TODO: implement dietToolVersion
  String get dietToolVersion => throw UnimplementedError();

}

class StagingV8 extends Staging {

  @override
  String get apiVersion => 'v8';

  @override
  String get dietToolVersion => 'v5';
}