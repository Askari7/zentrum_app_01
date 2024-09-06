class Question {
  final String? head;
  final String text;
  final List<String> options; // E.g., ['Yes', 'No']
  final bool Function(Map<String, String>) shouldShow; // Function to determine visibility
  final Function(Map<String, String>)? customComponent; // Function to render a custom component

  Question({
    this.head,
    required this.text,
    required this.options,
    required this.shouldShow,
    this.customComponent, // Optional custom component
  });
}