import '../backend/backend.dart';
import '../backend/PinnedEvents.dart';
import '../backend/schema/event_record.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime _selectedDay = DateTime.now();
  List<PinnedEvent> pinnedEvents = [];
  List<String> pinnedEventIds = [];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // Initialize the selected date to the current date
    _selectedDay = DateTime.now();

    // Fetch pinned events and add them to the list
    fetchPinnedEvents();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  // Method to fetch pinned events from Firebase and add them to the list
  void fetchPinnedEvents() {
    // Replace this with the actual query or method to fetch pinned event IDs from Firebase
    List<String> fetchedEventIds = [
      '1',
      '2',
    ];

    setState(() {
      pinnedEventIds = fetchedEventIds;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primary,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        title: Text(
          'Welcome userName',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Outfit',
                color: FlutterFlowTheme.of(context).secondaryText,
                fontSize: 24.0,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.931,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Upcoming Events',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 36.0,
                              ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: MediaQuery.of(context).size.height *
                              0.8, // Adjusted height
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondary,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: StreamBuilder<List<EventRecord>>(
                            stream: queryEventRecord(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              final eventRecords = snapshot.data!;

                              // Sort the eventRecords based on the pin status
                              eventRecords.sort((a, b) {
                                bool aPinned =
                                    pinnedEventIds.contains(a.eventId ?? '');
                                bool bPinned =
                                    pinnedEventIds.contains(b.eventId ?? '');
                                if (aPinned && !bPinned) {
                                  return -1; // a is pinned, b is not pinned => a should come first
                                } else if (!aPinned && bPinned) {
                                  return 1; // b is pinned, a is not pinned => b should come first
                                } else {
                                  return 0; // both are either pinned or not pinned => maintain their original order
                                }
                              });

                              return DataTable(
                                columns: <DataColumn>[
                                  DataColumn(
                                    label: Icon(Icons.push_pin),
                                    onSort: (columnIndex, ascending) {
                                      // Add code here for sorting events based on pin status
                                    },
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Date',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Event',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Organisation',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                                rows: eventRecords.map((eventRecord) {
                                  bool isPinned = pinnedEventIds
                                      .contains(eventRecord.eventId ?? '');
                                  return DataRow(
                                    cells: <DataCell>[
                                      DataCell(
                                        IconButton(
                                          icon: Icon(
                                            isPinned
                                                ? Icons.push_pin
                                                : Icons.push_pin_outlined,
                                            color: isPinned
                                                ? Colors.blue
                                                : Colors.grey,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              if (isPinned) {
                                                pinnedEventIds.remove(
                                                    eventRecord.eventId!);
                                              } else {
                                                pinnedEventIds
                                                    .add(eventRecord.eventId!);
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                      DataCell(
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              DateFormat('dd MMM yy').format(
                                                eventRecord.eventDate ??
                                                    DateTime.now(),
                                              ),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              DateFormat('h:mm a').format(
                                                eventRecord.eventDate ??
                                                    DateTime.now(),
                                              ),
                                              style: TextStyle(fontSize: 15),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                      DataCell(Text(
                                          eventRecord.eventName.toString())),
                                      DataCell(Text(eventRecord.eventClubName
                                          .toString())),
                                    ],
                                  );
                                }).toList(),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
