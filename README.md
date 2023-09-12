<<<<<<< HEAD
# gpt_jr

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
=======
# Flutter AI Assistant with ChatGPT and DALL·E Integration

![App Demo](demo.gif)

## Overview

This Flutter application combines the power of conversational AI and image generation, offering a seamless and interactive user experience. Users can interact with the app through voice commands, which are converted to text using the Flutter Speech to Text plugin. The app then utilizes the ChatGPT API to provide natural language responses, making it an ideal tool for information retrieval and conversation.

In addition to text-based interactions, users can also instruct the application to create images using the DALL·E API. This integration enables on-the-fly image generation based on user input, adding a visually engaging dimension to the app.

## Features

- **Voice Interaction**: Use the microphone to ask questions or provide instructions, and the app will convert your speech to text for processing.

- **Conversational AI**: ChatGPT API powers the app's natural language understanding, enabling it to provide informative and contextually relevant responses.

- **Image Generation**: Request the app to generate images based on user input using the DALL·E API, creating visual representations of concepts and ideas.

- **Seamless User Experience**: The app combines voice recognition, language understanding, and image generation into a single, user-friendly interface.

## Getting Started

To get started with this Flutter app, follow these steps:

1. Clone the repository to your local machine.

2. Set up your ChatGPT and DALL·E API credentials in the `secrets.dart` file. Replace the placeholder `YOUR_API_KEY` with your actual API key.

3. Install the necessary dependencies using `flutter pub get`.

4. Run the app on your preferred Flutter-compatible device or simulator.

## Configuration

In the `secrets.dart` file, you can configure the API key for ChatGPT and DALL·E. Make sure to replace the placeholder `YOUR_API_KEY` with your actual API key.

```dart
class Secrets {
  static const openAIAPIKey = 'YOUR_OPENAI_API_KEY';
}

Contributing
We welcome contributions from the community! If you have ideas for improvements or new features, please open an issue or submit a pull request. See our Contributing Guidelines for more details.

Acknowledgments
Flutter: https://flutter.dev/
OpenAI ChatGPT API: https://beta.openai.com/
OpenAI DALL·E API: https://beta.openai.com/


This updated README clarifies that the API key should be configured in the `secrets.dart` file, and it provides instructions accordingly.
>>>>>>> 5df3107d7a708f43f4fc4e6904a63df39953996b
# GPT-Jr
