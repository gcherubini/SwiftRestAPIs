import Foundation
import UIKit

class SecondView: UIView {
	
	@IBOutlet private var contentView: UIView!
	@IBOutlet private weak var welcomeLabel: UILabel!
	@IBOutlet weak var nameFromParamLabel: UILabel!
	@IBOutlet weak var nameFromPersistenceLabel: UILabel!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}
	
	private func commonInit() {
		Bundle.main.loadNibNamed("SecondView", owner: self, options: nil)
		addSubview(contentView)
		contentView.frame = self.bounds
	}
}
