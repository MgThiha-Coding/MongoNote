/*
class Repository {
  static const MONGO_URL =
      "mongodb+srv://nat183434:VKkouohbkPDbjUuN@cluster0.a619lvm.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";
  static const userCollection = "users";
}
*/
class Repository {
  static String MONGO_URL = '';
  static String userCollection = '';

  // Method to update the connection string and collection name dynamically
  static void setConnectionDetails(String uri, String collection) {
    MONGO_URL = uri;
    userCollection = collection;
  }
}
