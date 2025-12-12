import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/budget/viewmodel/documents_viewmodel.dart';
import 'package:sceneary/presentation/call_sheets/widgets/customField.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DocumentsViewmodel(context: context),
      child: Consumer<DocumentsViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Documents",
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            prefixIcon: Icons.search,
                            hintText: "Search here",
                            verticalGap: 0,
                          ),
                        ),

                        const SizedBox(width: 10),

                        Container(
                          width: 47,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF3FB),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black12, width: 1),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              AppRouter.instance.push(
                                RoutePaths.selectDateFilterScreen,
                              );
                            },
                            child: Icon(
                              Icons.filter_alt,
                              size: 22,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: viewModel.users.length,
                      itemBuilder: (context, index) {
                        return profileTile(
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                          title: viewModel.users[index]["name"],
                          subtitle: viewModel.users[index]["docs"],
                          trailing: Icon(Icons.arrow_forward, size: 16),
                          onTap: () {
                            AppRouter.instance.push(
                              RoutePaths.documentDetailScreen,
                            );
                          },
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
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                ),
                child: trailing,
              ),
          ],
        ),
      ),
    );
  }
}
