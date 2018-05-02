import Foundation

class QuestionBank {
    
    var list = [Question]()
    var length: Int
    init() {
        // Creating a quiz item and appending it to the list
        let item = Question(text: "The JRE deletes objects when it determines that they are no longer being used. This process is called Garbage Collection.", correctAnswer: true)
        
        // Add the Question to the list of questions
        list.append(item)
        
        // skipping one step and just creating the quiz item inside the append function
        list.append(Question(text: "int x[] = new int[]{10,20,30}; Arrays can also be created and initialize as in above statement.", correctAnswer: true))
        
        list.append(Question(text: "Garbage Collection is manual process.", correctAnswer: false))
        
        list.append(Question(text: "Constructor overloading is not possible in Java.", correctAnswer: false))
        
        list.append(Question(text: "Assignment operator is evaluated Left to Right.", correctAnswer: false))
        
        list.append(Question(text: "All binary operators except for the assignment operators are evaluated from Left to Right.", correctAnswer: true))
        
        list.append(Question(text: "Java programming is not statically-typed, means all variables should not first be declared before they can be used.", correctAnswer: false))
        
        list.append(Question(text: "Variable name can begin with a letter, \"$\", or \"_\".", correctAnswer: true))
        
        list.append(Question(text: "A .class file contains bytecodes?", correctAnswer: true))
        
        list.append(Question(text: "Java technology is both a programming language and a platform.", correctAnswer: true))
        
        list.append(Question(text: "consider the statement \"x = (a > b) ? a : b\"; then the value of x is 27, if a = 18 and b = 27.", correctAnswer: true))
        
        list.append(Question(text: "The \"switch\" selection structure must end with the default case.", correctAnswer: false))
        
        list.append(Question(text: "A break statement must always be present in the default case of a \"switch\" selection structure.", correctAnswer: false))
        
         self.length = list.count
    }
}


