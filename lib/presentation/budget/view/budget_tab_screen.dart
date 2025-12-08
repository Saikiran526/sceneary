import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/presentation/budget/viewmodel/budget_tab_viewmodel.dart';

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
              title: Text(
                "Budget",
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              actions: [
                GestureDetector(
                  onTap: () {
                    // Add your popup menu logic here
                  },
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
                    // Tab Bar
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
                                        ? Colors.black
                                        : Colors.transparent,
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

                    // Budget Overview Title
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

                    // Budget Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(16),
                      ),
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
                                  value: "4567",
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    _infoTextBlock(
                                      title: "Spent",
                                      value: "Rs.45678",
                                    ),
                                    const SizedBox(width: 10),
                                    _infoTextBlock(
                                      title: "Remaining",
                                      value: "456789",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Quick Actions Title
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

                    // Quick Actions Cards
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _menuCard(icon: Icons.person, title: "Cast"),
                        _menuCard(icon: Icons.work, title: "Crew"),
                        _menuCard(icon: Icons.location_on, title: "Location"),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Documents Section
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
                          onTap: () {},
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

                    // Profile Tiles
                    profileTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      title: "John Doe",
                      subtitle: "Lead Actor",
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {},
                    ),
                    profileTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      title: "Jane Smith",
                      subtitle: "Director",
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {},
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

  // --- HELPERS ---

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
          border: Border.all(color: Colors.black12, width: 1),
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
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Color(0xFF252525),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFB0B0B0),
                    ),
                  ),
                ],
              ),
            ),
            if (trailing != null) trailing,
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
          style: const TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            fontSize: 12,
            height: 20 / 12,
            letterSpacing: 0.01,
            color: Color(0xFFB0B0B0),
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
        centerSpaceRadius: 35,
        startDegreeOffset: -90,
        sections: [
          PieChartSectionData(value: used, color: Colors.black, radius: 28),
          PieChartSectionData(
            value: remaining,
            color: Colors.grey.shade300,
            radius: 28,
          ),
        ],
        centerSpaceColor: Colors.white,
      ),
    );
  }

  Widget _menuCard({required IconData icon, required String title}) {
    return Expanded(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
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
            Icon(icon, size: 32, color: Colors.black),
            const SizedBox(height: 6),
            Text(
              title,
              style: const TextStyle(
                decoration: TextDecoration.underline,
                fontFamily: "Poppins",
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF252525),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
