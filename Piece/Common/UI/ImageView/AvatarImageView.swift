//  Created by Mac on 30.08.2021.
//

import UIKit

final class AvatarImageView: UIImageView {
    init(imageUrl: String? = "") {
        super.init(frame: .zero)
        self.image = R.image.avatar_placeholder_image()
        clipsToBounds = true
        setImage(url: imageUrl ?? "")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = frame.height/2
    }
    
    public func setImage(url: String) {
        loadImageUsingCacheWithUrlString(urlString: url)
    }
}
