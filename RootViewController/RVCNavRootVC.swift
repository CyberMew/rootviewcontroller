import UIKit

class RVCNavRootVC: UIViewController {
	
	
	deinit {
		print("allok1")
	}
	
	override func viewDidLoad() {
	}
	
	// needs to be done in viewDidAppear to avoid (internal / OS) unbalanced presentation calls
//	override func viewWillAppear(_ animated: Bool) {
//		// should always call super
//		super.viewWillAppear(animated)
//		if AppDelegate.shared.jumpToModalVC {
//			self.performSegue(withIdentifier: "firstToSecond", sender: self)
//		}
//	}

	override func viewDidAppear(_ animated: Bool) {
		// should always call super
		super.viewDidAppear(animated)
		if AppDelegate.shared.jumpToModalVC {
			self.performSegue(withIdentifier: "firstToSecond", sender: self)
		}
	}

}
