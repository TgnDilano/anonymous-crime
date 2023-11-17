enum AppRoutes {
  loginPage(
    name: "loginPage",
    path: "/loginPage",
  ),

  homenPage(
    name: "homePage",
    path: "/homePage",
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
