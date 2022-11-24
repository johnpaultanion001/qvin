import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qvin/view/dashboard/contents/dvir/dvir_form/truck_form.dart';
import 'package:qvin/view/dashboard/contents/dvir/dvir_visual/trailer_visual.dart';
import 'package:qvin/view/dashboard/contents/dvir/dvir_visual/truck_visual.dart';

import 'package:qvin/view/dashboard/contents/dvir/widgets/you_selected.dart';

import '../../../../providers/dashboardProvider.dart';
import 'dvir_form/trailer_form.dart';

class DVIR extends StatefulWidget {
  const DVIR({super.key});

  @override
  State<DVIR> createState() => _DVIRState();
}

class _DVIRState extends State<DVIR> {
  int currentStep = 0;
  bool hide = true;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      child: Consumer<DashboardProvider>(
        builder: (context, user, child) {
          switch (user.dvir) {
            case Dvir.Visual:
              return visualStepper();
            case Dvir.Form:
              return formStepper();
            default:
              return visualStepper();
          }
        },
      ),
    );
  }

  Stepper visualStepper() {
    return Stepper(
      type: StepperType.horizontal,
      steps: getStepVisual(),
      currentStep: currentStep,
      onStepContinue: () {
        final isLastStep = currentStep == getStepVisual().length - 1;
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
    );
  }

  List<Step> getStepVisual() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text('Truck'),
          content: const TruckVisual(),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text('Trailer'),
          content: const TrailerVisual(),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text('Remarks'),
          content: const YouSelectedWidget(),
        ),
      ];

  Stepper formStepper() {
    return Stepper(
      type: StepperType.horizontal,
      steps: getStepForm(),
      currentStep: currentStep,
      onStepContinue: () {
        final isLastStep = currentStep == getStepForm().length - 1;
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
    );
  }

  List<Step> getStepForm() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text('Truck'),
          content: TruckForm(),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text('Trailer'),
          content: TrailerForm(),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text('Remarks'),
          content: const YouSelectedWidget(),
        ),
      ];
}
