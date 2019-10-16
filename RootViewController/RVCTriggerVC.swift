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
		// this needs to be set *after* the new view hierarchy is established
		//		    (UIApplication.shared.delegate as! AppDelegate).jumpToModalVC = true
	}
	
	@IBAction func reloadApp(_ sender: Any) {
		
		if let window = UIApplication.shared.windows.first(where: {$0.isKeyWindow}) {
			
			if self.presentingViewController != nil {
				
				// set jumpToModalVC back to false... otherwise, "auto nav" will be triggered
				// again in PushedVC when this VC is dismissed
				(UIApplication.shared.delegate as! AppDelegate).jumpToModalVC = false
				
				// dismiss self, *then* set jumpToModalVC to true and re-set your root VC
				self.presentingViewController?.dismiss(animated: true, completion: {

					let mainSB = UIStoryboard(name: "Main", bundle: nil)
					let newVC = UINavigationController(rootViewController: mainSB.instantiateViewController(withIdentifier:
						"triggerVC"
					))
					(UIApplication.shared.delegate as! AppDelegate).jumpToModalVC = true
					window.rootViewController = newVC

				})
				
			}
			
		}
	}
}
