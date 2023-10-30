import 'package:event_assistant_app/components/create_event_new_widget.dart';

import '../backend/backend.dart';
import '../backend/EventsDataLocal.dart';
import '../event_list/event_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'event_list_model.dart';
export 'event_list_model.dart';

class EventListWidget extends StatefulWidget {
  const EventListWidget({Key? key}) : super(key: key);

  @override
  _EventListWidgetState createState() => _EventListWidgetState();
}

class _EventListWidgetState extends State<EventListWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  DateTime _selectedDay = DateTime.now();

  //Variables Declaration
  late EventListModel _model;
  late final DateTime kToday;
  late final DateTime kFirstDay;
  late final DateTime kLastDay;
  late ValueNotifier<DateTime> _selectedDate;
  //Events Data
  List<Event> test1 = [
    Event(
      event_id: '1',
      event_name: 'event_1',
      event_description: 'Description for e1',
      event_date: DateTime.now().subtract(Duration(days: 1)),
      event_club_name: 'Club A',
      event_admin_id: 'admin123',
    ),
  ];
  Set<String> pinnedEventIds = {};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventListModel());

    // Initialize the selected date to the current date
    _selectedDate = ValueNotifier(DateTime.now());

    //Variables Definition
    kToday = DateTime.now();
    kFirstDay =
        DateTime(DateTime.now().year - 1, 1, 1); // Show dates from 1 year ago
    kLastDay = DateTime(DateTime.now().year + 1, 12,
        31); // Show dates up to 1 year in the future
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Event List',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 36.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 1.0,
              height: MediaQuery.of(context).size.height * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondary,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  StreamBuilder<List<EventRecord>>(
                    stream: queryEventRecord(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      final eventRecords = snapshot.data!;
                      return TableCalendar(
                        focusedDay: DateTime.now(),
                        firstDay: kFirstDay,
                        lastDay: kLastDay,
                        eventLoader: (day) {
                          return eventRecords
                              .where(
                                  (event) => isSameDay(event.eventDate!, day))
                              .toList();
                        },
                        calendarStyle: CalendarStyle(
                          outsideDaysVisible: false,
                          selectedDecoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent1,
                            shape: BoxShape.circle,
                          ),
                        ),
                        selectedDayPredicate: (day) {
                          return isSameDay(_selectedDay, day);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            _selectedDay = selectedDay;
                          });
                        },
                      );
                    },
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Events",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent1,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          width: 76.0, // adjust the width to prevent overflow
                          child: IconButton(
                            onPressed: () async {
                              // Show Create Event Component
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                useSafeArea: true,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: Container(
                                        height: double.infinity,
                                        child: CreateEventNewWidget(),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                            icon: Row(
                              children: [
                                Icon(Icons.add),
                                SizedBox(width: 4.0),
                                Text(
                                  "Add",
                                  style: TextStyle(
                                      color:
                                          FlutterFlowTheme.of(context).accent2),
                                ),
                              ],
                            ),
                            tooltip: "Add",
                            color: FlutterFlowTheme.of(context).accent2,
                            splashColor: FlutterFlowTheme.of(context).accent2,
                            highlightColor:
                                FlutterFlowTheme.of(context).secondary,
                            padding: EdgeInsets.all(8.0),
                            iconSize: 22.0,
                            constraints: BoxConstraints(),
                            disabledColor: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<List<EventRecord>>(
                      stream: queryEventRecord(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        final eventRecords = snapshot.data!;
                        final eventsOnSelectedDay = eventRecords
                            .where((event) =>
                                isSameDay(event.eventDate, _selectedDay))
                            .toList();
                        return ListView.builder(
                          itemCount: eventsOnSelectedDay.length,
                          itemBuilder: (context, index) {
                            final event = eventsOnSelectedDay[index];
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Container(
                                // Wrap the ListTile with a Container or any other widget
                                child: ListTile(
                                  title: Text(event.eventName.toString()),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        DateFormat.jm()
                                                .format(event.eventDate!) +
                                            " | " +
                                            DateFormat('dd MMM yy')
                                                .format(event.eventDate!),
                                      ),
                                    ],
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        pinnedEventIds.contains(event.eventId)
                                            ? Icons.push_pin
                                            : Icons.push_pin_outlined,
                                        color: pinnedEventIds
                                                .contains(event.eventId)
                                            ? Colors.blue
                                            : Colors.grey,
                                      ),
                                      SizedBox(width: 8.0),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            if (pinnedEventIds
                                                .contains(event.eventId)) {
                                              pinnedEventIds
                                                  .remove(event.eventId);
                                            } else {
                                              pinnedEventIds
                                                  .add(event.eventId);
                                            }
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            Icon(Icons.how_to_reg),
                                            SizedBox(width: 4.0),
                                            Text(
                                              "Join",
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent2,
                                              ),
                                            ),
                                          ],
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: FlutterFlowTheme.of(context)
                                              .accent1,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
