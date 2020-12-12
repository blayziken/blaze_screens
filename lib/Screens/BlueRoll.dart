import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlueRoll extends StatelessWidget {
  static const routeName = '/blueRoll-ui';

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
//        color: Colors.blue,
        height: media.height,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
//          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Expanded(
              flex: 2,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/6824631.jpg'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Spacer(),
            Expanded(
              flex: 3,
              child: Column(
                children: <Widget>[
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 50.0,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'Start your adventure!',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
//                    color: Colors.grey,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    height: 60.0,
                    width: 300,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      color: Colors.blue[600],
                      splashColor: Colors.white,
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 40,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(
                                    'images/google-gogle-network-logo-icon.png'),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            'CONTINUE WITH GOOGLE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    height: 50.0,
                    width: 250,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue[600],
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      color: Colors.white,
                      splashColor: Colors.blue,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Signup(),
                          ),
                        );
                      },
                      child: Text(
                        'SIGN UP WITH EMAIL',
                        style: TextStyle(
                          color: Colors.blue[600],
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                        builder: (context) => Signup(),
//                      ),
//                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Signup extends StatelessWidget {
  String _username;
  String _email;
  String _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    Widget _buildEmail() {
      return TextFormField(
        decoration: InputDecoration(
          hintText: 'example@mail.com',
          hintStyle: TextStyle(
            color: Colors.grey.withOpacity(0.8),
          ),
          labelText: 'EMAIL',
          labelStyle: TextStyle(
            color: Colors.blue[900],
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
          enabledBorder: OutlineInputBorder(
//            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
          ),
          focusedBorder: OutlineInputBorder(
//            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
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
          hintText: 'JOHN DOE',
          hintStyle: TextStyle(
            color: Colors.grey.withOpacity(0.8),
          ),
          labelText: 'USER NAME',
          labelStyle: TextStyle(
            color: Colors.blue[900],
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
          enabledBorder: OutlineInputBorder(
//            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
          ),
          focusedBorder: OutlineInputBorder(
//            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
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
          labelText: 'PASSWORD',
          labelStyle: TextStyle(
            color: Colors.blue[900],
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
          enabledBorder: OutlineInputBorder(
//            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
          ),
          focusedBorder: OutlineInputBorder(
//            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
          ),
        ),
        obscureText: true,
//        keyboardType: TextInputType.visiblePassword,
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

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: media.height,
          width: double.infinity,
//          color: Colors.blue[600],
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue[900],
                Colors.blue[400],
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50.0, top: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Welcome',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: media.height * 0.3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45.0),
                      topRight: Radius.circular(45.0),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 70.0,
                          top: 70.0,
                          right: 60.0,
                          bottom: 40.0,
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              _buildUserName(),
                              _buildEmail(),
                              _buildPassword(),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 55,
                        width: 220,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          color: Colors.blue[600],
                          splashColor: Colors.blue,
                          onPressed: () {
                            if (!_formKey.currentState.validate()) {
                              return;
                            }

                            _formKey.currentState.save();

                            print(_username);
                            print(_email);
                            print(_password);
                          },
                          child: Center(
                            child: Text(
                              'REGISTER',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      FlatButton(
                        child: RichText(
                          text: TextSpan(
                            text: 'or sign up with ',
                            style: TextStyle(
                              color: Colors.blue[400],
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'google',
                                style: TextStyle(
                                  color: Colors.blue[800],
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                        builder: (context) => Signup(),
//                      ),
//                    );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Container(
                  height: 50,
                  color: Colors.white,
                  child: Center(
                    child: FlatButton(
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
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue,
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Login extends StatelessWidget {
  String _username;
  String _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    Widget _buildUserName() {
      return TextFormField(
        decoration: InputDecoration(
          hintText: 'JOHN DOE',
          hintStyle: TextStyle(
            color: Colors.grey.withOpacity(0.8),
          ),
          labelText: 'USER NAME',
          labelStyle: TextStyle(
            color: Colors.blue[900],
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
          enabledBorder: OutlineInputBorder(
//            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
          ),
          focusedBorder: OutlineInputBorder(
//            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
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
          labelText: 'PASSWORD',
          labelStyle: TextStyle(
            color: Colors.blue[900],
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
          enabledBorder: OutlineInputBorder(
//            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
          ),
          focusedBorder: OutlineInputBorder(
//            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
          ),
        ),
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

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: media.height,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue[900],
                Colors.blue[400],
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50.0, top: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Heyy',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Login!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45.0),
                      topRight: Radius.circular(45.0),
                    ),
                  ),
                  height: media.height * 0.3,
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 70.0,
                          top: 90.0,
                          right: 60.0,
                          bottom: 80.0,
                        ),
                        child: Form(
                          key: _formKey,
                          child: Container(
                            height: media.height * 0.17,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                _buildUserName(),
                                _buildPassword(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 55,
                        width: 180,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          color: Colors.blue[600],
                          splashColor: Colors.blue,
                          onPressed: () {
                            if (!_formKey.currentState.validate()) {
                              return;
                            }

                            _formKey.currentState.save();

                            print(_username);
                            print(_password);
                          },
                          child: Center(
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 50,
                        color: Colors.white,
                        child: Center(
                          child: FlatButton(
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.blue[900],
                              ),
                            ),
                            onPressed: () {
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
                      SizedBox(
                        height: 30.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
