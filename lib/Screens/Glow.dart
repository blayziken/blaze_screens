import 'dart:async';

import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/widgets.dart';

class GlowScreen extends StatefulWidget {
  static const routeName = '/glow-ui';

  @override
  _GlowScreenState createState() => _GlowScreenState();
}

class _GlowScreenState extends State<GlowScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: media.height,
        width: double.infinity,
        color: Colors.red[600],
        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Expanded(
              flex: 2,
              child: AvatarGlow(
                endRadius: 170.0,
                child: Material(
                  elevation: 8.0,
                  shape: CircleBorder(),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[100],
                    child: Image.asset(
                      'images/animal.png',
                      height: 190,
                    ),
                    radius: 90.0,
                  ),
                ),
              ),
//                  CircleAvatar(
//                backgroundColor: Colors.white,
//                radius: 90.0,
//                backgroundImage: AssetImage('images/babe.jpg'),
//              ),
            ),

//        image: DecorationImage(
//          image: AssetImage('images/girl4.png'),
//          fit: BoxFit.cover,
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    'Squitle',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Achieve your dreams..',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
//                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Login extends StatelessWidget {
  static const routeName = '/glowLogin-ui';

  String _username;
  String _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildUserName() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Username',
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
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
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0, left: 20),
                    child: Container(
                      height: 170,
                      width: 170,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('images/animal.png'),
                        fit: BoxFit.contain,
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Proceed with your',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Padding(
                      padding: const EdgeInsets.only(
                        left: 40.0,
                        right: 30.0,
                        top: 60.0,
                        bottom: 50.0,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  width: media.width * 0.78,
                                  child: _buildUserName(),
                                ),
                                Icon(
                                  Icons.person_outline,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  width: media.width * 0.78,
                                  child: _buildPassword(),
                                ),
                                Icon(
                                  Icons.lock_open,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Container(
                          width: 340.0,
                          height: 55.0,
//                        color: Colors.red,
                          child: RaisedButton(
                            color: Colors.red[800],
                            splashColor: Colors.red,
                            onPressed: () {
                              if (!_formKey.currentState.validate()) {
                                return;
                              }

                              _formKey.currentState.save();

                              print(_username);
                              print(_password);
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                            child: Text(
                              'Forgot Password?  ',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey,
//                            fontWeight: FontWeight.w900,
                              ),
                            ),
                            onPressed: () {},
                          ),
                          Container(
                            color: Colors.black,
                            width: 1.0,
                            height: 20,
                          ),
                          FlatButton(
                            child: Text(
                              'Signup',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.red,
//                            fontWeight: FontWeight.w900,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signup()),
                              );
                            },
                          ),
                        ],
                      ),
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

class Signup extends StatelessWidget {
  String _name;
  String _email;
  String _phone;
  String _password;

  final GlobalKey<FormState> _signUpformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    Widget _buildFullName() {
      return Container(
        height: 50,
        child: TextFormField(
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(5),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            prefixIcon: Icon(
              Icons.person_outline,
              size: 25.0,
              color: Colors.red,
            ),
            labelText: 'FULL NAME',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
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
        ),
      );
    }

    Widget _buildEmail() {
      return Container(
        height: 50,
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(5),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            prefixIcon: Icon(
              Icons.mail_outline,
              size: 25.0,
              color: Colors.red,
            ),
            labelText: 'EMAIL',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          validator: (String value) {
            if (value.isEmpty) {
              return 'Email is required';
            }

            return null;
          },
          onSaved: (String value) {
            _email = value;
          },
        ),
      );
    }

    Widget _buildPhone() {
      return Container(
        height: 50,
        child: TextFormField(
          keyboardType: TextInputType.phone,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(5),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            prefixIcon: Icon(
              Icons.smartphone,
              size: 25.0,
              color: Colors.red,
            ),
            labelText: 'PHONE',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          validator: (String value) {
            if (value.isEmpty) {
              return 'Phone is required';
            }

            return null;
          },
          onSaved: (String value) {
            _phone = value;
          },
        ),
      );
    }

    Widget _buildPassword() {
      return Container(
        height: 50,
        child: TextFormField(
          obscureText: true,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(5),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            prefixIcon: Icon(
              Icons.lock_outline,
              size: 25.0,
              color: Colors.red,
            ),
            labelText: 'PASSWORD',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          validator: (String value) {
            if (value.isEmpty) {
              return 'Password is required';
            }

            return null;
          },
          onSaved: (String value) {
            _password = value;
          },
        ),
      );
    }

    Widget _buildConfirmPassword() {
      return Container(
        height: 50,
        child: TextFormField(
          obscureText: true,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(5),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            prefixIcon: Icon(
              Icons.lock_outline,
              size: 25.0,
              color: Colors.red,
            ),
            labelText: 'CONFIRM PASSWORD',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          validator: (String value) {
            if (value.isEmpty) {
              return 'Please confirm password';
            }

            return null;
          },
          onSaved: (String value) {
            _password = value;
          },
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: media.height,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 50.0),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.red,
                    size: 30.0,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Shall we? 😎',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                ),
                child: Container(
                  width: double.infinity,
                  height: media.height * 0.5,
//                  color: Colors.tealAccent,
                  child: Form(
                    key: _signUpformKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        _buildFullName(),
                        _buildEmail(),
                        _buildPhone(),
                        _buildPassword(),
                        _buildConfirmPassword(),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50.0),
              Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 350.0,
                      height: 55.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(2, 5),
                          ),
                        ],
                      ),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: Colors.red[800],
                        splashColor: Colors.red,
                        onPressed: () {
                          if (!_signUpformKey.currentState.validate()) {
                            return;
                          }

                          _signUpformKey.currentState.save();

                          print(_name);
                          print(_email);
                          print(_phone);
                          print(_password);
                        },
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          child: RichText(
                            text: TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(
                                color: Colors.black,
//                              fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' Login',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
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
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
