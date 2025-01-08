import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_bloc_tutorial/config/components/round_button.dart';

class InternetExceptionWidget extends StatelessWidget {
  final VoidCallback onPress;
  const InternetExceptionWidget({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            height: MediaQuery.sizeOf(context).height * .15,
            child: const Icon(
              Icons.cloud_off,
              size: 50,
              color: Colors.red,
            )),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 0, right: 10),
          child: Center(
            child: Text(
              "We are unable to show results. \nPlease check your data \nconnection.",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 20),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        RoundButton(
            btnColor: Colors.grey.shade400,
            titleColor: Colors.black,
            title: "Retry",
            onPressed: () {})
      ],
    );
  }
}
