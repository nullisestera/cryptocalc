import 'package:flutter/material.dart';
import '../../styles/colors.dart';

class Signin extends StatefulWidget {
  Signin({Key key}) : super(key: key);

  _SigninState createState() => _SigninState();
}

class MyData {
  String _password;
  String _email;
  String _name;
  String _lastname;
}

class _SigninState extends State<Signin> {

  GlobalKey<FormState> _formKey =  GlobalKey<FormState>();
  static var _focusNode =  FocusNode();
  static MyData data = new MyData();
  
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
      print('Has focus: $_focusNode.hasFocus');
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }


  List<Step> steps = [
      Step(
        title: const Text('Correo'),
        isActive: true,
        state: StepState.indexed,
        content: TextFormField(
            focusNode: _focusNode,
            onSaved: (String value) {
              data._email = value;
            },
            maxLines: 1,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value.isEmpty) {
                return 'Ingrese su correo';
              }
              return null;
            }, 
            decoration: InputDecoration(labelText: 'Correo electrónico'),
          ),
      ),

      Step(
        title: const Text('Contraseña'),
        isActive: true,
        state: StepState.indexed,
        content: TextFormField(
                validator: (value) {
                if (value.isEmpty) {
                        return 'Ingrese su contraseña';
                      }
                      return null;
                },
                obscureText: true,
                onSaved: (String value) {
                  data._password = value;
                },
                decoration: InputDecoration(labelText: 'Contraseña'),
              ),
      ),

      Step(
        isActive: true,
        state: StepState.indexed,
        title: const Text('Nombre'),
        content: TextFormField(
                onSaved: (String value) {
                  data._name = value;
                },
                decoration: InputDecoration(labelText: 'Nombre'),
              ),
      ),

      Step(
        isActive: true,
        state: StepState.indexed,
        title: const Text('Apellido'),
        content: TextFormField(
                onSaved: (String value) {
                  data._password = value;
                },
                decoration: InputDecoration(labelText: 'Apellido'),
              ),
      ),
    ];

    int currentStep = 0;
    bool complete = false;

    next() {
      currentStep + 1 != steps.length
          ? goTo(currentStep + 1)
          : setState(() => complete = true);
    }

    cancel() {
      if (currentStep > 0) {
        goTo(currentStep - 1);
      }
    }

    goTo(int step) {
      setState(() => currentStep = step);
    }


  @override
  Widget build(BuildContext context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  MustardColor,
                  FlanColor,
                  FlanLightColor
                ],
                stops: [0.1, 0.9, 1.5]
              )
            )
          ),
          Container(
            height: 180.0,
            width: 320.0,
            child: Image.asset('assets/images/crypto.png'),
            margin: const EdgeInsets.only(left: 50.0, right: 50.0, top: 20.0, bottom: 50.0),
          ),
          Center(child: 
            Container(
            height: 480.0,
            width: 320.0,
            margin: const EdgeInsets.only(top: 100.0),
            decoration: BoxDecoration(
              color: FlanLightColor,
              borderRadius: BorderRadius.circular(25)
            ),
          )
          ),
          Container(
            height: 80.0,
            width: 200.0,
            child: Text('Regístrate',
              textAlign: TextAlign.center, 
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 30,
                fontWeight: FontWeight.w600
              ),
            ),
            
            margin: const EdgeInsets.only(left: 120.0, right: 120.0, top: 180.0, bottom: 100.0),
          ),
          // STEPPER
    
          Center(
            child: Container(
            margin: const EdgeInsets.only(top: 100),
            height: 380.0,
            width: 300.0,
            child: Form(
              key: _formKey,
              child: 
                Column(
                  children: <Widget>[
                    Expanded(
                      child: Stepper(
                          steps: steps,
                          currentStep: currentStep,
                          onStepContinue: next,
                          onStepTapped: (step) => goTo(step),
                          onStepCancel: cancel,
                          controlsBuilder: (BuildContext context,
                          {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                height: 80.0,
                              ),
                              FlatButton(
                                color: MustardColor,
                                onPressed: currentStep == 3 ? () async {
                                  onStepContinue();
                                  // save the fields..
                                  final FormState formState = _formKey.currentState;
                                  if (!formState.validate()) {
                                    print('Please enter correct data');
                                  } else {
                                    formState.save();
                                      print("Email: ${data._email}"); // THIS RETURNS Email: Null
                                  }  
                                } : onStepContinue,
                                child: currentStep == 3 ?  const Text('FINALIZAR') : const Text('SIGUIENTE'),
                              ),
                              FlatButton(
                                color: GoldColor,
                                onPressed: onStepCancel,
                                child: const Text('CANCELAR'),
                              ),
                            ],
                          );
                        },
                      )
                    ),
                  ])
            )
          ))
        ],)
        );
    }
}

