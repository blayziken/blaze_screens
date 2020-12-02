import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReddishScreen extends StatelessWidget {
  static const routeName = '/reddish-ui';

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: media.height,
        color: Colors.red,
        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(
              flex: 1,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'BillionDeal',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.attach_money,
                      color: Colors.red,
                      size: 45.0,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 280.0,
                    height: 55.0,
                    child: RaisedButton(
                      splashColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ),
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 21.0,
                  ),
                  Container(
                    width: 280.0,
                    height: 55.0,
                    child: RaisedButton(
                      color: Colors.red[800],
                      splashColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Signup(),
                          ),
                        );
                      },
                      child: Text(
                        'Signup',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// SIGN UP
class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String _name;
  String _email;
  String _username;
  String _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Full Name',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Full Name is required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is required';
        }

//        if(!RegExp().hasMatch(value)){
//          return 'Please enter a valid email address';
//        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildUserName() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Username',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Username is required';
        }

        return null;
      },
      onSaved: (String value) {
        _username = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is required';
        }

        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
//      appBar: AppBar(
//        leading: IconButton(
//          icon: Icon(
//            Icons.arrow_back_ios,
//            color: Colors.red,
//          ),
//          onPressed: () => Navigator.pop(context),
//        ),
//        backgroundColor: Colors.white,
//      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: media.height,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.red,
                      size: 30.0,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, top: 30.0),
                        child: RichText(
                          text: TextSpan(
                            text: 'Create An',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 37.0,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' Account',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),

//                    Text(
//                      'Create An Account',
//                      style: TextStyle(
//                        fontWeight: FontWeight.bold,
//                        fontSize: 37.0,
//                      ),
//                    ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, top: 15.0),
                        child: Text(
                          'And discover amazing deals',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                            fontSize: 17.5,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 100.0,
                ),
                Expanded(
                  flex: 0,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, bottom: 60.0, right: 60),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _buildName(),
                            _buildEmail(),
                            _buildUserName(),
                            _buildPassword(),
                          ],
                        ),
                      )),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: FlatButton(
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.red,
                            size: 40.0,
                          ),
                          onPressed: () {
                            if (!_formKey.currentState.validate()) {
                              return;
                            }

                            _formKey.currentState.save();
                            print(_name);
                            print(_email);
                            print(_username);
                            print(_password);
                          },
                        ),
                      ),
                      Spacer(),
                      Center(
                        child: FlatButton(
                          child: RichText(
                            text: TextSpan(
                              text: 'Already have an account?',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' Login',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Login(),
                              ),
                            );
                          },
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// LOGIN
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email;
  String _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is required';
        }

//        if(!RegExp().hasMatch(value)){
//          return 'Please enter a valid email address';
//        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is required';
        }

        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: media.height,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.red,
                      size: 30.0,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, top: 30.0),
                        child: RichText(
                          text: TextSpan(
                            text: 'Welcome',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 37.0,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' Back! 🦅',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),

//                    Text(
//                      'Create An Account',
//                      style: TextStyle(
//                        fontWeight: FontWeight.bold,
//                        fontSize: 37.0,
//                      ),
//                    ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, top: 15.0),
                        child: Text(
                          'Purchase till you drop.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                            fontSize: 17.5,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 100.0,
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, bottom: 60.0, right: 60),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _buildEmail(),
                            _buildPassword(),
                          ],
                        ),
                      )),
                ),
                Spacer(),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: FlatButton(
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.red,
                            size: 40.0,
                          ),
                          onPressed: () {
                            if (!_formKey.currentState.validate()) {
                              return;
                            }

                            _formKey.currentState.save();
                          },
                        ),
                      ),
//                      Spacer(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
