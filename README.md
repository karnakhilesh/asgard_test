# Asgard

A new Flutter project.

## Getting Started

# Flutter Product Listing App

This Flutter application showcases a product listing with Google Maps integration, state management using GetX, and robust handling of internet connectivity and location services.

---

## Features

- Fetch and display a list of products from an API.
- Show product details including title, description, image, and distance from the user's current location.
- Integrate Google Maps for displaying product locations and viewing directions.
- Handle internet connectivity and show appropriate messages for network issues.
- Use state management with GetX for efficient state handling.

---

## Project Structure

```plaintext
lib/
├── main.dart                 # Entry point of the application
├── bindings/                 # Bindings for dependency injection
├── controllers/              # GetX controllers for managing state
├── models/                   # Data models for products
├── services/                 # API service for fetching data
├── errors/                   # Custom error exception and error messages
├── global-widgets/           # Reusable global-widgets like: AppBar & Typography
├── routes/                   # Routes for navigation screens
├── internationalization/     # Translation for text
├── theme/                    # App theme
├── views/                    # Screens and UI components
│   ├── products_view.dart              # List of produucts with google map in bottom view
│   ├── view_direction_screen.dart      # Google map with direction
│   ├── local-widgets/              # Reusable widgets
|       ├── no_product_error_widget.dart
│       ├── product_description_widget.dart
│       ├── product_distance_widget.dart
│       ├── product_image_widget.dart
│       ├── product_list_view_body_widget.dart
│       ├── product_title_widget.dart
│       ├── products_locations_on_google_map_widget.dart
│       ├── view_direction_button_widget.dart
│       ├── view_direction_google_map_body_widget.dart
└── utils/                                  # Utility functions and helpers
    ├── currency_utils.dart                 # Indian formatter numbers
    ├── device_size_utils.dart              # Get device width & height
    ├── overlay_and_orientations_util.dart  # Specifies the style to use for the system overlays

```

## Prerequisites

Install Flutter & Dart SDK: https://flutter.dev/
For this project we need:-
• Flutter version 3.27.1 on channel stable
• Dart version 3.6.0
• DevTools version 2.40.2

## Setup Instructions

1. Clone this repository:
   git clone https://github.com/your-username/your-repo-name.git
   cd your-repo-name

2. Install dependencies:
   flutter clean && flutter pub get

3. Add your Google Maps API key:
   . Update android/app/src/main/AndroidManifest.xml:
   <meta-data
   android:name="com.google.android.geo.API_KEY"
   android:value="YOUR_GOOGLE_MAPS_API_KEY" />

4. Run the application:
   flutter run

## Assumptions

The user grants location permissions when prompted.
The API endpoint used in this app ('https://h2gvbfqo6smwzaby6x7jinzujm0otrjt.lambda-url.eu-west-2.on.aws/').
Google Maps API key is correctly configured in the project.

## Dependencies

Flutter SDK: Latest stable version
GetX: State management
Google Maps Flutter: Map integration
http: For API calls

## Known Issues

If location permission is denied, map-related features won't work.
Ensure an active internet connection for fetching data and using maps.

## Contact

Name: Akhilesh Karn
Email: akhilesh.karn95@gmail.com
