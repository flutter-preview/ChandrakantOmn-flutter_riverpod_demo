
// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'User')
class User extends BaseEntity {
  @PrimaryKey(autoGenerate: true)
  int? id=0;
  String? name;
  String? mobileNumber;
  int? dairyId;
  User(this.id, {this.name, this.mobileNumber,  this.dairyId});

  @override
  List<Object?> get props => [name, mobileNumber, id, dairyId];

  static User fromJson(data) {
    return User(null);
  }
}


abstract class BaseEntity extends Equatable{
  @ColumnInfo(name: 'create_time')
  late String createTime;

  BaseEntity() {
    createTime = DateTime.now().toString();
  }
}