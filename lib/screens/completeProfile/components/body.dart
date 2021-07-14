import 'package:epharmacy/screens/MainHome/mainHomeScreen.dart';
import 'package:epharmacy/screens/completeProfile/components/pharmacyInfo.dart';
import 'package:epharmacy/screens/completeProfile/components/pharmacyLicense.dart';
import 'package:epharmacy/screens/completeProfile/components/pharmacySchedule.dart';
import 'package:flutter/material.dart';


class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    List<Step> _steps = [
      Step(
        title: Text('Pharmacy info'),
        content: PharmacyInfo(),
        isActive: true,
        state: currentStep == 0 ? StepState.complete : StepState.disabled,
      ),
      Step(
        title: Text('Pharmacy License'),
        content: PharmcayLicense(),
        isActive: true,
        state: currentStep == 1 ? StepState.complete : StepState.disabled,
      ),
      Step(
        title: Text('Time Schedule'),
        content: PharmacySchedule(),
        isActive: true,
        state: currentStep == 2 ? StepState.complete : StepState.disabled,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Complete Profile"),
      ),
      body: Container(
        child: Stepper(
          type: StepperType.vertical,
          currentStep: this.currentStep,
          steps: _steps,
          onStepTapped: (step) {
            setState(() => currentStep = step);
          },
          onStepContinue: () {
            setState(() {
              if (currentStep < _steps.length - 1) {
                if (currentStep == 0) {
                  currentStep = currentStep + 1;
                } else if (currentStep == 1) {
                  currentStep = currentStep + 1;
                } else if (currentStep == 2) {
                  currentStep = currentStep + 1;
                }
              } else { 
                             
                       
                         
                            
                           
                             
                          
                        
                // currentStep = 0;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MainHomeScreen()));
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (currentStep > 0) {
                currentStep = currentStep - 1;
              } else {
                currentStep = 0;
              }
            });
          },
        ),
      ),
    );
  }
}

// void createProfiles(BuildContext context) async {


//   // if (disName != null &&
//   //     thanaName != null &&
//   //     areaName != 0 &&
//   //     amounts != null) {
   
//   //   await CompleteProfile.createProfile(
//   //       disName: serialType.toLowerCase(),
//   //       thanaName: amounts,
//   //       amounts: date.toString(),
//   //       areaName: dayName,
//   //       start_time: start,
//   //       end_time: end,
//   //       session: investigatTime);
//   // } 
// }