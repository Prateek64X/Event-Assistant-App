import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'create_event_new_widget.dart' show CreateEventNewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateEventNewModel extends FlutterFlowModel<CreateEventNewWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for EventName-TextField widget.
  FocusNode? eventNameTextFieldFocusNode;
  TextEditingController? eventNameTextFieldController;
  String? Function(BuildContext, String?)?
  eventNameTextFieldControllerValidator;
  String? _eventNameTextFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for EvenDetails-TextField widget.
  FocusNode? evenDetailsTextFieldFocusNode;
  TextEditingController? evenDetailsTextFieldController;
  String? Function(BuildContext, String?)?
  evenDetailsTextFieldControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for ClubName-DropDown widget.
  String? clubNameDropDownValue;
  FormFieldController<String>? clubNameDropDownValueController;
  // State field(s) for EventFormLink-TextField widget.
  FocusNode? eventFormLinkTextFieldFocusNode;
  TextEditingController? eventFormLinkTextFieldController;
  String? Function(BuildContext, String?)?
  eventFormLinkTextFieldControllerValidator;
  // State field(s) for EventCommunityLink-TextField widget.
  FocusNode? eventCommunityLinkTextFieldFocusNode;
  TextEditingController? eventCommunityLinkTextFieldController;
  String? Function(BuildContext, String?)?
      eventCommunityLinkTextFieldControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    eventNameTextFieldControllerValidator =
        _eventNameTextFieldControllerValidator;
  }

  void dispose() {
    eventNameTextFieldFocusNode?.dispose();
    eventNameTextFieldController?.dispose();

    evenDetailsTextFieldFocusNode?.dispose();
    evenDetailsTextFieldController?.dispose();

    eventFormLinkTextFieldFocusNode?.dispose();
    eventFormLinkTextFieldController?.dispose();

    eventCommunityLinkTextFieldFocusNode?.dispose();
    eventCommunityLinkTextFieldController?.dispose();
  }

/// Action blocks are added here.

/// Additional helper methods are added here.
}
