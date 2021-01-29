import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/models/AuthService.dart';
import 'package:url_launcher/url_launcher.dart';

_launchURL() async {
  const url = 'https://master.d3gsdsywc4dny7.amplifyapp.com/inscription';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _password;
  String _email;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
            child: Column(
      children: [
        SafeArea(
          child: Container(
            width: width,
            height: height * 0.35,
            child: Image.network(
              'https://images.pexels.com/photos/864939/pexels-photo-864939.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Form(
              key: _formKey,
              child: Column(children: <Widget>[
                SizedBox(height: 20.0),
                Text(
                  'Login',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  onSaved: (value) => _email = value,
                  validator: (value) => EmailValidator.validate(value)
                      ? null
                      : "please enter a valid email",
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    suffixIcon: Icon(
                      Icons.mail,
                      color: Colors.black,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffEE7B23), width: 2.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  onSaved: (value) => _password = value,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: Icon(
                      Icons.visibility_off,
                      color: Colors.black,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffEE7B23), width: 2.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                    child: Text("LOGIN"),
                    onPressed: () async {
                      final form = _formKey.currentState;
                      form.save();

                      if (form.validate()) {
                        var result = await Provider.of<AuthService>(context)
                            .loginUser(email: _email, password: _password);
                        //print(_email);
                        if (result != null) {
                        } else {
                          return _buildShowErrorDialog(context,
                              "Error Logging In With Those Credentials");
                        }
                      }
                    }),
                SizedBox(height: 20.0),
                GestureDetector(
                  child: Text(
                    'Forget password?',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    _launchURL();
                  },
                  child: Text.rich(
                    TextSpan(text: 'Don\'t have an account', children: [
                      TextSpan(
                        text: 'Signup',
                        style: TextStyle(color: Color(0xffEE7B23)),
                      ),
                    ]),
                  ),
                ),
              ])),
        )
      ],
    )));
  }

  Future _buildShowErrorDialog(BuildContext context, _message) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
          title: Text('Message'),
          content: Text(_message),
          actions: <Widget>[
            FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      },
      context: context,
    );
  }
}
