import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreWidget extends StatefulWidget {
  ExploreWidget({
    Key key,
    this.searchTerm,
  }) : super(key: key);

  final String searchTerm;

  @override
  _ExploreWidgetState createState() => _ExploreWidgetState();
}

class _ExploreWidgetState extends State<ExploreWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.secondaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            height: 145,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 24,
                        ),
                        iconSize: 24,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(7, 0, 0, 0),
                        child: Text(
                          'Search',
                          style: FlutterFlowTheme.bodyText2.override(
                            fontFamily: 'Playfair Display',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 55,
                          decoration: BoxDecoration(
                            color: Color(0xFFF0F5F6),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ExploreWidget(
                                          searchTerm: textController.text,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    Icons.search,
                                    color: FlutterFlowTheme.tertiaryColor,
                                    size: 24,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 4),
                                    child: TextFormField(
                                      controller: textController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            'Search artist, maker, department...',
                                        labelStyle:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Playfair Display',
                                          color: Color(0xFF95A1AC),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Playfair Display',
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
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
                                              child: Text(
                                                'Hello World',
                                                style: FlutterFlowTheme
                                                    .bodyText2
                                                    .override(
                                                  fontFamily:
                                                      'Playfair Display',
                                                  color: FlutterFlowTheme
                                                      .tertiaryColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: AutoSizeText(
                                                'Hello World',
                                                style: FlutterFlowTheme
                                                    .bodyText2
                                                    .override(
                                                  fontFamily:
                                                      'Playfair Display',
                                                  color: FlutterFlowTheme
                                                      .tertiaryColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
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
