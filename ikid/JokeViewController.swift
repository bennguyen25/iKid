//
//  JokeViewController.swift
//  ikid
//
//  Created by Ben Nguyen on 4/29/25.
//

import UIKit

class JokeViewController: UIViewController {
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var punchlineLabel: UILabel!
  
  var jokes: [(question: String, punchline: String)] = []
  
  private var currentIndex = 0
  private var showingPunchline = false

  override func viewDidLoad() {
      print("Category is:", tabBarItem.title ?? "<nil>")
    super.viewDidLoad()
    
    switch tabBarItem.title {
    case "Good":
      jokes = [
        ("Why did the chicken cross the road?", "To get to the other side!"),
        ("What do you call a fake noodle?", "An impasta."),
      ]
    case "Pun":
      jokes = [
        ("I used to be a banker…", "But I lost interest."),
        ("Why do bicycles fall over?", "Because they’re two-tired."),
      ]
    case "Dad":
      jokes = [
        ("I'm reading a book on anti-gravity…", "It's impossible to put down!"),
        ("What time did the man go to the dentist?", "Tooth hurt-y."),
        ("I’d tell you a joke about pizza…", "But it’s a little cheesy."),
      ]
    default: break
    }

    showQuestion()
  }

  func showQuestion() {
    let joke = jokes[currentIndex]
    questionLabel.text     = joke.question
    punchlineLabel.text    = ""
    showingPunchline       = false
  }

  func showPunchline() {
    punchlineLabel.text    = jokes[currentIndex].punchline
    showingPunchline       = true
  }

  @IBAction func nextTapped(_ sender: UIButton) {
    if !showingPunchline {
      showPunchline()
    } else {
      currentIndex = (currentIndex + 1) % jokes.count
      showQuestion()
    }
  }
}
