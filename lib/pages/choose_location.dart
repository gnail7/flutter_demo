import 'package:flutter/material.dart';
import 'package:pad_mes/common/request.dart'; // 确保此路径正确

class ChooseLocation extends StatefulWidget {
  final String? name;
  const ChooseLocation({super.key, this.name});
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  late List<dynamic> roles = [];

  @override
  void initState() {
    super.initState();
    fetchData(); // 初始化数据
  }

  // 获取数据的方法
  void fetchData() async {
    print("发起请求");
    var responseData = await HttpApi.request('/getRoles');
    setState(() {
      roles: responseData['data']['list'];
    });
 }

 void navigateToCounterPage() {
  Navigator.pushNamed(context, '/counter');
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child:
                ImageSection(
                  image: 'images/dino.jpg',
                ),
            ),
            Expanded(
                flex:2,
                child:
                  Column(
                    children: [
                      const TitleSection(
                        name: 'Oeschinen Lake Campground',
                        location: 'Kandersteg, Switzerland',
                      ),
                      BtnSection(),
                      const TextSection(description: 'In the body property, replace the Center widget with a SingleChildScrollView widget. Within the SingleChildScrollView widget, replace the Text widget with a Column widget.',)
                    ],
                  )
            ),
          ],
        ),
      )
    );
  }
}

class ImageSection extends StatelessWidget {
  ImageSection({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Image.asset(image, fit: BoxFit.cover,);
  }
}


class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location,
  });

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );
  }
}

class BtnSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32),
      child: Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BtnWithText(label: 'Phone', icon: Icons.phone),
              BtnWithText(label: 'Location', icon: Icons.location_city),
              BtnWithText(label: 'Email', icon: Icons.email),
            ],
          )
      ),
    );
  }
}

class BtnWithText extends StatelessWidget {
  const BtnWithText({super.key, required this.label, required this.icon});
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Icon(icon),
        Text(label)
    ],
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});

  final String description;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        description,
        softWrap: true,
      ),
    );
  }
}