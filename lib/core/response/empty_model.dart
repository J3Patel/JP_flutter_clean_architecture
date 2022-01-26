
import 'package:JP_flutter_clean_architecture/core/model/jp_model.dart';

class EmptyModel extends JPDataModel<EmptyModel> {

  EmptyModel({this.name});

  EmptyModel.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return;
    }
    name = json['name'] as String;
  }

  String name;

  @override
  Map<String, Object> toJson() {
    final data = <String, Object>{};
    data['name'] = name ?? '';
    return data;
  }

  @override
  EmptyModel fromJson(Map<String, dynamic> json) {
    return EmptyModel.fromJson(json);
  }
}