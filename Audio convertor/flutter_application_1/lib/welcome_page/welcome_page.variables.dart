import 'package:get/get.dart';

mixin WelcomePageVariables {
  RxString selectedLanguage = 'English'.obs;
  RxString email = ''.obs;
  Map value = {
    "Question ID": 1,
    "Pair ID": 1,
    "Question Type": "Importance",
    "Topic Name EN": "Acceptance",
    "Topic Statement EN":
        "“I distinguish my capacity to recognise factors beyond my control from my ability to intellectually pinpoint the reasons for such limitations, understanding that true acceptance hinges on cognitive comprehension rather than emotional reactions.",
    "Topic Name JP": "受容性",
    "Topic Statement JP":
        "私はコントロールできない要因を見分ける能力と、理知的に制限の理由を突き止める能力を区別し、「真の受容性」とは感情的な反応ではなく、認知的な理解力によるものだとわかっている。",
    "Question Text EN": "How important is it that I achieve this?",
    "Question Text JP": "これを達成することが、私自身にとってどれほど重要ですか？",
    "En_choice": [
      {"id": 1, "value": "Not a Priority"},
      {"id": 2, "value": "Low Priority"},
      {"id": 3, "value": "Priority"},
      {"id": 4, "value": "High Priority"},
      {"id": 5, "value": "Critical"},
    ],
    "Jp_choice": [
      {"id": 1, "value": "優先ではない"},
      {"id": 2, "value": "低い優先度"},
      {"id": 3, "value": "通常の優先度"},
      {"id": 4, "value": "高い優先度"},
      {"id": 5, "value": "最高の優先度"},
    ],
    "Choice 1 EN": "Not a Priority",
    "Choice 2 EN": "Low Priority",
    "Choice 3 EN": "Priority",
    "Choice 4 EN": "High Priority",
    "Choice 5 EN": "Critical",
    "Choice 1 JP": "優先ではない",
    "Choice 2 JP": "低い優先度",
    "Choice 3 JP": "通常の優先度",
    "Choice 4 JP": "高い優先度",
    "Choice 5 JP": "最高の優先度"
  };
}
