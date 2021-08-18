
import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    func loadImageUsingCacheWithUrlString(urlString: String, completion: ((Bool, UIImage?) -> Void)? = nil) {
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            self.image = cachedImage
            completion?(true, cachedImage)
            return
        }
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            if error != nil {
                print("Can't load photo: \(error.debugDescription)")
                completion?(false, nil)
                return
            }
            DispatchQueue.main.async {
                guard let data = data else { return }
                if let downloadedImage = UIImage(data: data) {
                    imageCache.setObject(downloadedImage, forKey: urlString as NSString)
                    self?.image = UIImage(data: data)
                }
            }
        }.resume()
    }
}
