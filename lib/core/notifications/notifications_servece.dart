import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

LocalNotification localNotification = LocalNotification();


const MethodChannel platform = MethodChannel('dexterx.dev/flutter_local_notifications_example');

class LocalNotification{

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings androidInitializationSettings;
  InitializationSettings initializationSettings;
  final BuildContext context;

  LocalNotification({this.context}){
    initializing();
    _configureLocalTimeZone();
  }

  Future<void> _configureLocalTimeZone() async {
    try {
      tz.initializeTimeZones();
      final String timeZoneName = await platform.invokeMethod<String>('getTimeZoneName');
      tz.setLocalLocation(tz.getLocation(timeZoneName));
    }  catch (e) {
      print(e);
    }
  }

  deleteNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> _notification(int id)async{
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        "$id",
        'name',
        'desc',
        enableVibration: false);
    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(10, 'Test', 'testing audio', notificationDetails);
  }

  void initializing() async {

    androidInitializationSettings = AndroidInitializationSettings('app_icon');
    initializationSettings = InitializationSettings(android: androidInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void showNotifications(int id)async{
    await _notification(id);
  }


  scheduleNotification({int id, String title, String body,DateTime time})async{
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(id.toString(),title,body,
      sound: RawResourceAndroidNotificationSound('r1'),
    );
    NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    if(time.isBefore(DateTime.now()))
      time = time.add(Duration(days: 10));
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        '$title',
        '$body',
        tz.TZDateTime.from(time, tz.local),
        platformChannelSpecifics,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
    print('scheduled Notification with date time ${time.toString()}');
  }

  scheduleDailyNotification({int id, String title, String body,DateTime time})async{
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(id.toString(),title,body,
        sound: RawResourceAndroidNotificationSound('r2'));
    NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    if(time.isBefore(DateTime.now()))
      time = time.add(Duration(days: 10));
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(time, tz.local),
        platformChannelSpecifics,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
    );
    print('scheduled Daily Notification with time ${time.hour.toString()+':'+time.minute.toString()}');
  }


  Future onDidReceiveLocalNotification(int id, String title, String body,String payLoad) async {
    showCupertinoDialog(context: context, builder: (_)=>CupertinoAlertDialog(
      title: Text(title),
      content: Text(body),
      actions: <Widget>[
        CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text("Okay"))
      ],
    ));
  }
}