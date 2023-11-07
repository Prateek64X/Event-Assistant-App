import 'dart:async';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'join_event_model.dart';
export 'join_event_model.dart';

class JoinEventWidget extends StatefulWidget {
  const JoinEventWidget({
    Key? key,
    required this.eventId,
  }) : super(key: key);

  final String? eventId;

  @override
  _JoinEventWidgetState createState() => _JoinEventWidgetState();
}

class _JoinEventWidgetState extends State<JoinEventWidget> {
  late JoinEventModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JoinEventModel());
    print("Join Event Widget :: eventId: ${widget.eventId}");
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  // launch link in browser
  Future<void> _launchInBrowser(String urlStr) async {
    Uri url = Uri.parse(urlStr);
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.00, 0.00),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
        child: StreamBuilder<List<EventRecord>>(
          stream: queryEventRecord(
            queryBuilder: (query) => query.where(FieldPath.documentId, isEqualTo: widget.eventId),
            singleRecord: false,
          ),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xFF5785E0),
                    ),
                  ),
                ),
              );
            }

            // Fetch Single Event Record By Query
            EventRecord? materialCardEventRecord = snapshot.data?.isNotEmpty == true ? snapshot.data![0] : null;

            if (materialCardEventRecord == null) {
              return Container(); // No event found.
            }

            if (materialCardEventRecord == null) {
              print("No matching event record found"); // Debug print
              return Container(); // Handle the event not found scenario
            }

            // Check if an event has been found or not
            if (materialCardEventRecord == null) {
              // Handle the event not found scenario
              return Container(
                  // Your code to show that no event was found
                  );
            }

            return Container(
              width: double.infinity,
              constraints: BoxConstraints(
                maxWidth: 530,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    color: Color(0x33000000),
                    offset: Offset(0, 1),
                  )
                ],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  width: 1,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.00, 0.00),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                          child: Text(
                            'Join Event',
                            style: FlutterFlowTheme.of(context).headlineMedium,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 170,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              materialCardEventRecord!.eventName,
                              style: FlutterFlowTheme.of(context).titleLarge,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                              child: Text(
                                materialCardEventRecord!.eventDescription,
                                style: FlutterFlowTheme.of(context).labelSmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Start Date',
                              style: FlutterFlowTheme.of(context).titleLarge,
                            ),
                            AutoSizeText(
                              dateTimeFormat(
                                  'MMMEd', materialCardEventRecord!.eventDate!),
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'End Date',
                              style: FlutterFlowTheme.of(context).titleLarge,
                            ),
                            AutoSizeText(
                              dateTimeFormat('MMMEd',
                                  materialCardEventRecord!.eventEndDate!),
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                        child: Text(
                          "${materialCardEventRecord!.eventEndDate!.difference(materialCardEventRecord!.eventDate!).inDays.toString()} days remaining",
                          style: FlutterFlowTheme.of(context).titleSmall,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                        child: Text(
                          'Social Media',
                          style: FlutterFlowTheme.of(context).titleLarge,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  // For Community Link, Tap to copy
                                  onTap: () async {
                                    // Copy the link to the clipboard
                                    Clipboard.setData(ClipboardData(
                                        text: materialCardEventRecord!
                                            .eventCommunityLink));
                                    // Show a snackbar
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content:
                                            Text('Link copied to clipboard'),
                                      ),
                                    );
                                  },
                                  child: RichText(
                                    textScaleFactor:
                                        MediaQuery.of(context).textScaleFactor,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Link: ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        WidgetSpan(
                                          child: Container(
                                            width:
                                                200, // Limit the width here as per your requirement
                                            child: Text(
                                              materialCardEventRecord!
                                                  .eventCommunityLink,
                                              style: TextStyle(),
                                            ),
                                          ),
                                        ),
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context).primary,
                              borderRadius: 8,
                              borderWidth: 1,
                              buttonSize: 40,
                              fillColor: FlutterFlowTheme.of(context).primary,
                              icon: Icon(
                                Icons.open_in_new,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24,
                              ),
                              onPressed: () {
                                try {
                                  _launchInBrowser(materialCardEventRecord!
                                      .eventCommunityLink);
                                } catch (e) {
                                  print('Error launching URL: $e');
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      // Join Form Link - Removed as Join Button exists
                      /*Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                          child: Text(
                            'Join Form',
                            style: FlutterFlowTheme.of(context).titleLarge,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.00, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 0, 0),
                                  child: RichText(
                                    textScaleFactor:
                                        MediaQuery.of(context).textScaleFactor,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Link: ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        TextSpan(
                                          text: materialCardEventRecord!
                                              .eventFormLink,
                                          style: TextStyle(),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).primary,
                                borderRadius: 8,
                                borderWidth: 1,
                                buttonSize: 40,
                                fillColor: FlutterFlowTheme.of(context).primary,
                                icon: Icon(
                                  Icons.open_in_new,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24,
                                ),
                                onPressed: () {
                                  print('CommunityLink-IconButton pressed ...');
                                },
                              ),
                            ],
                          ),
                        ),*/
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 16, 16, 16),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        Navigator.pop(context);
                                      },
                                      text: 'Cancel',
                                      options: FFButtonOptions(
                                        width: 144.0,
                                        height: 60.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                      ),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () {
                                      if (materialCardEventRecord!
                                              .eventCommunityLink !=
                                          null) {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => Scaffold(
                                                appBar: AppBar(
                                                  title: Text(
                                                      'Event Community Link'),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent1,
                                                ),
                                                body: WebViewWidget(
                                                  controller:
                                                      new WebViewController()
                                                        ..setJavaScriptMode(
                                                            JavaScriptMode
                                                                .unrestricted)
                                                        ..setBackgroundColor(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground)
                                                        ..setNavigationDelegate(
                                                          NavigationDelegate(
                                                            onWebResourceError:
                                                                (WebResourceError
                                                                    error) {},
                                                            onNavigationRequest:
                                                                (NavigationRequest
                                                                    request) {
                                                              if (request.url
                                                                  .startsWith(
                                                                      'https://flutter.dev')) {
                                                                return NavigationDecision
                                                                    .prevent;
                                                              }
                                                              return NavigationDecision
                                                                  .navigate;
                                                            },
                                                          ),
                                                        )
                                                        ..loadRequest(Uri.parse(
                                                            materialCardEventRecord!
                                                                .eventFormLink
                                                                .toString())),
                                                )),
                                          ),
                                        );
                                      } else {
                                        // Handle the case where there is no community link
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                  'No community link available.')),
                                        );
                                      }
                                    },
                                    text: 'Join',
                                    options: FFButtonOptions(
                                      width: 144.0,
                                      height: 60.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Colors.white,
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
