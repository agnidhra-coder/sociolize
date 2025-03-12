# Sociolize - Flutter Social Media App

## Overview

Sociolize is a Flutter-based social media application that displays recent posts. It leverages the Bloc architecture for state management, fetches data from a remote API, and presents the posts in a user-friendly interface.

## Key Features

*   **Display of Recent Posts:** Fetches and displays a list of recent posts from an API.
*   **Pull-to-Refresh:** Implements a pull-to-refresh mechanism to reload the latest posts.
*   **Loading and Error Handling:** Provides loading indicators and error messages for a smooth user experience.
*   **Bloc State Management:** Uses the Bloc pattern for efficient state management.

## Technologies Used

*   **Flutter:**  A UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
*   **Dart:**  The programming language used to build Flutter apps.
*   **Bloc:**  A predictable state management library that helps implement the BLoC (Business Logic Component) design pattern.
*   **`flutter_bloc`:** A Flutter package that provides widgets for implementing the Bloc pattern.
*   **`google_fonts`:**  A Flutter package to use fonts from Google Fonts.
*   **`http` :**  Using the `http` package for making network requests.

## Architecture

The app follows a layered architecture:

*   **Presentation Layer:**  Contains the UI components (widgets) and handles user interactions (`posts_page.dart`).  Uses `BlocBuilder` to react to state changes.
*   **Business Logic Layer (BloC):**  Manages the application's state and business logic (`PostsBloc`, `PostsEvent`, `PostsState`).
*   **Domain Layer:**  Defines the use cases (`FetchPostsUseCase`).
*   **Data Layer:**  Handles data retrieval from remote or local sources (`PostsRepositoryImpl`, `PostsRemoteDataSource`).


## Getting Started


### Installation

1.  **Clone the repository:**

    ```
    git clone <repository_url>
    cd sociolize
    ```

2.  **Get dependencies:**

    ```
    flutter pub get
    ```

### Running the App

1.  **Connect a device or start an emulator.**

2.  **Run the app:**

    ```
    flutter run
    ```

## Configuration

*   **API Endpoint:**  The API endpoint for fetching posts is defined within `posts_remote_data_source.dart`. You'll need to configure this endpoint to point to your desired API.



## Credits

*   Developed by **Agnidhra**
*   Uses the following open-source libraries:
    *   Flutter
    *   Dart
    *   `flutter_bloc`
    *   `google_fonts`