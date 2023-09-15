import 'package:flutter/material.dart';
import 'package:room_management/core/constants/color_constant.dart';
import 'package:room_management/core/model/member_model.dart';
import 'package:room_management/core/model/room_model.dart';
import 'package:room_management/view/widgets/title.dart';

class RoomView extends StatefulWidget {
  const RoomView({super.key});

  @override
  State<RoomView> createState() => _RoomViewState();
}

class _RoomViewState extends State<RoomView> {
  List<RoomModel> rooms = <RoomModel>[];
  bool pet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text("Hotel Management"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  rooms.add(RoomModel(
                      roomTitle: "Room ${rooms.length + 1}", members: []));
                  setState(() {});
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: addRoomBtnBG,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Add Room",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            ...List.generate(rooms.length, (index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          rooms[index].roomTitle,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        InkWell(
                          onTap: () {
                            rooms.removeAt(index);
                            setState(() {});
                          },
                          child: const Icon(
                            Icons.delete,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 1),
                    color: petBG,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: rooms[index].pet,
                          onChanged: (value) {
                            rooms[index].pet = value!;
                            setState(() {});
                          },
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text("Do you have pets?")
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    color: memberTitleBG,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Members",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        InkWell(
                          onTap: () {
                            rooms[index].members.add(Member(
                                memberName:
                                    "Member ${rooms[index].members.length + 1}"));
                            setState(() {});
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                color: addRoomBtnBG,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Add",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  ...List.generate(rooms[index].members.length, (i) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(rooms[index].members[i].memberName),
                                InkWell(
                                  onTap: () {
                                    rooms[index].members.removeLast();
                                    setState(() {});
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.black,
                                    size: 15,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(right: 5, left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      titleView("First Name"),
                                      TextField(
                                        decoration: InputDecoration(
                                            hintText: "Enter first name here",
                                            isDense: true,
                                            hintStyle: const TextStyle(
                                                fontWeight: FontWeight.normal),
                                            // important line
                                            contentPadding:
                                                const EdgeInsets.fromLTRB(
                                                    10, 10, 10, 0),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                borderSide: const BorderSide(
                                                    color: Colors.black)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                borderSide: const BorderSide(
                                                    color: Colors.black))),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(right: 10, left: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      titleView("Last Name"),
                                      TextField(
                                        decoration: InputDecoration(
                                            hintText: "Enter last name here",
                                            isDense: true,
                                            hintStyle: const TextStyle(
                                                fontWeight: FontWeight.normal),
                                            // important line
                                            contentPadding:
                                                const EdgeInsets.fromLTRB(
                                                    10, 10, 10, 0),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                borderSide: const BorderSide(
                                                    color: Colors.black)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                borderSide: const BorderSide(
                                                    color: Colors.black))),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "Child",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Checkbox(
                                  value: rooms[index].members[i].child,
                                  onChanged: (value) {
                                    rooms[index].members[i].child = value!;
                                    setState(() {});
                                  },
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "Date of Birth",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: TextField(
                                    onTap: () {},
                                    readOnly: true,
                                    decoration: InputDecoration(
                                        suffixIconConstraints:
                                            const BoxConstraints(
                                                maxHeight: 15, maxWidth: 15),
                                        suffixIcon: const Padding(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Icon(Icons.calendar_month,
                                              size: 15),
                                        ),
                                        hintText: "MM,DD,YYYY",
                                        isDense: true,
                                        hintStyle: const TextStyle(
                                            fontWeight: FontWeight.normal),
                                        // important line
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                10, 10, 10, 0),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            borderSide: const BorderSide(
                                                color: Colors.black)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            borderSide: const BorderSide(
                                                color: Colors.black))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Divider(),
                          ),
                        ]);
                  })
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
