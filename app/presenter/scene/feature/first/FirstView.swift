import Foundation
import UIKit

class FirstView: UIView {
	
	@IBOutlet var contentView: UIView!
	@IBOutlet weak var input: UITextField!
	@IBOutlet weak var button: UIButton!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}
	
	private func commonInit() {
		Bundle.main.loadNibNamed("FirstView", owner: self, options: nil)
		addSubview(contentView)
		contentView.frame = self.bounds
	}
}
