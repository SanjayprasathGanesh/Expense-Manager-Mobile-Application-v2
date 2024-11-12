import 'package:auto_route/auto_route.dart';
import 'package:expense_manager/auto_route/app_routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class Personal extends StatefulWidget {
  const Personal({super.key});

  @override
  State<Personal> createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf7ede2),
      body: Center(
        child: Container(
          width: ResponsiveBreakpoints.of(context).isDesktop
              ? ResponsiveBreakpoints.of(context).screenWidth * 0.5
              : ResponsiveBreakpoints.of(context).isTablet
                  ? ResponsiveBreakpoints.of(context).screenWidth * 1.5
                  : ResponsiveBreakpoints.of(context).screenWidth,
          height: ResponsiveBreakpoints.of(context).isDesktop
              ? ResponsiveBreakpoints.of(context).screenHeight * 0.8
              : ResponsiveBreakpoints.of(context).isTablet
                  ? ResponsiveBreakpoints.of(context).screenHeight * 0.9
                  : ResponsiveBreakpoints.of(context).screenHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                padding: const EdgeInsets.all(15.0),
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    context.router.push(const MyDiary());
                  },
                  child: Column(
                    children: [
                      const Text(
                        "Personal Dairy",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.purple,
                            fontFamily: 'Poppins',
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        height: 200,
                        child: Image.asset(
                          'images/personal_diary.jpeg',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        "The new feature offers users a platform to document their daily personal experiences and reflections, essentially creating a digital diary within the app. It encourages introspection and self-awareness, allowing users to ponder over their thoughts, feelings, and actions. By capturing the essence of each day, users can preserve memories and moments, fostering emotional expression and well-being. Regular reflection may lead to valuable insights and personal growth, shaping each user's unique life story as they cherish and reflect upon the moments, emotions, and insights that shape their daily existence  ->  ",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                padding: const EdgeInsets.all(15.0),
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    context.router.push(const MyLeaves());
                  },
                  child: Column(
                    children: [
                      const Text(
                        "Leave Tracker",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontFamily: 'Poppins',
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        height: 200,
                        child: Image.asset(
                          'images/leave.jpg',
                          fit: BoxFit.fitHeight,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        "The leave tracker is a crucial tool tailored for effective management and oversight of an individual's time off. It facilitates seamless recording and monitoring of leave days, offering users a comprehensive view of their available time for leisure, vacations, or personal commitments. Its user-friendly interface simplifies the process of requesting and approving leaves, fostering efficient communication between users and supervisors. By centralizing leave management, this feature streamlines administrative tasks, enhances transparency, and empowers users to plan their time off more effectively, ultimately contributing to a more organized and productive work environment -> ",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
