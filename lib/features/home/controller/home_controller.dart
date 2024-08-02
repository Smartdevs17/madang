import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool loading = RxBool(false);
  RxBool error = RxBool(false);
  RxString searchQuery = RxString('');
  // RxList<DocumentModel> documents = RxList<DocumentModel>(<DocumentModel>[]);
  // // Add search results observable
  // RxList<DocumentModel> searchResults =
  //     RxList<DocumentModel>(<DocumentModel>[]);

  // /// Add Documents to State
  // void processDocumentsToState(dynamic data) {
  //   final List docs = data.toList();
  //   documents.clear(); // Clear existing documents before adding new ones
  //   for (int i = 0; i < docs.length; i++) {
  //     documents.add(
  //       DocumentModel.fromMap(
  //         <String, dynamic>{...docs[i]},
  //       ),
  //     );
  //   }
  // }

  // /// Initialize Documents
  // Future<void> initDocuments() async {
  //   loading(true);
  //   error(false);
  //   update();
  //   try {
  //     final SharedPreferences prefs = await SharedPreferences.getInstance();
  //     var userId = prefs.getString(Constants.userId);
  //     final ApiResponseModel response =
  //         await DocumentRepository.fetchUserDocuments(id: userId!);
  //     if (response.success) {
  //       processDocumentsToState(response.data);
  //     } else {
  //       error(true);
  //     }
  //   } catch (e) {
  //     error(true);
  //   } finally {
  //     loading(false);
  //     update();
  //   }
  // }

  // // Create Document Controller (Register New Document to Remote Data Source)
  // Future<void> createDocument(Map<String, dynamic> body) async {
  //   loading(true);
  //   error(false);
  //   update();
  //   try {
  //     final ApiResponseModel response =
  //         await DocumentRepository.createDocument(body);
  //     if (response.success) {
  //       showSnackbar(
  //           title: 'Success!', message: response.message, error: false);
  //       documents.add(DocumentModel.fromMap(response.data));
  //       Get.toNamed(Routes.home);
  //     } else {
  //       showSnackbar(title: 'OOPS!', message: response.message, error: true);
  //       error(true);
  //     }
  //   } catch (e) {
  //     showSnackbar(title: 'OOPS!', message: e.toString(), error: true);
  //     error(true);
  //   } finally {
  //     loading(false);
  //     update();
  //   }
  // }

  // // Delete Document From Remote Source and State
  // Future<void> deleteDocument(int id) async {
  //   loading(true);
  //   error(false);
  //   update();
  //   try {
  //     final ApiResponseModel response =
  //         await DocumentRepository.deleteDocument(id);
  //     if (response.success) {
  //       showSnackbar(
  //           title: 'Success!', message: response.message, error: false);
  //       documents.removeWhere((element) => element.id == id);
  //       Get.toNamed(Routes.document);
  //     } else {
  //       showSnackbar(title: 'OOPS!', message: response.message, error: true);
  //       error(true);
  //     }
  //   } catch (e) {
  //     showSnackbar(title: 'OOPS!', message: e.toString(), error: true);
  //     error(true);
  //   } finally {
  //     loading(false);
  //     update();
  //   }
  // }

  // // Update Document in Remote Source and State
  // Future<void> updateDocument(
  //     int id, Map<String, dynamic> updatedDocument) async {
  //   loading(true);
  //   error(false);
  //   update();
  //   try {
  //     final ApiResponseModel response =
  //         await DocumentRepository.updateDocument(id, updatedDocument);
  //     if (response.success) {
  //       showSnackbar(
  //           title: 'Success!', message: response.message, error: false);

  //       // Find the document in the list and update it
  //       int index = documents.indexWhere((doc) => doc.id == id);

  //       if (index != -1) {
  //         documents[index] = DocumentModel.fromMap(response.data);
  //       }

  //       Get.toNamed(Routes.document);
  //     } else {
  //       showSnackbar(title: 'OOPS!', message: response.message, error: true);
  //       error(true);
  //     }
  //   } catch (e) {
  //     showSnackbar(title: 'OOPS!', message: e.toString(), error: true);
  //     error(true);
  //   } finally {
  //     loading(false);
  //     update();
  //   }
  // }

  // // Search Documents
  // void searchDocuments(String query) async {
  //   if (query.isNotEmpty) {
  //     Get.toNamed(Routes.search); // Navigate to SearchScreen
  //     searchQuery.value = query;
  //     loading(true);
  //     error(false);
  //     update();
  //     try {
  //       final ApiResponseModel response =
  //           await DocumentRepository.searchUserDocuments(query: query);
  //       if (response.success) {
  //         processSearchDocumentsToState(response.data);
  //         loading(false);
  //       } else {
  //         error(true);
  //         loading(false);
  //       }
  //     } catch (e) {
  //       error(true);
  //     } finally {
  //       loading(false);
  //       update();
  //     }
  //   }
  // }

  // /// Add Documents to State
  // void processSearchDocumentsToState(dynamic data) {
  //   final List docs = data.toList();
  //   // Reset search results if query is empty
  //   searchResults.clear();
  //   for (int i = 0; i < docs.length; i++) {
  //     searchResults.add(
  //       DocumentModel.fromMap(
  //         <String, dynamic>{...docs[i]},
  //       ),
  //     );
  //   }
  // }

  @override
  void onInit() {
    super.onInit();
    // initDocuments();
  }

  @override
  void onReady() {
    super.onReady();
    // initDocuments(); // Ensure documents are fetched every time the screen is ready
  }
}
