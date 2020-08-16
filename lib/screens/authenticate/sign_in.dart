import 'package:brew_crew/services/auth_services.dart';
import 'package:brew_crew/shared/constance.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleShow;
  SignIn({this.toggleShow});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : SafeArea(
            child: Scaffold(
              backgroundColor: Colors.blueGrey[100],
              body: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 0, right: 19, top: 0),
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              colors: [
                                Colors.brown[400],
                                Colors.brown[500],
                                Colors.brown[600],
                                Colors.brown[700],
                                Colors.brown[800],
                                Colors.brown[700],
                                Colors.brown[600],
                                Colors.brown[500],
                                Colors.brown[400],
                              ],
                            ),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 20,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Sign In to Brew Crew',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FlatButton.icon(
                                  onPressed: () async {
                                    widget.toggleShow();
                                  },
                                  icon: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    'Register',
                                    style: TextStyle(
                                      color: Colors.brown[100],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 10,
                            left: 20,
                            right: 20,
                            top: 15,
                          ),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 20,
                                      offset: Offset(5, 7),
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  validator: (val) =>
                                      val.isEmpty ? 'Enter an Email' : null,
                                  decoration: textInputDecoretion.copyWith(
                                      hintText: 'Email Id'),
                                  onChanged: (val) {
                                    setState(() {
                                      email = val;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 20,
                                      offset: Offset(5, 7),
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  obscureText: true,
                                  decoration: textInputDecoretion.copyWith(
                                      hintText: 'Password'),
                                  validator: (val) => val.length < 6
                                      ? 'Enter Password more than 6 digits'
                                      : null,
                                  onChanged: (val) {
                                    setState(() {
                                      password = val;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              RaisedButton.icon(
                                highlightColor: Colors.green[700],
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    setState(() {
                                      loading = true;
                                    });
                                    dynamic result =
                                        await _auth.signInWithEmailAndPassword(
                                            email, password);
                                    if (result == null) {
                                      setState(() {
                                        loading = false;
                                        error =
                                            'Please check your email or password !';
                                      });
                                    }
                                  }
                                },
                                icon: Icon(Icons.person_outline),
                                label: Text('Sign In'),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                error,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
