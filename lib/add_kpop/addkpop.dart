import 'package:flutter/material.dart';
import 'package:laboil/action/firestore_action.dart';
import 'package:laboil/add_kpop/addkpop.dart';
import 'package:laboil/view/home.dart';
import 'package:laboil/view/home.dart';
import 'package:laboil/view/home.dart';

class addkpop extends StatefulWidget {
  @override
  _addkpopState createState() => _addkpopState();
}

class _addkpopState extends State<addkpop> {
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
          title: Text('AddKpop'),
        ),
        backgroundColor: Colors.purple[300],
        body: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: kpop.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.purple[300],
                  child: SizedBox(
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.purple[100],
                        width: 350,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Name: ${kpop[index]['name']}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Group: ${kpop[index]['group']}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Company: ${kpop[index]['company']}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    child: RaisedButton(
                                        elevation: 5.0,
                                        onPressed: () {
                                          print('success');
                                          final res = ActionData().deleteMenu(
                                              "${kpop[index]['name']}");

                                          print(res);
                                        },
                                        padding: EdgeInsets.all(10.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        color: Colors.red,
                                        child: Text(
                                          'delete',
                                          style: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: 1.5,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    child: RaisedButton(
                                        elevation: 5.0,
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Home()));
                                          print('success');
                                        },
                                        padding: EdgeInsets.all(10.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        color: Colors.green,
                                        child: Text(
                                          'Back',
                                          style: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: 1.5,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
