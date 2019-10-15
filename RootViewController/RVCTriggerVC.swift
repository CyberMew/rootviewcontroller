import UIKit

class RVCTriggerVC: UIViewController {
  
  static var count = 0
  
  @IBOutlet weak var counter: UILabel!
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    RVCTriggerVC.count += 1
  }
  
  deinit {
    print("allok3")
  }
  
  override func viewDidLoad() {
    switch (RVCTriggerVC.count % 2) {
    case 0:
      view.backgroundColor = .init(red: 0.0, green: 0.0, blue: 1.0, alpha: 0.5)
    case 1:
      view.backgroundColor = .init(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.5)
    default:
      view.backgroundColor = .init(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)
    }
    
    counter.text = String(RVCTriggerVC.count)
    
    /* comment this to stop 'auto navigate' to modal screen (as if we are logged in)
     this causes warnings and also 1st and 2nd vc not to unload.
     */
    (UIApplication.shared.delegate as! AppDelegate).jumpToModalVC = true
  }
  
  @IBAction func reloadApp(_ sender: Any) {
    if let window = UIApplication.shared.windows.first(where: {$0.isKeyWindow}) {
      let mainSB = UIStoryboard(name: "Main", bundle: nil)
      let newVC = UINavigationController(rootViewController: mainSB.instantiateViewController(withIdentifier:
        "triggerVC"
      ))
      newVC.modalPresentationStyle = .fullScreen
      
      /* working, sort of, but with warnings if we autonavigate */
      /*
       window.rootViewController?.presentedViewController?.present(newVC, animated: true, completion: {
         window.rootViewController?.dismiss(animated: false, completion: {
           window.rootViewController = nil
           window.rootViewController = newVC
         })
       })
       */
      
      /* working if not using auto navigate, if using auto navigate, we get duplicates and warnings
       and vcs not unloading as well as jumping numbers (you'll see it when you run it) */
      window.rootViewController = newVC
    }
  }
}
