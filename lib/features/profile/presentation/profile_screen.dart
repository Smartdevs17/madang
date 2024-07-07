import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madang/features/profile/presentation/payment_screen.dart';
import 'package:madang/features/profile/widget/profile_option.dart';
import 'package:madang/features/profile/widget/section_header.dart';
import 'package:madang/routes/bottom_nav_bar.dart';
import 'package:madang/routes/routes.dart';
import 'package:madang/utils/theme/theme.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorLT,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Profile",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: primaryColorDK,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        AssetImage('assets/images/photo profile.png'),
                  ),
                  const SizedBox(width: 20),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Promise Isaiah",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "isaiahpromise@gmail.com",
                        style: TextStyle(
                          fontSize: 16,
                          color: primaryColorDK,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: primaryColorDK),
                        onPressed: () {
                          // Navigate to Edit Profile screen
                        },
                      ),
                      const Text(
                        "Edit",
                        style: TextStyle(
                          fontSize: 16,
                          color: primaryColorDK,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    SectionHeader(title: "Account"),
                    ProfileOption(
                      icon: Icons.payment,
                      title: "Payment Method",
                      onTap: () {
                        // Navigate to Payment Method screen
                        Get.toNamed(Routes.paymentMethod);
                      },
                    ),
                    ProfileOption(
                      icon: Icons.shopping_cart,
                      title: "My Cart",
                      onTap: () {
                        // Navigate to My Cart screen
                        Get.toNamed(Routes.myCart);
                      },
                    ),
                    ProfileOption(
                      icon: Icons.help,
                      title: "Help & Report",
                      onTap: () {
                        // Navigate to Help & Report screen
                        Get.toNamed(Routes.helpAndReport);
                      },
                    ),
                    ProfileOption(
                      icon: Icons.language,
                      title: "Language",
                      onTap: () {
                        // Navigate to Language screen
                        Get.toNamed(Routes.language);
                      },
                    ),
                    ProfileOption(
                      icon: Icons.notifications,
                      title: "Notification",
                      onTap: () {
                        // Navigate to Notification screen
                        Get.toNamed(Routes.notification);
                      },
                    ),
                    SectionHeader(title: "More Info"),
                    ProfileOption(
                      icon: Icons.policy,
                      title: "Privacy Policy",
                      onTap: () {
                        // Navigate to Privacy Policy screen
                        Get.toNamed(Routes.privacyPolicy);
                      },
                    ),
                    ProfileOption(
                      icon: Icons.new_releases,
                      title: "News & Services",
                      onTap: () {
                        // Navigate to News & Services screen
                        Get.toNamed(Routes.newsAndServices);
                      },
                    ),
                    ProfileOption(
                      icon: Icons.star,
                      title: "Give Rating",
                      onTap: () {
                        // Navigate to Give Rating screen
                        Get.toNamed(Routes.giveRating);
                      },
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          // Handle Logout
                          Get.offAndToNamed(Routes.auth);
                        },
                        child: const Text(
                          "Logout",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(activeIndex: 3),
    );
  }
}
