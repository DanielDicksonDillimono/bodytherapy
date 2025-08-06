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
        description: 'A recommendation for the physiotherapeautic treatment.',
        title: 'Recommendation',
      ),
      'citations': Schema.array(
        items: Schema.string(
          description: 'Citations for the diagnosis and recommendations.',
          title: 'Citations',
        ),
        description:
            'List of citations supporting the diagnosis and recommendations.',
        title: 'Citations List',
      ),
      'exercises': Schema.array(
        items: Schema.object(
          properties: {
            'name': Schema.string(
              description: 'The name of the recommended exercise.',
              title: 'Exercise Name',
            ),
            'description': Schema.string(
              description: 'A detailed description of the exercise.',
              title: 'Exercise Description',
            ),
            'youtubeLink': Schema.string(
              description:
                  'A link to a YouTube video demonstrating the exercise.',
              title: 'YouTube Link',
            ),
            'target': Schema.string(
              description:
                  'The target muscle group for the exercise. Use a maximum of two words to describe the target muscle group.',
              title: 'Target Muscle Group',
            ),
          },
        ),
        description: 'Recommended exercises for the condition.',
        title: 'Exercises List',
      ),
    },
  );

  Future<Map<String, dynamic>> diagnose({
    required String description,
    required String priorActivityDescription,
    required String affectedArea,
  }) async {
    Map<String, dynamic> finalResponse = {};
    try {
      final List<Content> promptContent = [
        Content.text(
          'Diagnose the following medical condition based on the description: $description, prior activity: $priorActivityDescription, affected area: $affectedArea. Provide a detailed diagnosis and recommendation, including a list of recommended exercises with their names, descriptions, YouTube links, and target muscle groups. Include citations for the diagnosis and recommendations.',
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
