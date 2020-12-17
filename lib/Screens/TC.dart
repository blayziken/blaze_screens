import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TC extends StatelessWidget {
  static const routeName = '/tc-ui';

  String _email;
  String _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    Widget _buildEmailAddress() {
      return Container(
        height: 50,
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
//        fontWeight: FontWeight.bold,
            fontSize: 17.0,
          ),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey),
            ),
            labelText: 'Email Address',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
          validator: (String value) {
            if (value.isEmpty) {
              return 'Email Address required';
            }
            return null;
          },
          onSaved: (String value) {
            _email = value;
          },
        ),
      );
    }

    Widget _buildPassword() {
      return Container(
        height: 50,
        child: TextFormField(
          style: TextStyle(
//        fontWeight: FontWeight.bold,
            fontSize: 17.0,
          ),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey),
            ),
            labelText: 'Password',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
          obscureText: true,
          validator: (String value) {
            if (value.isEmpty) {
              return 'Password required';
            }
            return null;
          },
          onSaved: (String value) {
            _password = value;
          },
        ),
      );
    }

    ///
    return Scaffold(
      body: Container(
        height: media.height,
        width: double.infinity,
        child: Column(
//        crossAxisAlignment: CrossAxisAlignment.center,
//        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Expanded(
              flex: 0,
              child: Center(
                child: Text(
                  'Sign in',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 40.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.0),
            Expanded(
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      _buildEmailAddress(),
                      SizedBox(height: 30.0),
                      _buildPassword(),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 50.0, top: 10.0, bottom: 20.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.blue[600],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Container(
              width: media.width * 0.8,
              height: 55.0,
              child: RaisedButton(
                color: Colors.deepOrange[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }

                  _formKey.currentState.save();
                  print(_email);
                  print(_password);
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 23.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 1.0,
                  width: 130,
                  child: Container(
                    color: Colors.black,
                  ),
                ),
                Text(
                  ' OR ',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 1.0,
                  width: 130,
                  child: Container(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Container(
              height: 45.0,
              width: 250,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                color: Colors.white,
                onPressed: () {},
                child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/google-logo-9808.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'Sign in with Google',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Center(
              child: Container(
                height: 20,
                child: InkWell(
                  child: RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign up',
                          style: TextStyle(
                            color: Colors.blue[600],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Signup(),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////
class Signup extends StatelessWidget {
  String _firstName;
  String _lastName;
  String _email;
  String _password;

  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    Widget _buildFirstName() {
      return Container(
        height: 50,
        width: 160,
        child: TextFormField(
          style: TextStyle(
//        fontWeight: FontWeight.bold,
            fontSize: 17.0,
          ),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey),
            ),
            labelText: 'First Name',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
          validator: (String value) {
            if (value.isEmpty) {
              return 'First name required';
            }
            return null;
          },
          onSaved: (String value) {
            _firstName = value;
          },
        ),
      );
    }

    Widget _buildLastName() {
      return Container(
        height: 50,
        width: 160,
        child: TextFormField(
          style: TextStyle(
//        fontWeight: FontWeight.bold,
            fontSize: 17.0,
          ),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey),
            ),
            labelText: 'Last Name',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
          validator: (String value) {
            if (value.isEmpty) {
              return 'Last name required';
            }
            return null;
          },
          onSaved: (String value) {
            _lastName = value;
          },
        ),
      );
    }

    Widget _buildEmailAddress() {
      return Container(
        height: 50,
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
//        fontWeight: FontWeight.bold,
            fontSize: 17.0,
          ),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey),
            ),
            labelText: 'Email Address',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
          validator: (String value) {
            if (value.isEmpty) {
              return 'Email required';
            }
            return null;
          },
          onSaved: (String value) {
            _email = value;
          },
        ),
      );
    }

    Widget _buildPassword() {
      return Container(
        height: 50,
        child: TextFormField(
          style: TextStyle(
//        fontWeight: FontWeight.bold,
            fontSize: 17.0,
          ),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey),
            ),
            labelText: 'Password',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
          obscureText: true,
          validator: (String value) {
            if (value.isEmpty) {
              return 'Password required';
            }
            return null;
          },
          onSaved: (String value) {
            _password = value;
          },
        ),
      );
    }

    ///
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: media.height,
          width: double.infinity,
          child: Column(
//        crossAxisAlignment: CrossAxisAlignment.center,
//        mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Spacer(),
              Expanded(
                flex: 0,
                child: Center(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              Expanded(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                  child: Form(
                    key: _formKey2,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            _buildFirstName(),
                            _buildLastName(),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        _buildEmailAddress(),
                        SizedBox(height: 30.0),
                        _buildPassword(),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              Container(
                width: media.width * 0.8,
                height: 55.0,
                child: RaisedButton(
                  color: Colors.deepOrange[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  onPressed: () {
                    if (!_formKey2.currentState.validate()) {
                      return;
                    }

                    _formKey2.currentState.save();
                    print(_firstName);
                    print(_lastName);
                    print(_email);
                    print(_password);
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 23.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 1.0,
                    width: 130,
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    ' OR ',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 1.0,
                    width: 130,
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Container(
                height: 45.0,
                width: 250,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  color: Colors.white,
                  onPressed: () {},
                  child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/google-logo-9808.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        'Register with Google',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Center(
                child: Container(
                  height: 20,
                  child: InkWell(
                    child: RichText(
                      text: TextSpan(
                        text: 'Already Registered? ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15.0,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Log in',
                            style: TextStyle(
                              color: Colors.blue[600],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TC(),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
