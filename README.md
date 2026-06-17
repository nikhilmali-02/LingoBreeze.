\# LingoBreeze



LingoBreeze is a vocabulary management app built with Flutter, Firebase Firestore, and a simple Node.js backend.



\## Features

\- Fetch vocabulary words from a Node.js REST API

\- Save words to Firebase Firestore

\- View saved words in a clean Flutter UI

\- Add new words using a bottom sheet form

\- State management using flutter\_bloc



\## Tech Stack

\- Flutter

\- Dart

\- flutter\_bloc

\- Firebase Core

\- Cloud Firestore

\- Node.js

\- Express.js

\- CORS



\## Project Structure

\- `backend/` - Express server with `GET /words`

\- `flutter\_app/` - Flutter application



\## Backend Setup

```bash

cd backend

npm install

node index.js

```



The backend runs on `http://localhost:3000`.



\## Flutter Setup

```bash

cd flutter\_app

flutter pub get

flutter run

```



\## Firebase Setup

This project uses Firebase Firestore. Add your own Firebase configuration if needed.



\## API Note

When running on Android emulator, the Flutter app accesses the local backend using `10.0.2.2:3000`.



\## Screenshots

Add app screenshots here before submission.



\## Author

Nikhil Mali

