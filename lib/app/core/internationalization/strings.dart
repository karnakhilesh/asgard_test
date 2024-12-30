// ignore_for_file: non_constant_identifier_names

import 'package:asgard/app/core/errors/errors.dart';
import 'package:asgard/app/core/internationalization/internationalization.dart';

class AsgardCoreStrings implements AsgardInternationalization {
  @override
  Map<String, String> en_US = {
    "asg_asgardAppStr": "Asgard App",
    "asg_productsStr": "Products",
    "asg_viewDirectionsStr": "View Directions",
    "asg_somethingWentWrongStr": "Something went wrong!",
    "asg_tryAgainStr": "Try Again",
    "asg_serviceTemporarilyUnavailableStr": serviceTemporarilyUnavailable,
    "asg_networkExceptionMessageStr": networkExceptionMessage,
    "asg_errorFetchingLocationStr": "Error fetching location",
    "asg_makeSureLocationTurnedOnStr":
        "Make sure Location Services is turned on in your Settings app.",
    "asg_needToAllowLocationStr":
        'You must grant "Location" permission to use this service.',
  };
}
