import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCopyWidget extends StatefulWidget {
  HomeCopyWidget({Key key}) : super(key: key);

  @override
  _HomeCopyWidgetState createState() => _HomeCopyWidgetState();
}

class _HomeCopyWidgetState extends State<HomeCopyWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.black,
      body: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: StreamBuilder<List<VersusRecord>>(
              stream: queryVersusRecord(
                queryBuilder: (versusRecord) =>
                    versusRecord.orderBy('created_time'),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        color: FlutterFlowTheme.primaryColor,
                      ),
                    ),
                  );
                }
                List<VersusRecord> listViewVersusRecordList = snapshot.data;
                // Customize what your widget looks like with no query results.
                if (snapshot.data.isEmpty) {
                  return Container(
                    height: 100,
                    child: Center(
                      child: Text('No results.'),
                    ),
                  );
                }
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewVersusRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewVersusRecord =
                        listViewVersusRecordList[listViewIndex];
                    return Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Colors.black,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Counter A',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Playfair Display',
                              fontSize: 10,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: StreamBuilder<TopicsRecord>(
                              stream: TopicsRecord.getDocument(
                                  listViewVersusRecord.topicA),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                final optionATopicsRecord = snapshot.data;
                                return FFButtonWidget(
                                  onPressed: () async {
                                    final votesCreateData =
                                        createVotesRecordData(
                                      createdTime: getCurrentTimestamp,
                                      user: currentUserReference,
                                      votedA: true,
                                      votedB: false,
                                      votedVersus:
                                          listViewVersusRecord.reference,
                                    );
                                    await VotesRecord.collection
                                        .doc()
                                        .set(votesCreateData);
                                  },
                                  text: optionATopicsRecord.name,
                                  options: FFButtonOptions(
                                    width: 100,
                                    height: 100,
                                    color: FlutterFlowTheme.primaryColor,
                                    textStyle: FlutterFlowTheme.title3.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 5,
                                    ),
                                    borderRadius: 100,
                                  ),
                                );
                              },
                            ),
                          ),
                          Text(
                            'VS',
                            style: FlutterFlowTheme.title3.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: StreamBuilder<TopicsRecord>(
                              stream: TopicsRecord.getDocument(
                                  listViewVersusRecord.topicB),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                final optionBTopicsRecord = snapshot.data;
                                return FFButtonWidget(
                                  onPressed: () {
                                    print('OptionB pressed ...');
                                  },
                                  text: optionBTopicsRecord.name,
                                  options: FFButtonOptions(
                                    width: 100,
                                    height: 100,
                                    color: Color(0xFF2387BF),
                                    textStyle: FlutterFlowTheme.title3.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 5,
                                    ),
                                    borderRadius: 100,
                                  ),
                                );
                              },
                            ),
                          ),
                          Text(
                            'Counter B',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Playfair Display',
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
