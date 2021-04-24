import 'package:flutter/material.dart';
import 'package:laboil/action/firestore_action.dart';
import 'package:laboil/add_kpop/addkpop.dart';
import 'package:laboil/utilities/constants.dart';
import 'package:laboil/view/login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String res = '';
  TextEditingController namecontroller = TextEditingController();
  TextEditingController groupcontroller = TextEditingController();
  TextEditingController companycontroller = TextEditingController();

  List kpop = [];
  @override
  void initState() {
    // TODO: implement initState
    ActionData().getAllData().then((result) {
      print(result);
      setState(() {
        kpop = result;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        backgroundColor: Colors.purple[300],
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'K-pop',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.purple[200],
                    borderRadius: BorderRadius.circular(10)),
                height: 50,
                child: TextField(
                  controller: namecontroller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 3.0),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black26,
                    ),
                    hintText: ': name',
                    hintStyle: kHintTextStyle,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.purple[200],
                    borderRadius: BorderRadius.circular(10)),
                height: 50,
                child: TextField(
                  controller: groupcontroller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 3.0),
                    prefixIcon: Icon(
                      Icons.group,
                      color: Colors.black26,
                    ),
                    hintText: ': group',
                    hintStyle: kHintTextStyle,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.purple[200],
                    borderRadius: BorderRadius.circular(10)),
                height: 50,
                child: TextField(
                  controller: companycontroller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 3.0),
                    prefixIcon: Icon(
                      Icons.apartment,
                      color: Colors.black26,
                    ),
                    hintText: ': company',
                    hintStyle: kHintTextStyle,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 90,
                    height: 40,
                    child: RaisedButton(
                      elevation: 5.0,
                      onPressed: () {
                        print('success');
                        ActionData().addNewRecord({
                          "name": namecontroller.text.trim(),
                          "group": groupcontroller.text.trim(),
                          "company": companycontroller.text.trim(),
                        });

                        setState(() {
                          res = 'Submit Success';
                        });
                      },
                      padding: EdgeInsets.all(10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Color(0xFF84BAC9),
                      child: Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: SizedBox(
                      child: RaisedButton(
                          elevation: 5.0,
                          onPressed: () {
                            print('Logout success');

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => addkpop()));
                          },
                          padding: EdgeInsets.all(10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Color(0xFFE89902),
                          child: Text(
                            'List',
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 1.5,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: SizedBox(
                      width: 90,
                      height: 40,
                      child: RaisedButton(
                          elevation: 5.0,
                          onPressed: () {
                            print('Logout success');

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                          padding: EdgeInsets.all(10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Color(0xFF234257),
                          child: Text(
                            'LogOut',
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 1.5,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
