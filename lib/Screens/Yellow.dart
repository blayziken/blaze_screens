import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class Yellow extends StatelessWidget {
  static const routeName = '/yellow-ui';

  String _email;
  String _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
//        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
//            borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        prefixIcon: Icon(
          Icons.mail_outline,
          size: 25.0,
          color: Colors.black,
        ),
        labelText: 'EMAIL',
        labelStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 17.0,
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
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      obscureText: true,
      style: TextStyle(
//        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
//            borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        prefixIcon: Icon(
          Icons.lock_outline,
          size: 25.0,
          color: Colors.black,
        ),
        labelText: 'PASSWORD',
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 17.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password required';
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
        child: Container(
          height: media.height,
          width: media.width,
//        color: Colors.yellow,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/itl.cat_trippy-cartoon-wallpaper.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Please sign in to continue',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Container(
//                color: Colors.tealAccent,
//                height: 180,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        _buildEmail(),
                        SizedBox(
                          height: 15,
                        ),
                        _buildPassword(),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 28.0, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    GradientButton(
                      increaseHeightBy: 20,
                      increaseWidthBy: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Login   ',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 30.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      callback: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }

                        _formKey.currentState.save();

                        print(_email);
                        print(_password);
                      },
                      gradient: Gradients.tameer,
                    ),
                  ],
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
                              color: Colors.white,
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
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String _name;
  String _email;
  String _password;
  String _confirmPassword;

  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      style: TextStyle(
//        fontWeight: FontWeight.bold,
        fontSize: 17.0,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
//            borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        prefixIcon: Icon(
          Icons.person_outline,
          size: 25.0,
          color: Colors.black,
        ),
        labelText: 'FULL NAME',
        labelStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 17.0,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name required';
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
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
//        fontWeight: FontWeight.bold,
        fontSize: 17.0,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
//            borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        prefixIcon: Icon(
          Icons.mail_outline,
          size: 25.0,
          color: Colors.black,
        ),
        labelText: 'EMAIL',
        labelStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 17.0,
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
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      obscureText: true,
      style: TextStyle(
//        fontWeight: FontWeight.bold,
        fontSize: 17.0,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
//            borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        prefixIcon: Icon(
          Icons.lock_outline,
          size: 25.0,
          color: Colors.black,
        ),
        labelText: 'PASSWORD',
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 17.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password required';
        }

        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  Widget _buildConfirmPassword() {
    return TextFormField(
      obscureText: true,
      style: TextStyle(
//        fontWeight: FontWeight.bold,
        fontSize: 17.0,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
//            borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        prefixIcon: Icon(
          Icons.lock_outline,
          size: 25.0,
          color: Colors.black,
        ),
        labelText: 'CONFIRM PASSWORD',
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 17.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password required';
        }

//        if (value != _password) {
//          return 'Password\'s don\'t match';
//        }

        return null;
      },
      onSaved: (String value) {
        _confirmPassword = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
//            color: Colors.yellow,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/papers_new.png'),
              fit: BoxFit.fill,
            ),
          ),
          height: media.height,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 20),
                child: Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 35.0,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 60.0),
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 37.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Container(
                  height: 350.0,
                  margin: EdgeInsets.only(top: 50.0),
                  child: Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 20),
                      child: Form(
                        key: _formKey2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            _buildName(),
                            _buildEmail(),
                            _buildPassword(),
                            _buildConfirmPassword(),
                          ],
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 28.0, top: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    GradientButton(
                      increaseHeightBy: 20,
                      increaseWidthBy: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Signup',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 30.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      callback: () {
                        if (!_formKey2.currentState.validate()) {
                          return;
                        }

                        _formKey2.currentState.save();

                        print(_email);
                        print(_password);
                      },
                      gradient: Gradients.tameer,
                    ),
                  ],
                ),
              ),
//              Spacer(),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Center(
                  child: InkWell(
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15.0,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sign in',
                            style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Yellow(),
                        ),
                      );
                    },
                  ),
                ),
              ),
//              SizedBox(
//                height: 5.0,
//              ),
            ],
          ),
        ),
      ),
    );
  }
}
