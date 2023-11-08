class questions_quiz{
  const questions_quiz(this.questions,this.answers);
  final String questions;
  final List<String> answers;

  List<String> shuffle(){
    final shufflelist = List.of(answers);
    shufflelist.shuffle(); 
    return shufflelist;
  }
}