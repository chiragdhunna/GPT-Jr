import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:gpt_jr/feauture_box.dart';
import 'package:gpt_jr/openap_service.dart';
import 'package:gpt_jr/pallete.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final speechToText = SpeechToText();
  final FlutterTts flutterTts = FlutterTts();
  String lastWords = '';
  final OpenAIService openAIService = OpenAIService();
  String? generatedContent;
  String? generatedImageUrl;
  int start = 200;
  int delay = 200;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSpeechToText();
    initTextToSpeech();
  }

  Future<void> initTextToSpeech() async{
    await flutterTts.setSharedInstance(true);
    setState(() {
      
    });
  }

  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {
      
    });
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  Future<void> systemSpeak(String content) async{
    await flutterTts.speak(content);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    speechToText.stop();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar with title and Icon
      appBar: AppBar(
        centerTitle: true,
        title: BounceInDown(child: const Text('GPT Jr.')),
        leading: const Icon(Icons.menu),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          
            // Virtual Assitant Image with Circular Container Background
          
            ZoomIn(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 120,
                      width: 120,
                      margin: const EdgeInsets.only(top:4),
                      decoration: const BoxDecoration(
                        color: Pallete.assistantCircleColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Container(
                    height: 123,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage('assets/images/virtualAssistant.png'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          
            // Container with Greeting Text
            FadeInRight(
              child: Visibility(
                visible: generatedImageUrl==null,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 30).copyWith(
                    top: 30,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Pallete.borderColor,
                    ),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,),
                    child: Text(
                      generatedContent==null?'Good Morning, what task can I do for you?':generatedContent!,
                    style: TextStyle(
                      color: Pallete.mainFontColor,
                      fontSize: generatedContent==null?25:18,
                      fontFamily: 'Cera Pro',
                    ),),
                  ),
                ),
              ),
            ),
          
            // Generated Image
            if(generatedImageUrl!=null) Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(generatedImageUrl!)),
            ),

            // Recommendation Text
          
            SlideInLeft(
              child: Visibility(
                visible: generatedContent==null && generatedImageUrl==null,
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 10,left: 22),
                  child: const Text('Here are a few features',
                  style: TextStyle(
                    fontFamily: 'Cera Pro',
                    color: Pallete.mainFontColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),
              ),
            ),
          
            // Feautres List
            Visibility(
              visible: generatedContent==null && generatedImageUrl==null,
              child: Column(
                children: [
                  SlideInLeft(
                    delay: Duration(milliseconds: start),
                    child: const FeatureBox(
                      color: Pallete.firstSuggestionBoxColor, 
                      headerText: 'Chat GPT', 
                      descriptionText: 'A smart way to stay organise and informed with ChatGPT',),
                  ),
                  SlideInLeft(
                    delay: Duration(milliseconds: start + delay),
                    child: const FeatureBox(
                      color: Pallete.secondSuggestionBoxColor, 
                      headerText: 'DALL-E', 
                      descriptionText: 'Get inspired and stay creative with your personal assistant powered by Dall-E',),
                  ),
                  SlideInLeft(
                    delay: Duration(milliseconds: start + 2*delay),
                    child: const FeatureBox(
                      color: Pallete.thirdSuggestionBoxColor, 
                      headerText: 'Smart Voice Assistant', 
                      descriptionText: 'Get the best of both worlds with a voice assistant powered by Dall-E and ChatGPT',),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ZoomIn(
        delay: Duration(milliseconds: start + 3*delay),
        child: FloatingActionButton(
          onPressed: () async{
            if(await speechToText.hasPermission && speechToText.isNotListening){
              await startListening();
            }else if(speechToText.isListening){
              final speech = await openAIService.isArtPromptAPI(lastWords);
              // print(speech);
              if(speech.contains('https')){
                generatedImageUrl = speech;
                generatedContent = null;
                setState(() {
                  
                });
              }else{
                generatedImageUrl = null;
                generatedContent = speech;
                setState(() {
                  
                });
                await systemSpeak(speech);
              }
              await stopListening();
            }else{
              initSpeechToText();
            }
      
            // print(lastWords);
          },
        backgroundColor: Pallete.firstSuggestionBoxColor,
        child: Icon(
          speechToText.isListening? Icons.mic_off:Icons.mic),
          ),
      ),
    );
  }
}