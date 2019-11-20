import 'package:diagnosify2/pages/loader.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool isToggle = true;
  IconData isVisible = Icons.visibility;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _isChangeIcon() {
    setState(() {
      if (isToggle) {
        isVisible = Icons.visibility_off;
        isToggle = false;
      } else {
        isVisible = Icons.visibility;
        isToggle = true;
      }
    });
  }

  void onBtnPress() {
    if (!_formKey.currentState.validate()) {
      print('fields cannot be empty');
    } else {
      //make request to endpoint
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/dashboard', (Route<dynamic> route) => false);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Loader(1.toInt())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Ink.image(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/login_back.png')),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 30.0,
                    color: Colors.blue,
                  ),
                ),
                FlutterLogo(
                  size: 50,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 200, right: 30.0, left: 30.0, bottom: 30.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: emailController,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          maxLines: 1,
                          enableInteractiveSelection: true,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            alignLabelWithHint: true,
                            hintStyle: TextStyle(color: Colors.black),
                            contentPadding: EdgeInsets.all(15.0),
                            hasFloatingPlaceholder: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(169, 180, 244, 50)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red.withOpacity(0.5)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.blue,
                            ),
                            labelStyle: TextStyle(color: Colors.black),
                            errorStyle: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          validator: (value) {
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return 'Please enter a valid Email.';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: isToggle,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          textCapitalization: TextCapitalization.words,
                          enableInteractiveSelection: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            alignLabelWithHint: false,
                            hintStyle: TextStyle(color: Colors.black),
                            contentPadding: EdgeInsets.all(15.0),
                            hasFloatingPlaceholder: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(169, 180, 244, 50)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red.withOpacity(0.5)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: InkWell(
                              onTap: _isChangeIcon,
                              child: Icon(
                                isVisible,
                                color: Colors.blue,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.blue,
                            ),
                            labelStyle: TextStyle(color: Colors.black),
                            errorStyle: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          onFieldSubmitted: (value) {},
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your Password';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    voidCallback: () {
                      onBtnPress();
                    },
                    btnText: 'Login',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Don\'t have an account?'),
                      SizedBox(
                        width: 5.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/signupPage');
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final voidCallback;
  final btnText;
  const CustomButton({
    Key key,
    @required this.voidCallback,
    @required this.btnText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: voidCallback,
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          btnText,
          style: TextStyle(fontSize: 22, color: Colors.white),
        )),
      ),
    );
  }
}
