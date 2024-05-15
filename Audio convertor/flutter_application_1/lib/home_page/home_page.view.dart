import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

RxString translatedText = ''.obs;
FlutterTts flutterTts = FlutterTts();
var lastWords = ''.obs;

var isListening = false.obs;

class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Obx(() => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: const Text(
                      'Recognized words:',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: GetX<SpeechController>(
                      init: SpeechController(),
                      builder: (controller) {
                        return Text(
                          controller.isListening.value
                              ? lastWords.value
                              : controller.speechEnabled.value
                                  ? 'Tap the microphone to start recording...'
                                  : 'Speech not available',
                        );
                      },
                    ),
                  ),
                  Text(translatedText.value),
                  const SizedBox(height: 50),
                  translatedText.isNotEmpty
                      ? InkWell(
                          onTap: () {
                            speak(translatedText.value);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              child: const Text(
                                'Play translated audio',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 249, 255, 203)),
                              )))
                      : Container()
                ],
              )),
        ),
      ),
      floatingActionButton: GetX<SpeechController>(
        builder: (controller) {
          return FloatingActionButton(
            onPressed: controller.isListening.value
                ? controller.stopListening
                : controller.startListening,
            tooltip: 'Listen',
            child: Icon(controller.isListening.value ? Icons.stop : Icons.mic),
          );
        },
      ),
    );
  }
}

class SpeechController extends GetxController {
  final SpeechToText speechToText = SpeechToText();
  var speechEnabled = false.obs;
  var isListening = false.obs;

  @override
  void onInit() {
    super.onInit();
    _initSpeech();
  }

  void _initSpeech() async {
    speechEnabled.value = await speechToText.initialize();
  }

  void startListening() async {
    isListening.value = true;
    await speechToText.listen(onResult: _onSpeechResult);
  }

  void stopListening() async {
    isListening.value = false;
    await speechToText.stop();
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    lastWords.value = result.recognizedWords;
    translateText(lastWords.value);
  }
}

translateText(String text) async {
  final translator = GoogleTranslator();
  var translation = await translator.translate(text, from: 'en', to: 'ta');
  translatedText.value = translation.text;
}

speak(String text) async {
  try {
    await flutterTts.setLanguage("ta-IN");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  } catch (e) {
    debugPrint("Error while speaking: $e");
  }
}
