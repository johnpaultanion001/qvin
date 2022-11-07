import 'package:flutter/material.dart';
import 'package:qvin/view/dashboard/contents/dvir/widgets/trailer.dart';
import 'package:qvin/view/dashboard/contents/dvir/widgets/truck.dart';
import 'package:qvin/view/dashboard/contents/dvir/widgets/you_selected.dart';

class DVIRVisual extends StatefulWidget {
  const DVIRVisual({super.key});

  @override
  State<DVIRVisual> createState() => _DVIRVisualState();
}

class _DVIRVisualState extends State<DVIRVisual> {
  int currentStep = 0;
  bool hide = true;
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
          content: const TrailerWidget(),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text('Remarks'),
          content: const YouSelectedWidget(),
        ),
      ];
}
