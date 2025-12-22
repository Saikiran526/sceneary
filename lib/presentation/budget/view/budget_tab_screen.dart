import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/budget/viewmodel/budget_tab_viewmodel.dart';
import 'package:sceneary/presentation/project_details/utils.dart';

class BudgetTabScreen extends StatelessWidget {
  const BudgetTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (_) => BudgetTabViewmodel(context: context),
      child: Consumer<BudgetTabViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: Colors.transparent,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF090216), Color(0xFF9D306A)],
                  ),
                ),
              ),
              title: Text(
                "Budget",
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              elevation: 0,
              actions: [
                GestureDetector(
                  onTap: () => servicePopUpMenu(context),

                  child: Padding(
                    padding: EdgeInsets.only(right: width * 0.04),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SvgPicture.asset(AssetsPath.menuImg),
                    ),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: 339,
                        height: 36,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE6E6E6),
                          borderRadius: BorderRadius.circular(26),
                        ),
                        child: Row(
                          children: List.generate(viewModel.tabs.length, (
                            index,
                          ) {
                            bool isSelected = viewModel.selectedIndex == index;
                            return Expanded(
                              child: GestureDetector(
                                onTap: () => viewModel.changeTab(index),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Color(0XFF1D55A8)
                                        : Color(0XFFC3D6F4),
                                    borderRadius: BorderRadius.circular(26),
                                  ),
                                  child: Text(
                                    viewModel.tabs[index],
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Text(
                          "Budget Overview",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 20 / 14,
                            letterSpacing: 0.01 * 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0XFFF9EAF5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: 100,
                                width: 100,
                                child: budgetDonutChart(60, 100),
                              ),
                            ),
                            const SizedBox(width: 18),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _infoTextBlock(
                                    title: "Total Budget",
                                    value: "₹ 10 CR",
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      _infoTextBlock(
                                        title: "Spent",
                                        value: "₹.3.5 Cr",
                                      ),
                                      const SizedBox(width: 10),
                                      _infoTextBlock(
                                        title: "Remaining",
                                        value: "₹ 6.5 Cr",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Text(
                          "Quick Actions",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 20 / 14,
                            letterSpacing: 0.01 * 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _menuCard(icon: Icons.add, title: "Add Budget"),
                        _menuCard(
                          icon: Icons.download,
                          title: "Download Sheet",
                        ),
                        _menuCard(icon: Icons.upload, title: "Upload Sheet"),
                      ],
                    ),
                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Documents",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 20 / 14,
                            letterSpacing: 0.01 * 14,
                            color: Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            AppRouter.instance.push(RoutePaths.documentsScreen);
                          },
                          child: Text(
                            "View All",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 20 / 14,
                              letterSpacing: 0.01 * 14,
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    profileTile(
                      leading: CircleAvatar(
                        radius: 20,
                        child: Image.asset(AssetsPath.men1, fit: BoxFit.cover),
                      ),

                      title: "Rajesh Kumar",
                      subtitle: "Total Documents Uploaded - 12",
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 16,
                      ),
                      onTap: () {
                        AppRouter.instance.push(
                          RoutePaths.documentDetailScreen,
                        );
                      },
                    ),
                    profileTile(
                      leading: CircleAvatar(
                        radius: 20,
                        child: Image.asset(AssetsPath.men1, fit: BoxFit.cover),
                      ),
                      title: "Rajesh Kumar",
                      subtitle: "Total Documents Uploaded - 12",
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 16,
                      ),
                      onTap: () {
                        AppRouter.instance.push(
                          RoutePaths.documentDetailScreen,
                        );
                      },
                    ),
                    profileTile(
                      leading: CircleAvatar(
                        radius: 20,
                        child: Image.asset(AssetsPath.men1, fit: BoxFit.cover),
                      ),
                      title: "Rajesh Kumar",
                      subtitle: "Total Documents Uploaded - 12",
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 16,
                      ),
                      onTap: () {
                        AppRouter.instance.push(
                          RoutePaths.documentDetailScreen,
                        );
                      },
                    ),
                    profileTile(
                      leading: CircleAvatar(
                        radius: 20,
                        child: Image.asset(AssetsPath.men1, fit: BoxFit.cover),
                      ),
                      title: "Rajesh Kumar",
                      subtitle: "Total Documents Uploaded - 12",
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 16,
                      ),
                      onTap: () {
                        AppRouter.instance.push(
                          RoutePaths.documentDetailScreen,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget profileTile({
    required Widget leading,
    required String title,
    required String subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF3FB),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0XFFECB5D9), width: 1),
        ),
        child: Row(
          children: [
            leading,
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Color(0XFF000000),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      color: Color(0XFF000000),
                    ),
                  ),
                ],
              ),
            ),

            if (trailing != null)
              Container(
                width: 29,
                height: 29,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0XFF1D55A8),
                  shape: BoxShape.circle,
                ),
                child: trailing,
              ),
          ],
        ),
      ),
    );
  }

  Widget _infoTextBlock({required String title, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            height: 20 / 12,
            letterSpacing: 0.01,
            color: Color(0XFFB0B0B0),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
            fontSize: 12,
            height: 20 / 12,
            letterSpacing: 0.01,
            color: Color(0xFF252525),
          ),
        ),
      ],
    );
  }

  Widget budgetDonutChart(double used, double total) {
    double remaining = total - used;
    return PieChart(
      PieChartData(
        sectionsSpace: 0,
        centerSpaceRadius: 40,
        startDegreeOffset: -90,
        sections: [
          PieChartSectionData(
            value: used,
            color: Colors.green,
            radius: 22,
            showTitle: false,
          ),
          PieChartSectionData(
            value: remaining,
            color: Colors.grey.shade300,
            radius: 22,
            showTitle: false,
          ),
        ],
        centerSpaceColor: Colors.white,
      ),
    );
  }

  Widget _menuCard({required IconData icon, required String title}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: const Color(0XFFF4D6EA),
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFF9D306A),
                  borderRadius: BorderRadius.circular(6),
                ),
                alignment: Alignment.center,
                child: Icon(icon, size: 18, color: Colors.white),
              ),
              const SizedBox(height: 6),

              Text(
                title,
                style: GoogleFonts.montserrat(
                  decoration: TextDecoration.underline,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: const Color(0XFF1D55A8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
