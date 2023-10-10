import 'package:flutter/material.dart';

import 'common/utils/button_utils.dart';
import 'common/utils/err_util.dart';
import 'common/utils/global_util.dart';
import 'common/utils/json_util.dart';
import 'common/views/foot.dart';
import 'common/views/top.dart';

// void main() {
//   //全局异常工具类
//   GlobalUtil.getGlobalUtil()?.setupErrorHandling();
//   return runApp(const MyApp());
// }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyApp> {
  List<String> items = [];
  int max = 0;
  final ScrollController _scrollController = ScrollController();

  //模拟加载数据
  @override
  void initState() {
    super.initState();
    fetchData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  Future<void> fetchData() async {
    // 模拟异步加载数据
    await Future.delayed(const Duration(seconds: 2));
    List<String> newData = [
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "0",
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "0"
    ];
    setState(() {
      items.addAll(newData);
      max++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: Top.getAppBar("倪浩"),
        body: ListView.builder(
          controller: _scrollController,
          itemCount: items.length + 1,
          itemBuilder: (context, index) {
            if (index < items.length) {
              // 显示数据项
              return ListTile(
                title: Text(items[index]),
              );
            } else {
              // 显示提示内容或加载等待动画
              return Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: max < 10
                    ? CircularProgressIndicator() // 显示加载等待动画
                    : Text(
                        max >= 10 ? '已加载完全部数据' : '正在加载更多数据...',
                        style: TextStyle(fontSize: 16.0),
                      ),
              );
            }
          },
        ),
        bottomNavigationBar: Foot.getBottomNavigationBar(),
        floatingActionButton:
            Buttons.getFloatingActionButton(() => print("object"), Icons.add),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: _shrineColorScheme,
    textTheme: _buildShrineTextTheme(base.textTheme),
  );
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        bodySmall: base.bodySmall?.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
        labelLarge: base.labelLarge?.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: shrineBrown900,
        bodyColor: shrineBrown900,
      );
}

const ColorScheme _shrineColorScheme = ColorScheme(
  primary: shrinePink100,
  secondary: shrinePink50,
  surface: shrineSurfaceWhite,
  background: shrineBackgroundWhite,
  error: shrineErrorRed,
  onPrimary: shrineBrown900,
  onSecondary: shrineBrown900,
  onSurface: shrineBrown900,
  onBackground: shrineBrown900,
  onError: shrineSurfaceWhite,
  brightness: Brightness.light,
);

const Color shrinePink50 = Color(0xFFFEEAE6);
const Color shrinePink100 = Color(0xFFFEDBD0);
const Color shrinePink300 = Color(0xFFFBB8AC);
const Color shrinePink400 = Color(0xFFEAA4A4);

const Color shrineBrown900 = Color(0xFF442B2D);
const Color shrineBrown600 = Color(0xFF7D4F52);

const Color shrineErrorRed = Color(0xFFC5032B);

const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;

const defaultLetterSpacing = 0.03;


class Person {
  String name;
  int age;
  String email;

  Person({required this.name, required this.age, required this.email});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name'],
      age: json['age'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'email': email,
    };
  }
}

void main() {
  Person person = Person(name: 'Fengfeng', age: 18, email: 'fengfeng@example.com');
  //json转换成字符串
  print(JsonUtils.encodeToJson(person));

  // 字符串转换成json
  String personJsonStr = JsonUtils.encodeToJson(person);
  var decodeFromJson = JsonUtils.decodeFromJson<Person>(personJsonStr);
  print(decodeFromJson.age);

}