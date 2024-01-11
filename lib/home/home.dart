import 'package:flutter/material.dart';
import 'package:sabak15_quize_app/app/constant/app_colors.dart';
import 'package:sabak15_quize_app/app/constant/app_text_styles.dart';
import 'package:sabak15_quize_app/app/constant/texts.dart';
import 'package:sabak15_quize_app/use_file.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UseQuize useQuize = UseQuize();

  List<Icon> iconAluu = [];

  void teksher(bool koldonuu) {
    bool correctAnswer = useQuize.joopAluu();
    setState(() {
      if (useQuize.isFinished() == true) {
        showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Тест QuizeApp'),
              content: const SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Сиздин тест аягына келип жетти'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Жок'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Ооба'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
        useQuize.indexZero();
        iconAluu = [];
      } else {
        if (correctAnswer == koldonuu) {
          iconAluu.add(const Icon(
            Icons.check,
            color: AppColors.trueBgColor,
          ));
        } else {
          iconAluu.add(const Icon(
            Icons.close,
            color: AppColors.falseBgColor,
          ));
        }
        useQuize.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: const Center(
          child: Text(
            'Тапшырма 7',
            style: AppTextStyles.appBarTextStyle,
          ),
        ),
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                useQuize.surooAluu(),
                style: AppTextStyles.appTextStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 102,
              ),
              SizedBox(
                width: 335,
                height: 70,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.trueBgColor,
                  ),
                  onPressed: () {
                    setState(() {
                      teksher(true);
                    });
                  },
                  child: const Text(
                    AppTexts.tuura,
                    style: AppTextStyles.trueStyle,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 335,
                height: 70,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.falseBgColor,
                  ),
                  onPressed: () {
                    teksher(false);
                  },
                  child: const Text(
                    AppTexts.tuuraEmes,
                    style: AppTextStyles.trueStyle,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: iconAluu.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return iconAluu[index];
                    }),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
