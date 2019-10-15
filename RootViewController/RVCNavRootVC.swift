import UIKit

class RVCNavRootVC: UIViewController {
  
  
  deinit {
    print("allok1")
  }
  
  override func viewDidLoad() {
  }
  
  override func viewWillAppear(_ animated: Bool) {
    if AppDelegate.shared.jumpToModalVC {
      self.performSegue(withIdentifier: "firstToSecond", sender: self)
    }
  }
}
