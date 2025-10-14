import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class OpenAIServicio {
  // ⚙️ Coloca aquí tu clave de OpenAI
  static const String _apiKey = 'TU_API_KEY_AQUI';
  static const String _apiUrl = 'https://api.openai.com/v1/responses';

  /// Analiza una imagen con OpenAI para verificar si contiene una mascota o si es apropiada.
  static Future<bool> validarImagen(File imagen) async {
    try {
      final bytes = await imagen.readAsBytes();
      final base64 = base64Encode(bytes);

      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: {
          'Authorization': 'Bearer $_apiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "model": "gpt-4.1-mini",
          "input": [
            {
              "role": "user",
              "content": [
                {
                  "type": "input_text",
                  "text":
                      "Describe brevemente esta imagen. Solo responde con una palabra: 'mascota' si aparece un animal doméstico o 'no' si no.",
                },
                {
                  "type": "input_image",
                  "image_url": "data:image/jpeg;base64,$base64",
                },
              ],
            },
          ],
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final texto = data['output'][0]['content'][0]['text']
            .toString()
            .toLowerCase();

        // ✅ Consideramos válida si el modelo detecta "mascota"
        return texto.contains("mascota") || texto.contains("animal");
      } else {
        print("❌ Error en API OpenAI: ${response.statusCode} ${response.body}");
        return false;
      }
    } catch (e) {
      print("❌ Error validando imagen con OpenAI: $e");
      return false;
    }
  }
}
