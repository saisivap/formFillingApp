import 'package:flutter/material.dart';
import 'package:form_flutter/constants.dart';
import 'package:form_flutter/form_fill.dart';
import 'package:form_flutter/inform_model.dart';
import 'package:form_flutter/main.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:math';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  late Box<InfromModel> infromBox;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    infromBox = Hive.box(informationModelName);
  }

  @override
  Widget build(BuildContext context) {
    final Random _random = Random();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Details"),
      ),
      body: Stack(
        children: [
          Container(
              child: Wrap(
            children: [
              ValueListenableBuilder(
                  valueListenable: infromBox.listenable(),
                  builder: (context, Box<InfromModel> informations, _) {
                    List<int> keys = informations.keys.cast<int>().toList();
                    // return ListView.builder(
                    //   shrinkWrap: true,
                    //   itemCount: keys.length,
                    //   itemBuilder: (context, index) {
                    //     final key = keys[index];
                    //     final InfromModel? infromation = informations.get(key);
                    //     return Container(
                    //       height: width * 0.4,
                    //       width: width * 0.4,
                    //       child: Column(
                    //         children: [
                    //           Text(infromation!.firstName),
                    //           Text(infromation.email),
                    //         ],
                    //       ),
                    //     );
                    //   },
                    // );
                    return Padding(
                      padding: EdgeInsets.all(8),
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            childAspectRatio: 2 / 2,
                            maxCrossAxisExtent: width / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                          itemCount: keys.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final key = keys[index];
                            final InfromModel? information =
                                informations.get(key);
                            return GestureDetector(
                              onLongPress: () {
                                informations.delete(key);
                              },
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        elevation: 5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(10),
                                                child: Center(
                                                  child: Text(
                                                    "Personal Details",
                                                    style:
                                                        TextStyle(fontSize: 32),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                information!.firstName +
                                                    " " +
                                                    information.LastName,
                                                style: textstyle,
                                              ),
                                              Text(
                                                information.email,
                                                style: textstyle,
                                              ),
                                              Text(
                                                information.number,
                                                style: textstyle,
                                              ),
                                              Text(
                                                information.gender,
                                                style: textstyle,
                                              ),
                                              Text(
                                                information.address,
                                                style: textstyle,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(
                                        _random.nextInt(256),
                                        _random.nextInt(256),
                                        _random.nextInt(256),
                                        _random.nextInt(256)),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Text(
                                          information!.firstName
                                              .substring(0, 1),
                                          style: TextStyle(
                                              fontSize: height * 0.09,
                                              color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                    Text(
                                        information.firstName +
                                            " " +
                                            information.LastName,
                                        textAlign: TextAlign.center,
                                        style: textstyle),
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  })
            ],
          )),
          // Positioned(
          //   bottom: 0,
          //   right: 0,
          //   child: Padding(
          //     padding: const EdgeInsets.all(15.0),
          //     child: FloatingActionButton(
          //       backgroundColor: Theme.of(context).primaryColor,
          //       onPressed: () => Get.dialog(
          //         const FormFill(),
          //       ),
          //       child: Icon(Icons.add),
          //     ),
          //   ),
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => Get.dialog(
          const FormFill(),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
