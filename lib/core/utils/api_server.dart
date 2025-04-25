import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // ✅ Use your own local port or devtunnel/Cloudflare link
  // ⚠️ Replace this with your actual local or live API endpoint
  final String baseUrl = "https://summit-violent-alert-katie.trycloudflare.com";

  Future<dynamic> post({
    required String url,
    required dynamic body,
    String? token,
  }) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/$url'),
        body: jsonEncode(body),
        headers: headers,
      );

      print("🔁 Request URL: $baseUrl/$url");
      print("📨 Request Body: ${jsonEncode(body)}");
      print("📨 Headers: $headers");
      print("📨 Response Status: ${response.statusCode}");
      print("📨 Response Body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized - Check your email or password.");
      } else if (response.statusCode == 500) {
        throw Exception("Internal Server Error - Try again later.");
      } else {
        throw Exception("Error: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      print("❌ Network or Parsing Error: $e");
      throw Exception("Failed to connect to server: $e");
    }
  }
}
