# Architect - Flutter Clean Architecture Project

## 📌 Overview
This project is a practical implementation of **Clean Architecture** in Flutter. The main goal is to showcase how to build a scalable and maintainable mobile application by separating the code into independent layers.

## 🏗️ Architecture Layers

### 1. Domain Layer (Core)
The inner-most layer, containing the "Heart" of the application.
- **Entities:** Simple business objects.
- **Use Cases:** Application-specific business rules.
- **Repository Interfaces:** Contracts for data operations.

### 2. Data Layer
Responsible for data retrieval from various sources.
- **Models:** Data transfer objects (JSON conversion).
- **Repositories Implementation:** Implementing the contracts from the Domain layer.
- **Data Sources:** Remote (APIs) and Local (Databases/Caches).

### 3. Presentation Layer
The UI and State Management layer.
- **State Management:** (  Riverpod, ).
- **UI Widgets & Pages:** Pure Flutter widgets that observe the state.

## 🚀 Key Features
- **Decoupling:** Business logic is isolated from the UI and Framework.
- **Dependency Injection:** Using  `riverpod` for managing dependencies.
- **Error Handling:** Centralized failure handling using the `Either` type (Dartz).
- **Testability:** Each layer can be unit tested independently.

## 🛠️ Tech Stack
- **Framework:** [Flutter](https://flutter.dev)
- **State Management:** [Riverpod]
- **Networking:** [ Dio or Http]
- **Functional Programming:** [ Dartz]
- **Service Locator:** [ Get_it]

## 📂 Folder Structure
```text
lib/
 ├── core/              # Shared utilities and base classes
 ├── features/
 │   └── feature_name/
 │       ├── data/      # Models, Repositories, Data Sources
 │       ├── domain/    # Entities, Use Cases, Repository Interfaces
 │       └── presentation/ # UI and State Management
 └── main.dart