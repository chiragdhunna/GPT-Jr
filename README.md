<h1 align="center" id="title">GPT Jr</h1>

![GPT-Jr](https://socialify.git.ci/chiragdhunna/GPT-Jr/image?description=1&font=Source%20Code%20Pro&forks=1&issues=1&language=1&name=1&owner=1&pattern=Solid&pulls=1&stargazers=1&theme=Auto)

<p id="description">This Flutter application combines the power of conversational AI and image generation, offering a seamless and interactive user experience. Users can interact with the app through voice commands, which are converted to text using the Flutter Speech to Text plugin. The app then utilizes the ChatGPT API to provide natural language responses, making it an ideal tool for information retrieval and conversation. Additionally, users can instruct the application to create images using the DALL·E API, adding a visually engaging dimension to the app.</p>

<h2>Demo</h2>

<video  height="240" controls>
  <source src="demo/demo.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>

<h2>🧐 Features</h2>

Here are some of the project's best features:

- 🎤 **Voice Interaction**: Use the microphone to ask questions or provide instructions, and the app will convert your speech to text for processing.
- 🧠 **Conversational AI**: ChatGPT API powers the app's natural language understanding, enabling it to provide informative and contextually relevant responses.
- 🖼️ **Image Generation**: Request the app to generate images based on user input using the DALL·E API, creating visual representations of concepts and ideas.
- 💡 **Seamless User Experience**: The app combines voice recognition, language understanding, and image generation into a single, user-friendly interface.

<h2>💻 Built with</h2>

Technologies used in the project:

### Frontend Stack

- [Flutter](https://flutter.dev/)

### Backend & APIs

- [OpenAI ChatGPT API](https://beta.openai.com/)
- [OpenAI DALL·E API](https://beta.openai.com/)

<h2>Getting Started</h2>

### Prerequisites:

Before you begin, ensure you have the following software installed:

- [Flutter](https://flutter.dev/docs/get-started/install)

### Installation:

1. **Clone the repository**:

   ```sh
   git clone https://github.com/yourusername/gpt-jr.git
   ```

2. **Navigate to the project directory**:

   ```sh
   cd gpt-jr
   ```

3. **Set up your ChatGPT and DALL·E API credentials in the `secrets.dart` file**:

   ```dart
   class Secrets {
     static const openAIAPIKey = 'YOUR_OPENAI_API_KEY';
   }
   ```

4. **Install the necessary dependencies**:

   ```sh
   flutter pub get
   ```

5. **Run the app on your preferred Flutter-compatible device or simulator**:
   ```sh
   flutter run
   ```

<h2>Configuration</h2>

In the `secrets.dart` file, you can configure the API key for ChatGPT and DALL·E. Make sure to replace the placeholder `YOUR_OPENAI_API_KEY` with your actual API key.

<h2>Contributing</h2>

We welcome contributions from the community! If you have ideas for improvements or new features, please open an issue or submit a pull request. See our Contributing Guidelines for more details.

<h2>Acknowledgments</h2>

- [Flutter](https://flutter.dev/)
- [OpenAI ChatGPT API](https://beta.openai.com/)
- [OpenAI DALL·E API](https://beta.openai.com/)
