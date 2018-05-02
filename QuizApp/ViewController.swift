import UIKit


class ViewController: UIViewController {
    
    //The UI Elements from the storyboard   are already linked up for you.
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    //Initialize variables
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false // default
    var questionNumber : Int = 0
    var score : Int = 0
    lazy var length:Int = {
        return self.allQuestions.list.count
    }()
   
    // This gets called when the UIViewController is loaded into memory when the app starts
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }

    //This gets called when the system is low on memory
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // called when either the true or false button is pressed.
    @IBAction func answerPressed(_ sender: AnyObject) {
    
        if sender.tag == 1 {
            pickedAnswer = true
        }
        
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer() // verify the answer with the pickedAnswer
        
        questionNumber = questionNumber + 1
        
        updateUI() // update the score and all view elements on screen
        
    }
    
    // This method will update all the views on screen (progress bar, score label, etc)
    func updateUI() {
        
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(length)) * CGFloat(questionNumber)
        
        progressLabel.text = String(questionNumber) + "/" + (String(length))
        
        scoreLabel.text = "Score: " + String(score)
      
        nextQuestion()
    }

    //This method will update the question text and check if we reached the end.
    func nextQuestion() {
        
        if questionNumber <= 12 {
            questionLabel.text = allQuestions.list[questionNumber].questionText
        }
        else {
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { UIAlertAction in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    //This method will check if the user has got the right answer.
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {

            ProgressHUD.showSuccess("Correct!")
            
            score = score + 1
        }
        else {
            
            ProgressHUD.showError("Wrong!")
        }
    }
    
    //This method will wipe the board clean, so that users can retake the quiz.
    func startOver() {
       
        questionNumber = 0
        score = 0
        
        updateUI()
        
    }
    
    
}   // End of the class

