//  Created by Mac on 30.08.2021.
//

import UIKit

class TappableView: UIView {
        
    private var object: AnyObject?
    private var selector: Selector?
    
    init() {
        super.init(frame: .zero)
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        addGestureRecognizer(tapRecognizer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tap(sender: UITapGestureRecognizer) {
        showSelectAnimation()
        if let action = selector {
            _ = object?.perform(action)
        }
    }
    
    public func setTarget(_ target: AnyObject, selector: Selector) {
        self.object = target
        self.selector = selector
    }
    
    private func showSelectAnimation() {
        UIView.animate(withDuration: 0.08, delay: 0.0, options: [.autoreverse], animations: {
            self.backgroundColor = R.color.gray_light()?.withAlphaComponent(0.3)
        }, completion: { _ in
            self.backgroundColor = .clear
        })
    }
}
