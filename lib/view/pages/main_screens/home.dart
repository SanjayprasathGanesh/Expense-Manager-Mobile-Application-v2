import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expense_manager/auto_route/app_routes.gr.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> images = [
    'images/slider_1.jpg',
    'images/slider_2.png',
    'images/slider_3.png',
    'images/slider_4.jpg',
    'images/slider_5.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffe5ec),
      body: Center(
        child: Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(7.0),
            width: ResponsiveBreakpoints.of(context).isDesktop
                ? ResponsiveBreakpoints.of(context).screenWidth * 0.8
                : ResponsiveBreakpoints.of(context).isTablet
                    ? ResponsiveBreakpoints.of(context).screenWidth * 0.9
                    : ResponsiveBreakpoints.of(context).screenWidth,
            height: ResponsiveBreakpoints.of(context).isDesktop
                ? ResponsiveBreakpoints.of(context).screenHeight * 0.8
                : ResponsiveBreakpoints.of(context).isTablet
                    ? ResponsiveBreakpoints.of(context).screenHeight * 0.7
                    : ResponsiveBreakpoints.of(context).screenHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 350,
                    child: CarouselSlider(
                        items: [
                          for (int i = 0; i < images.length; i++)
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              height: 80,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(images[i]),
                                fit: BoxFit.fitHeight,
                                filterQuality: FilterQuality.high,
                              )),
                            )
                        ],
                        options: CarouselOptions(
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 4),
                          autoPlayAnimationDuration: const Duration(seconds: 4),
                          autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                          animateToClosest: true,
                        )),
                  ),
                  ListTile(
                    title: Column(
                      children: [
                        Container(
                          height: 400,
                          width: kIsWeb ? 600 : double.infinity,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('images/home1.png'),
                            fit: BoxFit.fill,
                          )),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          'Effortlessly manage your finances with our intuitive expense tracker. Stay in control by easily recording and categorizing your daily expenses. Gain valuable insights into your spending habits, allowing you to make informed financial decisions. Our user-friendly interface ensures a seamless experience, helping you track your money with convenience. Start your journey towards financial wellness today!',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 2.0,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ListTile(
                    title: Column(
                      children: [
                        Container(
                          height: 400,
                          width: kIsWeb ? 600 : double.infinity,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('images/home2.png'),
                            fit: BoxFit.fill,
                          )),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          'Unlock financial freedom with our cutting-edge expense tracker. Seamlessly monitor your spending patterns, set budget goals, and receive real-time updates on your financial health. Our secure platform ensures your data is protected while providing you with the tools you need for smarter money management. Take charge of your financial future and embark on a path towards financial success. Sign up now for a more prosperous tomorrow!',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 2.0,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ListTile(
                    title: Column(
                      children: [
                        Container(
                          height: 400,
                          width: kIsWeb ? 600 : double.infinity,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('images/home3.png'),
                            fit: BoxFit.fill,
                          )),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          'Transform your financial habits with our powerful expense tracker. Effortlessly track your expenditures, analyze trends, and make informed decisions to achieve your savings goals. Our user-friendly app simplifies budgeting, giving you the clarity and control you need for a more secure financial future. Take the first step towards financial empowerment – start tracking your expenses with ease today',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 2.0,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ListTile(
                    title: Column(
                      children: [
                        Container(
                          height: 400,
                          width: kIsWeb ? 600 : double.infinity,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('images/home4.png'),
                            fit: BoxFit.fill,
                          )),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          'Empower your financial journey with our comprehensive expense tracker. Gain a clear understanding of where your money goes, set personalized budgets, and watch your savings grow. Our intelligent features make tracking expenses a breeze, providing you with the insights needed to make sound financial decisions. Elevate your financial well-being – start using our expense tracker now and take control of your financial destiny.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 2.0,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
        backgroundColor: const Color(0xFFffb700),
        onPressed: () {
          showBottom();
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
          size: 25.0,
        ),
      ),
    );
  }

  showBottom() async {
    showModalBottomSheet(
        backgroundColor: const Color(0xFFf9dc5c),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        )),
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(10.0),
            height: ResponsiveBreakpoints.of(context).isDesktop
                ? ResponsiveBreakpoints.of(context).screenHeight * 0.5
                : ResponsiveBreakpoints.of(context).isTablet
                    ? ResponsiveBreakpoints.of(context).screenHeight * 0.4
                    : ResponsiveBreakpoints.of(context).screenHeight * 0.25,
            width: ResponsiveBreakpoints.of(context).isDesktop
                ? ResponsiveBreakpoints.of(context).screenWidth * 0.8
                : ResponsiveBreakpoints.of(context).isTablet
                    ? ResponsiveBreakpoints.of(context).screenWidth * 0.9
                    : ResponsiveBreakpoints.of(context).screenWidth,
            child: Column(
              children: [
                ListTile(
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        "Add Income",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    context.router.push(const AddIncome());
                  },
                ),
                const Divider(
                  height: 2.0,
                  thickness: 1.0,
                  color: Colors.black,
                ),
                ListTile(
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.account_balance_wallet),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        "Add Expense",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    context.router.push(const AddExpense());
                  },
                ),
                const Divider(
                  height: 2.0,
                  thickness: 1.0,
                  color: Colors.black,
                ),
                ListTile(
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.interests_outlined),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        "View Incomes",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    context.router.push(const MyIncomes());
                  },
                ),
                const Divider(
                  height: 2.0,
                  thickness: 1.0,
                  color: Colors.black,
                ),
              ],
            ),
          );
        });
  }
}
