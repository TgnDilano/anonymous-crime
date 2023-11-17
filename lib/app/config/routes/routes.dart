enum AppRoutes {
  loginPage(
    name: "loginPage",
    path: "/loginPage",
  ),

  messagePage(
    name: "messagePage",
    path: "/messagePage",
  ),

  dashboardPage(
    name: "Dashboard",
    path: "/dashboard-Page",
  ),

  reportCase(
    name: "Report Case",
    path: "/reportCase-Page",
  ),

  messages(
    name: "Messages",
    path: "/messages-Page",
  ),

  uploadObjectiveFiles(
    name: "uploadObjectiveFiles",
    path: "upload-Objective-Files",
  );

  final String name;
  final String path;

  const AppRoutes({
    required this.name,
    required this.path,
  });
}
