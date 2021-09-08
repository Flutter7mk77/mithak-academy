import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/localization/language_constants.dart';
import 'package:flutter_ecommerce_app/utilites/toolsUtilities.dart';

class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  //The controls of Text Editing
  TextEditingController nameTextControl = TextEditingController();
  TextEditingController phoneTextControl = TextEditingController();
  TextEditingController messageTitleTextControl = TextEditingController();
  TextEditingController contentTextControl = TextEditingController();

  @override
  void dispose() {
    nameTextControl.dispose();
    phoneTextControl.dispose();
    messageTitleTextControl.dispose();
    contentTextControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ToolsUtilities.whiteColor,
      appBar: AppBar(
        title: Text(getTranslated(context, "تواصل معنا")),
        backgroundColor: ToolsUtilities.mainColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: _contactUSCard(),
      ),
    );
  }

  Widget customTextField(
      String hitName, TextEditingController textEditingControl, int maxLine) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30, top: 8),
      child: Container(
          child: TextField(
        maxLines: maxLine,
        controller: textEditingControl,
        decoration: InputDecoration(
          hoverColor: ToolsUtilities.secondColor,
          focusColor: ToolsUtilities.secondColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ToolsUtilities.mainColor),
          ),
          labelText: hitName,
          labelStyle: TextStyle(color: ToolsUtilities.secondColor),
        ),
      )),
    );
  }

  Widget _contactUSCard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/logo.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(0),
          ),
        ),

        //name Of our Company or Brand
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 15),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0, top: 10),
          child: Text(
            getTranslated(context, "سـعداء لتلقي رسائلكـم"),
            style: TextStyle(color: ToolsUtilities.secondColor, fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        customTextField(
            getTranslated(context, "اكتب اسمك"), nameTextControl, 1),
        customTextField(
            getTranslated(context, "رقم هاتفك"), phoneTextControl, 1),
        customTextField(getTranslated(context, "عنوان الرسالة"),
            messageTitleTextControl, 1),
        customTextField(
            getTranslated(context, "محتوي الرسالة"), contentTextControl, 4),

        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            alignment: Alignment.bottomRight,
            width: MediaQuery.of(context).size.width * 0.65,
            // ignore: deprecated_member_use
            child: RaisedButton(
              onPressed: () {},
              color: ToolsUtilities.mainColor,
              elevation: 5,
              // ignore: deprecated_member_use
              child: FlatButton.icon(
                  onPressed: () {
                    //Call Us via email
                    var myEmail = ToolsUtilities.email;
                    String subject = messageTitleTextControl.text;
                    String body = "My Name is :" +
                        nameTextControl.text +
                        "\n " +
                        " My Phone Number is: " +
                        phoneTextControl.text +
                        "\n " +
                        contentTextControl.text;
                    String mailUrl = Uri.encodeFull(
                        'mailto:$myEmail?subject=$subject&body=$body');
                    customURlLaunch(mailUrl);

                    nameTextControl.text = '';
                    phoneTextControl.text = '';
                    messageTitleTextControl.text = '';
                    contentTextControl.text = '';
                  },
                  icon: Icon(
                    Icons.email,
                    color: ToolsUtilities.whiteColor,
                  ),
                  label: Text(
                    getTranslated(context, "إرسال"),
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: ToolsUtilities.whiteColor),
                  )),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
