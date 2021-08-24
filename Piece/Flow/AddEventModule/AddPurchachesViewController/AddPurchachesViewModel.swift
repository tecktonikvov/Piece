//  Created by Mac on 18.08.2021.
//

import UIKit


protocol AddPurchaseViewModelIntarface: TableViewAdapter {
    var addPurchaseBlock: (() -> Void)? { get set }
    var updateBlock: (() -> Void)? { get set }
    var updatePriceBlock: ((Float) -> Void)? { get set }
    func validateUserInput(title: String?, price: String?) -> Bool
    func createNewPurchase(title: String, price: String)
}

final class AddPurchaseViewModel: NSObject, AddPurchaseViewModelIntarface {
    public var updatePriceBlock: ((Float) -> Void)?
    public var addPurchaseBlock: (() -> Void)?
    public var updateBlock: (() -> Void)?

    private var model = Purchase.mock {
        didSet {
            updateBlock?()
        }
    }
    
    private var selectedPurchases = [Purchase]() {
        didSet {
            let totalPrice = selectedPurchases.reduce(0.0) { $0 + $1.price }
            updatePriceBlock?(totalPrice)
        }
    }
    
    public func validateUserInput(title: String?, price: String?) -> Bool {
        if let title = title, let price = price {
            guard Float(price) != nil, !title.isEmpty else { return false }
            return true
        } else {
            return false
        }
    }
    
    public func createNewPurchase(title: String, price: String) {
        let lastId = model.map { $0.id }.max() ?? 1
        let floatPrice = Float(price) ?? 0.0
        let purchase = Purchase(id: lastId + 1, title: title, price: floatPrice)
        
        selectedPurchases.append(purchase)
        model.insert(purchase, at: 0)
    }
    
    @objc private func addButtonDidPressed() {
        addPurchaseBlock?()
    }
}
 
extension AddPurchaseViewModel  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentModel = model[indexPath.row]
        let cell = AddPurchaseCell()
        cell.setupCell(title: currentModel.title, price: currentModel.price, id: currentModel.id)
        
        if selectedPurchases.contains(where: { $0.id == currentModel.id }) {
            cell.select()
        }
        if indexPath.row == model.count - 1 {
            cell.hideSeparator()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? AddPurchaseCell else { return }
        tableView.deselectRow(at: indexPath, animated: true)
        cell.select()
        let selectedPurchase = model[indexPath.row]
        if cell.getIsCellSelected() {
            selectedPurchases.append(selectedPurchase)
        } else {
            let selectedId = cell.getId()
            selectedPurchases.removeAll(where: { $0.id == selectedId })
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = AddPurchaseButtonView()
        headerView.setButtonTarget(self, action: #selector(addButtonDidPressed))
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        44
    }
}
 
