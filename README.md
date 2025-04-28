# Flutter Testing Concepts 🧪🎯

![CodeRabbit Pull Request Reviews](https://img.shields.io/coderabbit/prs/github/Peetee06/flutter-testing-concepts?utm_source=oss&utm_medium=github&utm_campaign=Peetee06%2Fflutter-testing-concepts&labelColor=171717&color=FF570A&link=https%3A%2F%2Fcoderabbit.ai&label=CodeRabbit+Reviews)
[![codecov](https://codecov.io/github/Peetee06/flutter-testing-concepts/graph/badge.svg?token=OLSRHUU808)](https://codecov.io/github/Peetee06/flutter-testing-concepts)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

This repository showcases practical examples of Flutter testing concepts, aiming to empower developers to embrace Test-Driven Development (TDD) 💡. It provides hands-on examples for building a simple Flutter application with 100% test coverage using unit, widget, and integration tests.

## Why Test? 🤔

Writing tests might seem like extra work, but it offers significant benefits:

* **Confidence:** Ensures your app works as expected and prevents regressions (breaking existing features) when you make changes.
* **Better Design:** Thinking about how to test your code often leads to more modular and maintainable designs.
* **Clearer Requirements (especially when using AI):** Tests act as executable specifications. Writing tests first (TDD) helps clarify requirements, which can lead to more accurate results, even when using AI code generation tools. Tests confirm the AI understood the task correctly.
* **Collaboration:** Tests serve as documentation for how components are supposed to behave.

## Who is this Repository For? 👥

This repository is designed for a wide range of Flutter developers:

* **AI-assisted Coders ("Vibe Coders"):** If you leverage AI for development, understanding testing basics can help you guide the AI more effectively and verify its output. Start with the basic Widget Testing examples!
* **Junior Developers:** New to Flutter or testing? Find simple, clear examples of unit and widget tests to get started. Look for the "Getting Started" pointers below.
* **Experienced Flutter Developers (New to Testing):** Comfortable with Flutter but want to add testing to your skill set? Explore practical examples for testing state management (BLoC/Cubit, Riverpod), routing, and mocking dependencies.
* **Experienced Testers:** Already familiar with Flutter testing? Discover different approaches, review patterns, and consider contributing your expertise!

## Getting Started 🚀

Follow these steps to get the project running locally and execute the tests:

**1. Prerequisites:**

* Ensure you have `fvm` or the [Flutter SDK](https://docs.flutter.dev/get-started/install) version 3.29.x installed on your system.

**2. Clone the Repository:**

   ```bash
   git clone https://github.com/Peetee06/flutter-testing-concepts.git
   cd flutter-testing-concepts
   ```

**3. Choose an App & Install Dependencies:**
   Navigate into the directory of the app implementation you'd like to explore (`bloc_app` or `riverpod_app`) and fetch the dependencies.

   *For the BLoC/Cubit version:*

   ```bash
   cd bloc_app
   flutter pub get
   ```

   *For the Riverpod version:*

   ```bash
   cd riverpod_app
   flutter pub get 
   ```

**4. Run Tests:**

* **Unit & Widget Tests:** Run all tests within the `test` directory (Make sure you are inside the `bloc_app` or `riverpod_app` directory):

  ```bash
  flutter test
  ```

* **Integration Tests:** Run the end-to-end tests located in the `integration_test` directory. You may need a running simulator/emulator or a connected device (Make sure you are inside the `bloc_app` or `riverpod_app` directory).

  ```bash
  flutter test integration_test
  ```

Now you're ready to explore the code and run the various test examples!

## Repository Structure 📁

The repository contains two implementations of the same sample application, each utilizing a different state management solution:

* `bloc_app/`: An implementation using the BLoC/Cubit pattern for state management 🧱.
* `riverpod_app/`: An implementation using Riverpod for state management 💧.

Both applications demonstrate comprehensive testing strategies relevant to their respective state management approaches.

## Key Testing Examples ✅🔬

This section highlights specific testing scenarios demonstrated within the repository. Don't worry if some concepts seem advanced at first; start with the basics!

### `bloc_app` (BLoC/Cubit)

* **Getting Started - Simple Unit Test:**
  * [Concepts Cubit Test](bloc_app/test/features/concepts/cubit/concepts_cubit_test.dart): See how to test basic state changes in a Cubit.
* **Unit Testing (Cubits) 🧩:** Examples of testing business logic within Cubits, including state emissions and dependency mocking.
  * [Concept Details Cubit Test](bloc_app/test/features/concept/cubit/concept_cubit_test.dart)
* **Getting Started - Simple Widget Test:**
  * [Common Widgets Test](bloc_app/test/common/widgets/app_bar_test.dart): Check if a simple widget displays the correct text.
* **Widget Testing (Pages/Widgets) 🖼️:** Demonstrations of testing UI components, interactions (like button taps), and how widgets react to state changes.
  * [Concepts Page Test](bloc_app/test/features/concepts/view/concepts_page_test.dart) (Includes testing loading states, list views, and finding specific widgets)
  * [Concept Details Page Test](bloc_app/test/features/concept/view/concept_page_test.dart) (Includes testing widget presence based on state)
  * [Testing `onPressed` Callbacks](bloc_app/test/features/challenges/challenge/view/widgets/answer_button_test.dart) (Verify button taps trigger actions)
* **Routing (go_router) 🗺️:** How to test navigation logic managed by `go_router`. Essential for multi-screen apps.
  * [GoRouter Configuration Test](bloc_app/test/routing/go_router_test.dart)
  * [Concept Route Test](bloc_app/test/features/concept/concept_route_test.dart) (Testing specific route presentation and interaction)
* **Mocking 🎭:** Usage of `mocktail` for creating mock ("fake") dependencies (like API clients or repositories) in tests. Crucial for isolating the code you want to test.
  * [Mock Definitions](bloc_app/test/mocks.dart)
  * (See various unit and widget tests for usage examples, e.g., Cubit tests)
* **Setup and Teardown ⚙️:** Examples of using `setUp`, `tearDown`, `setUpAll`, and `tearDownAll` for setting up test conditions and cleaning up afterward.
  * (Visible in most `_test.dart` files, e.g., [Concepts Page Test](bloc_app/test/features/concepts/view/concepts_page_test.dart))
* **Integration Testing 🔗🚀:** End-to-end tests covering user flows across multiple screens, simulating real user interaction. These are great for verifying critical paths in your app.
  * [App Integration Test](bloc_app/integration_test/app_test.dart)

### `riverpod_app` (Riverpod)

* **Unit Testing (Providers/Notifiers) 🧩:** Examples of testing Riverpod providers and notifiers, including state emissions, dependency mocking, and asynchronous operations.
  * [Concepts Notifier Test](riverpod_app/test/features/concepts/concepts_notifier_test.dart): Test basic asynchronous state fetching.
  * [Concept Notifier Test](riverpod_app/test/features/concept/concept_notifier_test.dart): Test a notifier dependent on parameters (`FamilyAsyncNotifier`).
  * [Challenges Notifier Test](riverpod_app/test/features/challenges/challenges_notifier_test.dart): Test a more complex state machine using `AsyncNotifier`.
* **Widget Testing (Pages/Widgets) 🖼️:** Demonstrations of testing UI components that interact with Riverpod providers, including overriding providers for test scenarios and verifying UI based on state.
  * [Concepts View Test](riverpod_app/test/features/concepts/view/concepts_view_test.dart): Test list rendering, loading/error states, and navigation triggered by provider state.
  * [Concept View Test](riverpod_app/test/features/concept/view/concept_view_test.dart): Test widget rendering based on provider state and interactions within the view.
  * [Challenge Card Test](riverpod_app/test/features/challenges/view/widgets/challenge_card_test.dart): Test interaction within a specific widget and how it affects provider state.
  * [PumpApp Helper](riverpod_app/test/helpers/pump_app.dart): Helper extension for wrapping widgets in `ProviderScope` and `MaterialApp` for testing.
* **Routing (go_router with Providers) 🗺️:** Testing navigation managed by `go_router` where routes might depend on Riverpod providers.
  * [Concept Route Test](riverpod_app/test/features/concept/concept_route_test.dart): Test that the correct view is rendered for a specific route and that providers are correctly overridden/accessed within the route's widget.
  * [Challenges Route Test](riverpod_app/test/features/challenges/challenges_route_test.dart): Similar example for the challenges route.
* **Mocking 🎭:** Usage of `mockito` (via build_runner) for creating mock dependencies (like repositories or services) used within providers.
  * [Mock Definitions](riverpod_app/test/mocks.dart)
  * [Mock Generation Command](riverpod_app/build.yaml) (Configuration for `build_runner`)
  * (See various notifier and repository tests for usage examples)
* **Integration Testing 🔗🚀:** End-to-end tests simulating user flows through the Riverpod app, ensuring different features connected via providers and routing work together correctly.
  * [App Integration Test](riverpod_app/integration_test/app_test.dart): Covers navigating from the concepts list, through concept details, to challenges, and back.

---

## Contributing & Questions 🤔💡

This repository aims to be a community resource! Contributions are highly welcome.

* **Questions & Suggestions:** Got questions, spotted an error, or have ideas for more testing concepts to cover? Please **[open an issue](https://github.com/Peetee06/flutter-testing-concepts/issues/new)**!
* **Improving Examples:** See a way to make existing tests clearer or more effective? Suggestions and Pull Requests are welcome.
* **Sharing Knowledge:** Experienced testers, feel free to share best practices or suggest advanced patterns via issues or discussions.

Your feedback and contributions help improve this resource for everyone.

## Connect

You can also connect with me on [LinkedIn](https://www.linkedin.com/in/peter-trost-595a27173/) if you have other questions or just want to chat! Always happy to help. 🤝
