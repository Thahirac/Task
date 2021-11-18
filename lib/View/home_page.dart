// ignore_for_file: file_names

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:task/Model/table_class.dart';
import 'package:task/View/login_page.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_core/theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<TableDataApi?> getdata() async {
    try {
      String url = "https://run.mocky.io/v3/ccc79732-8b43-4c98-94cb-6044bd1964eb";
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return TableDataApi.fromJson(jsonDecode(response.body));
      } else {
        print("No connection");
      }
    }
    catch(e){
      print(e);
    }
  }
  Color? clor;
  void colorchecking(item)async{
    if(item =="cancelled"){
      clor =Colors.red;
    }
    else if(item =="processing"){
      clor=Colors.yellow;
    }
    else if(item =="completed"){
      clor=Colors.green;
    }
    else{
      clor=Colors.white;
    }
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Color> clr = [
      Colors.yellow.shade600,
      Colors.red,
      Colors.green,
      Colors.green,
      Colors.yellow.shade600,
    ];

    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //       onPressed: () {
      //         Navigator.pushReplacement(context,
      //             MaterialPageRoute(builder: (context) => const Login()));
      //       },
      //       icon: const Icon(
      //         Icons.arrow_back,
      //         color: Colors.black,
      //       )),
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      //   title: Text(
      //     "Home",
      //     style: GoogleFonts.poppins(
      //       fontSize: 18,
      //       color: Colors.black,
      //     ),
      //   ),
      // ),
      body: Column(
          children: [
            SizedBox(height: size.height * 0.05),
            Container(
              height: 20,
              width: MediaQuery.of(context).size.width,
              child: Container(
                child: Table(
                  border: TableBorder(
                    bottom: BorderSide(color: Colors.yellow.shade500, width: 0.5),
                    top: BorderSide(color: Colors.yellow.shade500, width: 0.2),
                  ),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "SECURITY KEY",
                              textScaleFactor: 1,
                              style: GoogleFonts.poppins(
                                  fontSize: 11, color: Colors.yellow.shade600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "ORDER DATE",
                              textScaleFactor: 1,
                              style: GoogleFonts.poppins(
                                  fontSize: 12, color: Colors.yellow.shade600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "AMMOUNT",
                              textScaleFactor: 1,
                              style: GoogleFonts.poppins(
                                  fontSize: 12, color: Colors.yellow.shade600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "STATUS",
                              textScaleFactor: 1,
                              style: GoogleFonts.poppins(
                                  fontSize: 12, color: Colors.yellow.shade600),
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder<TableDataApi?>(
                    future: getdata(),
                    builder: (context, snapshot) {
                      List<Datum>? tabledata = snapshot.data?.data;
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: tabledata?.length,
                          itemBuilder: (context, index) {
                            colorchecking(tabledata?[index]
                                .status
                                .toString());
                            return Container(
                              height: 80,
                              child: Table(
                                border: TableBorder(
                                  bottom: BorderSide(
                                      color: Colors.yellow.shade500, width: 0.5),
                                ),
                                children: [
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          tabledata?[index].securitykey.toString() ??
                                              "6578",
                                          textScaleFactor: 1,
                                          style: GoogleFonts.poppins(
                                            fontSize: 11,)
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          '${tabledata?[index].orderdate?.day}-${tabledata?[index].orderdate?.month}-${tabledata?[index].orderdate?.year}',
                                          textScaleFactor: 1,style: GoogleFonts.poppins(
                                        fontSize: 12,)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          tabledata?[index].amount.toString() ??
                                              "25.6",
                                          textScaleFactor: 1,style: GoogleFonts.poppins(
                                        fontSize: 12,)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 17,right: 6),
                                      child: Container(
                                          color: clor,
                                          height: 25,
                                          width: 60,
                                          child: Center(
                                              child: Text(
                                                  tabledata?[index]
                                                      .status
                                                      .toString() ??
                                                      "Processing",
                                                  textScaleFactor: 1,style: GoogleFonts.poppins(
                                                fontSize: 12,)))),
                                    ),
                                  ]),
                                ],
                              ),
                            );
                          },
                        );
                      } else {
                        return Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.35,
                            ),
                            const Center(child: CupertinoActivityIndicator()),
                          ],
                        );
                      }
                    }),
              ),
            ),
            Container(
              child: SfDataPagerTheme(
                data: SfDataPagerThemeData(
                  itemColor: Colors.white,
                  selectedItemColor: Colors.yellow.shade500,
                  itemBorderRadius: BorderRadius.circular(2),
                  backgroundColor: Colors.grey.shade200,
                ),
                child: SfDataPager(
                  delegate: DataPagerDelegate(),
                  pageCount: 5,
                  direction: Axis.horizontal,
                ),
              ),
            ),
          ]),
    );
  }
}