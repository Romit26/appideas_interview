import 'package:room_management/core/model/member_model.dart';

class RoomModel {
  String roomTitle;
  bool pet;
  List<Member> members=[];

  RoomModel({required this.roomTitle,required this.members,this.pet=false});
}