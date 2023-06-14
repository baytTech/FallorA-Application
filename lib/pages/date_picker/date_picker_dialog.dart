
import 'package:fallora/injection.dart';
import 'package:fallora/pages/date_picker/date_picker_viewmodel.dart';
import 'package:fallora/widgets/fallora_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class BirthDatePickerDialog extends StatefulWidget {
  @override
  _BirthDatePickerDialogState createState() => _BirthDatePickerDialogState();
}

class _BirthDatePickerDialogState extends State<BirthDatePickerDialog> {
  DateTime? selectedDate = DateTime.now();
  
  DatePickerViewModel viewModel =  DatePickerViewModel(functionsRepo: getIt.get());
  get textStyle => GoogleFonts.nunito(fontSize: 17,fontWeight: FontWeight.w400,color: Colors.white70);

  get textStyleMini => GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.white70);

  bool start1 = false;
  bool start2 = false;
  bool start3 = false;
  
  @override
  void initState() {
    super.initState();
    Future.delayed(200.milliseconds,(){
        setState(() {
          start1 = true;
        });
      }
    );

    Future.delayed(2000.milliseconds,(){
        setState(() {
          start2 = true;
        });
      }
    );

    Future.delayed(3000.milliseconds,(){
        setState(() {
          start3 = true;
        });
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).popUntil((route) => route.isFirst);
        return true;
      },
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.all(0.0),
        child: Stack(
          clipBehavior: Clip.none, 
          alignment: Alignment.center,
          children: <Widget>[
            GlassContainer(
              padding: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              borderRadius: BorderRadius.circular(15),
              blur: 15,
              alignment: Alignment.center,
              borderGradient: LinearGradient(
                colors: [Colors.white.withOpacity(0.2), Colors.white.withOpacity(0.05)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              gradient: LinearGradient(
                colors: [Color(0xFFffffff).withOpacity(0.1), Color(0xFFffffff).withOpacity(0.1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/Fallora_narrow.png',
                    height: 40,
                    fit: BoxFit.contain
                  ),
                  SizedBox(height: 30.0),
                  Row(
                    children: [
                      AnimatedOpacity(
                        opacity: start1 ? 1 : 0, 
                        duration: 4000.milliseconds,
                        child: Text("Merhaba :)",style: textStyle),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  AnimatedOpacity(
                    opacity: start2 ? 1 : 0, 
                    duration: 3000.milliseconds,
                    child: Text("Size özel ve doğru burç yorumları sunabilmemiz için doğum tarihinizi paylaşmanızı rica ediyoruz.",style: textStyle,),
                  ),
                  SizedBox(height: 20),
                  AnimatedOpacity(
                    opacity: start2 ? 1 : 0, 
                    duration: 3000.milliseconds,
                    child: Container(
                    height: 180,
                    child: CupertinoTheme(
                        data: CupertinoThemeData(
                          textTheme: CupertinoTextThemeData(dateTimePickerTextStyle: textStyle)
                        ),
                        child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.date,
                          initialDateTime: DateTime.now().subtract((23*365*24*60*60*1000).milliseconds),
                          maximumDate: DateTime.now(),
                          minimumDate: DateTime.now().subtract((100*365*24*60*60*1000).milliseconds),
                          onDateTimeChanged: (DateTime? a){
                              selectedDate = a;
                          }
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 100.0),
                  AnimatedOpacity(
                    opacity: start3 ? 1 : 0, 
                    duration: 4000.milliseconds,
                    child: FalloraButton(
                      title: "Onayla",
                      onPressed: () => viewModel.dialogCallback(context: context, timeMillis: selectedDate?.millisecondsSinceEpoch ?? 0)                  
                    ),
                  ),  
                  Spacer(),
                  AnimatedOpacity(
                    opacity: start3 ? 1 : 0, 
                    duration: 4000.milliseconds,
                    child: Text("Gizliliğiniz bizim için önemlidir. Doğum tarihiniz sadece kişiselleştirilmiş burç hikayelerinizi oluşturmak için kullanılacak ve gizli tutulacaktır.",style: textStyleMini),
                  ),  
        
                  SizedBox(height: 40.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}