import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/scheduler.dart';
import 'package:untitled/styles/AppContextExtension.dart';
import 'package:untitled/styles/widgets/labels.dart';
import 'package:untitled/view/dashboard/contents/dvir/dvir_form.dart';
import 'package:untitled/view/dashboard/contents/dvir/widgets/truck.dart';

class DVIR extends StatefulWidget {
  const DVIR({super.key});

  @override
  State<DVIR> createState() => _DVIRState();
}

class _DVIRState extends State<DVIR> {
  int currentStep = 0;
  bool hide = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).push(
        PageRouteBuilder(
          opaque: false,
          barrierDismissible: true,
          pageBuilder: (_, __, ___) => const DVIRForm(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      child: Stepper(
        type: StepperType.horizontal,
        steps: getStep(),
        currentStep: currentStep,
        onStepContinue: () {
          final isLastStep = currentStep == getStep().length - 1;
          if (isLastStep) {
            print("Completed");
          } else {
            setState(() => currentStep += 1);
          }
        },
        onStepTapped: (step) => setState(() => currentStep = step),
        onStepCancel:
            currentStep == 0 ? null : () => setState(() => currentStep -= 1),
        controlsBuilder: (BuildContext ctx, ControlsDetails dtl) {
          return Row(
            children: <Widget>[
              TextButton(
                onPressed: dtl.onStepContinue,
                child: Text(hide == true ? '' : 'NEXT'),
              ),
              TextButton(
                onPressed: dtl.onStepCancel,
                child: Text(hide == true ? '' : 'BACK'),
              ),
            ],
          );
        },
      ),
    );
  }

  List<Step> getStep() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text('Truck'),
          content: const TruckWidget(),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text('Trailer'),
          content: Container(child: const Text('test 2')),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text('Remarks'),
          content: Container(child: const Text('test 3')),
        ),
      ];
}
