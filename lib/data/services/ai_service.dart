import 'dart:convert';

import 'package:firebase_ai/firebase_ai.dart';

class AiService {
  AiService();

  final model = FirebaseAI.googleAI().generativeModel(
      model: 'gemini-2.5-flash',
      systemInstruction: Content.text(
          'You are a medical expert specializing in physiotherapy. Provide accurate and detailed diagnoses and recommendations based on the given medical descriptions.'));

  final jsonSchema = Schema.object(
    properties: {
      'name': Schema.string(
        description: 'The name of the suspected condition',
        title: 'Condition Name',
      ),
      'diagnosis': Schema.string(
        description:
            'A detailed description of the physiotherapeautic diagnosis.',
        title: 'Diagnosis',
      ),
      'recommendation': Schema.string(
        description: 'A recommendation for the physiotherapy treatment.',
        title: 'Recommendation',
      ),
    },
  );

  Future<Map<String, dynamic>> diagnose(String description) async {
    Map<String, dynamic> finalResponse = {};
    try {
      final List<Content> promptContent = [
        Content.text(
          'Diagnose the following medical condition based on the description: $description',
        ),
      ];
      final response = await model.generateContent(
        promptContent,
        generationConfig: GenerationConfig(
            responseSchema: jsonSchema, responseMimeType: 'application/json'),
      );
      response.text != null
          ? finalResponse = json.decode(response.text!)
          : finalResponse = {};
      if (finalResponse.isEmpty) {
        throw Exception('No diagnosis available');
      }
      return finalResponse;
    } catch (e) {
      throw Exception('AI diagnosis failed: ${e.toString()}');
    }
  }
}
