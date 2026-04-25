import 'dart:convert';
import 'dio_client.dart';
import 'api_endpoints.dart';

extension GeminiExtension on DioClient {
  Future<Map<String, dynamic>> parseTask({
    required String text,
    required String apiKey,
  }) async {
    final today = DateTime.now().toIso8601String().split("T").first;
    final body = {
      "contents": [
        {
          "parts": [
            {
              "text":
                  """
You are a strict task extraction engine.

Today date is: $today

Extract a task from the sentence and return JSON only.

Sentence:
$text

Valid output format:
{
 "task": "",
 "assignee": "",
 "due_date": ""
}

If extraction fails for ANY reason return:
{
 "error": true,
 "message": "could not extract task"
}

Failure conditions (return error):
- empty sentence
- unclear speech
- noise only
- no task mentioned
- no assignee mentioned
- no actionable instruction
- sentence is general talk
- multiple conflicting tasks
- missing key information
- cannot determine due date
- non-english unclear content
- AI not confident in extraction

Strict rules:
- return JSON only
- no markdown
- no explanation
- no extra text
- no additional keys
- English only
- due_date format YYYY-MM-DD
- assignee must be a person's name
- task must be actionable
- if any field is uncertain return error
- do NOT guess
- do NOT hallucinate
- do NOT fill defaults
""",
            },
          ],
        },
      ],
    };

    final response = await dio.post(
      "${ApiEndpoints.baseUrl}?key=$apiKey",
      data: body,
    );

    final result =
        response.data['candidates'][0]['content']['parts'][0]['text'];

    return jsonDecode(result);
  }
}
