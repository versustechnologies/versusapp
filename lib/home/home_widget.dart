import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({
    Key key,
    this.searchTerm,
  }) : super(key: key);

  final String searchTerm;

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.secondaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Container(
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.network(
                              'https://images.metmuseum.org/CRDImages/dp/original/DP108505.jpg',
                              width: 56,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Hello World',
                                        style:
                                            FlutterFlowTheme.bodyText2.override(
                                          fontFamily: 'Playfair Display',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 3, 0, 6),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 6, 0),
                                              child: StreamBuilder<
                                                  List<VersusRecord>>(
                                                stream: queryVersusRecord(
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50,
                                                        height: 50,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color:
                                                              FlutterFlowTheme
                                                                  .primaryColor,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<VersusRecord>
                                                      textVersusRecordList =
                                                      snapshot.data;
                                                  // Customize what your widget looks like with no query results.
                                                  if (snapshot.data.isEmpty) {
                                                    return Container(
                                                      height: 100,
                                                      child: Center(
                                                        child:
                                                            Text('No results.'),
                                                      ),
                                                    );
                                                  }
                                                  final textVersusRecord =
                                                      textVersusRecordList
                                                          .first;
                                                  return Text(
                                                    'Hello World',
                                                    style: FlutterFlowTheme
                                                        .bodyText2
                                                        .override(
                                                      fontFamily:
                                                          'Playfair Display',
                                                      color: FlutterFlowTheme
                                                          .tertiaryColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: StreamBuilder<
                                                  List<UsersRecord>>(
                                                stream: queryUsersRecord(
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50,
                                                        height: 50,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color:
                                                              FlutterFlowTheme
                                                                  .primaryColor,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<UsersRecord>
                                                      textUsersRecordList =
                                                      snapshot.data;
                                                  // Customize what your widget looks like with no query results.
                                                  if (snapshot.data.isEmpty) {
                                                    return Container(
                                                      height: 100,
                                                      child: Center(
                                                        child:
                                                            Text('No results.'),
                                                      ),
                                                    );
                                                  }
                                                  final textUsersRecord =
                                                      textUsersRecordList.first;
                                                  return AutoSizeText(
                                                    'Hello World',
                                                    style: FlutterFlowTheme
                                                        .bodyText2
                                                        .override(
                                                      fontFamily:
                                                          'Playfair Display',
                                                      color: FlutterFlowTheme
                                                          .tertiaryColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  );
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Text(
                                        'Hello World',
                                        style:
                                            FlutterFlowTheme.bodyText2.override(
                                          fontFamily: 'Playfair Display',
                                          color: FlutterFlowTheme.primaryColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: FlutterFlowTheme.tertiaryColor,
                              size: 24,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
