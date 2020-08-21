import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../styles/colors.dart';
import '../../api/auth.dart';
import '../../views/calc/calc.dart';

class Signin extends StatefulWidget {
  Signin({Key key}) : super(key: key);

  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {

  static TextEditingController _emailController = new TextEditingController();
  static TextEditingController _passwordController  = new TextEditingController();
  static TextEditingController _nameController = new TextEditingController();
  static TextEditingController _lastnameController = new TextEditingController();

  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];

  List<Step> steps;

  @override
  void initState() {
    super.initState();


    steps = [
      Step(
          title: const Text('Crear cuenta'),
          isActive:  currentStep == 0 ? true : false,
          state: StepState.indexed,
          content: Form(
            key: formKeys[0],
            child: Column(
              children: <Widget>[
                TextFormField(
                  autocorrect: false,
                  controller: _emailController,
                  maxLines: 1,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.isEmpty || value.length < 1) {
                      return 'Ingrese su correo';
                    }
                  },
                  decoration: InputDecoration(labelText: 'Correo electrónico'),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Ingrese su contraseña';
                    }
                    return null;
                  },
                  obscureText: true,
                  autocorrect: false,
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Contraseña'),
                ),
              ],
            ),
          )),
      Step(
          isActive: currentStep == 1 ? true : false,
          state: StepState.indexed,
          title: const Text('Nombre y Apellido'),
          content: Form(
            key: formKeys[1],
            child: Column(
              children: <Widget>[
                TextFormField(
                  autocorrect: false,
                  controller: _nameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Ingrese su nombre';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Nombre'),
                ),
                TextFormField(
                  autocorrect: false,
                  controller: _lastnameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Ingrese su apellido';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Apellido'),
                ),
              ],
            ),
          )),
    ];
  }



  int currentStep = 0;
  bool complete = false;


  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  _submitDetails() async {
    final FormState formState = formKeys[currentStep].currentState;
    if (formState.validate()) {
      formState.save();
      print('email');
      print(_emailController.value.text);
      print('nombre completo');
      print(_nameController.value.text + ' ' + _lastnameController.value.text);
      try {
        FirebaseUser result = await Provider.of<AuthService>(context).createUser(
          email: _emailController.value.text, 
          password: _passwordController.value.text, 
          firstName: _nameController.value.text, 
          lastName: _lastnameController.value.text
        );

        print('result:');
        print(result);

        if(result.email == _emailController.value.text){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Calc()),
          );
        } 


      } on AuthException catch (error) {
        return _buildErrorDialog(context, error.message);
      } on Exception catch (error) {
        return _buildErrorDialog(context, error.toString());
      }
    }
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
                    child: Column(children: <Widget>[
                      Expanded(
                          child: Stepper(
                        steps: steps,
                        currentStep: currentStep,
                        onStepContinue: () {
                          setState(() {
                            if (formKeys[currentStep].currentState.validate()) {
                              print('steps lenght');
                              print(steps.length);
                              print('current step');
                              print(currentStep);
                              print('eval');
                              print(currentStep < steps.length - 1);

                              if (currentStep < steps.length - 1) {
                                currentStep = currentStep + 1;
                              } else {
                                setState(() => complete = true); 
                                _submitDetails();
                              }
                            }
                          });
                        },
                        onStepTapped: (step) => goTo(step),
                        onStepCancel: cancel,
                        controlsBuilder: (BuildContext context,
                            {VoidCallback onStepContinue,
                            VoidCallback onStepCancel}) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                height: 80.0,
                              ),
                              FlatButton(
                                color: MustardColor,
                                onPressed: onStepContinue,
                                child: complete ? const Text('REGISTRAR') : const Text('SIGUIENTE'),
                              ),
                              FlatButton(
                                color: GoldColor,
                                onPressed: onStepCancel,
                                child: const Text('CANCELAR'),
                              ),
                            ],
                          );
                        },
                      )),
                    ])))
                     //BUTTONS CROP IMAGE
        ],)
        );
    }
}

Future _buildErrorDialog(BuildContext context, _message) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(_message),
          actions: <Widget>[
            FlatButton(
                child: Text('Cancelar'),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      },
      context: context,
    );
}