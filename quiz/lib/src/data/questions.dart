import 'package:quiz/src/models/quiz_question_alternative_model.dart';
import 'package:quiz/src/models/quiz_question_model.dart';

const questions = [
  QuizQuestion(
    question: 'What are the main building blocks of Flutter UIs?',
    alternatives: QuizQuestionAlternatives(
      correctAlternative: 'Widgets',
      incorrectAlternatives: [
        'Components',
        'Blocks',
        'Functions',
      ],
    ),
  ),
  QuizQuestion(
    question: 'How are Flutter UIs built?',
    alternatives: QuizQuestionAlternatives(
      correctAlternative: 'By combining widgets in code',
      incorrectAlternatives: [
        'By combining widgets in a visual editor',
        'By defining widgets in config files',
        'By using XCode for iOS and Android Studio for Android',
      ],
    ),
  ),
  QuizQuestion(
    question: "What's the purpose of a StatefulWidget?",
    alternatives: QuizQuestionAlternatives(
      correctAlternative: 'Update UI as data changes',
      incorrectAlternatives: [
        'Update data as UI changes',
        'Ignore data changes',
        'Render UI that does not depend on data',
      ],
    ),
  ),
  QuizQuestion(
    question:
        'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
    alternatives: QuizQuestionAlternatives(
      correctAlternative: 'StatelessWidget',
      incorrectAlternatives: [
        'StatefulWidget',
        'Both are equally good',
        'None of the above',
      ],
    ),
  ),
  QuizQuestion(
    question: 'What happens if you change data in a StatelessWidget?',
    alternatives: QuizQuestionAlternatives(
      correctAlternative: 'The UI is not updated',
      incorrectAlternatives: [
        'The UI is updated',
        'The closest StatefulWidget is updated',
        'Any nested StatefulWidgets are updated',
      ],
    ),
  ),
  QuizQuestion(
    question: 'How should you update data inside of StatefulWidgets?',
    alternatives: QuizQuestionAlternatives(
      correctAlternative: 'By calling setState()',
      incorrectAlternatives: [
        'By calling updateData()',
        'By calling updateUI()',
        'By calling updateState()',
      ],
    ),
  ),
];
