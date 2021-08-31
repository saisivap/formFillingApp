import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:form_flutter/inform_model.dart';
import 'package:form_flutter/main.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class FormFill extends StatefulWidget {
  const FormFill({Key? key}) : super(key: key);

  @override
  _FormFillState createState() => _FormFillState();
}

class _FormFillState extends State<FormFill> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  // int val = -1;
  String gender = "male";
  bool onclick = true;

  checkValidator() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      InfromModel infromModel = InfromModel(
          firstName: firstNameController.text.trim(),
          LastName: lastNameController.text.trim(),
          email: emailController.text.trim(),
          number: mobileController.text,
          address: addressController.text,
          gender: gender);
      infromBox.add(infromModel);
      Get.back();
    }
  }

  late Box<InfromModel> infromBox;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    infromBox = Hive.box(informationModelName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: WillPopScope(
          onWillPop: () async {
            Get.back();
            return true;
          },
          child: Stack(
            children: [
              Container(
                color: Colors.transparent,
                padding: EdgeInsets.all(size.width * 0.05),
                height: size.height,
                width: size.width,
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Padding(
                            padding: EdgeInsets.all(
                              8.0,
                            ),
                            child: TextFormField(
                              controller: firstNameController,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter First Name";
                                } else {
                                  return null;
                                }
                              },
                              decoration: inputDecoration(
                                Icon(
                                  Icons.supervised_user_circle,
                                  color: Color(0XFF35a4f2),
                                ),
                                "First Name",
                                Color(0XFF35a4f2),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(
                              8.0,
                            ),
                            child: TextFormField(
                              controller: lastNameController,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter Last Name";
                                } else {
                                  return null;
                                }
                              },
                              decoration: inputDecoration(
                                Icon(
                                  Icons.supervised_user_circle,
                                  color: Color(0XFF35a4f2),
                                ),
                                "Last Name",
                                Color(0XFF35a4f2),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(
                              8.0,
                            ),
                            child: TextFormField(
                              controller: emailController,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter Email";
                                } else {
                                  if (RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value)) {
                                    return null;
                                  } else {
                                    return "Please enter valid Email";
                                  }
                                }
                              },
                              decoration: inputDecoration(
                                Icon(
                                  Icons.email,
                                  color: Color(0XFF35a4f2),
                                ),
                                "Email",
                                Color(0XFF35a4f2),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(
                              8.0,
                            ),
                            child: TextFormField(
                              controller: mobileController,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter Number";
                                } else {
                                  if (value.length == 10) {
                                    return null;
                                  } else {
                                    return "Please Enter Valid Phone number";
                                  }
                                }
                              },
                              decoration: inputDecoration(
                                Icon(
                                  Icons.phone_android,
                                  color: Color(0XFF35a4f2),
                                ),
                                "Mobile",
                                Color(0XFF35a4f2),
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: size.width * 0.3,
                                    child: Text(
                                      onclick ? "Male" : "Female",
                                      style: TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        onclick = !onclick;
                                        gender = onclick ? "male" : "female";
                                        print(onclick);
                                        print(gender);
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: ClayContainer(
                                        height: 50,
                                        width: 50,
                                        borderRadius: 50,
                                        color: Colors.amberAccent,
                                        curveType: onclick
                                            ? CurveType.concave
                                            : CurveType.convex,
                                        parentColor: Colors.white,
                                        child: Center(
                                          child: Icon(
                                            onclick ? Icons.male : Icons.female,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                            padding: EdgeInsets.all(
                              8.0,
                            ),
                            child: TextFormField(
                              controller: addressController,
                              maxLines: 4,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter Address";
                                } else {
                                  return null;
                                }
                              },
                              decoration: inputDecoration(
                                Icon(
                                  Icons.location_city,
                                  color: Color(0XFF35a4f2),
                                ),
                                "Address",
                                Color(0XFF35a4f2),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Container(
                            width: size.width * 0.60,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                checkValidator();
                              },
                              child: Text(
                                "Submit",
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
              // GestureDetector(
              //   onTap: () {
              //     Get.back();
              //   },
              //   child: Positioned(
              //     child: Container(
              //         width: size.width * 0.1,
              //         height: size.width * 0.1,
              //         color: Colors.black,
              //         child: Center(
              //           child: Text(
              //             "X",
              //             style: TextStyle(
              //                 color: Theme.of(context).primaryColor, fontSize: 24),
              //           ),
              //         )),
              //   ),
              // )
            ],
          ),
        ));
  }

  InputDecoration inputDecoration(
      Widget icon, String text, Color labelTextColor) {
    return InputDecoration(
      prefixIcon: icon,
      labelText: text,
      labelStyle: TextStyle(
        color: Colors.grey,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
