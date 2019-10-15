import UIKit

class RVCPushedVC: UIViewController {
  
  
  deinit {
    print("allok2")
  }
  
  override func viewDidLoad() {
  }
  
  override func viewWillAppear(_ animated: Bool) {
    if AppDelegate.shared.jumpToModalVC {
      self.performSegue(withIdentifier: "secondToThird", sender: self)
    }
  }
}
