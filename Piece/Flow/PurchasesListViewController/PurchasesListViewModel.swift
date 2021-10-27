//  Created by Mac on 30.08.2021.
//

import UIKit

typealias PurchasesListViewModelAdapter = BaseViewModelInterface & TableViewAdapter

protocol PurchasesListViewModelInterface: PurchasesListViewModelAdapter {
    var pushDetailBlock: ((EventModel) -> Void)? { get set }
}

final class PurchasesListViewModel: NSObject, PurchasesListViewModelInterface {
    public var pushDetailBlock: ((EventModel) -> Void)?
    
    private let model: EventModel
    
   // private var tt: CGFloat = 0
    
    init(event: EventModel) {
        self.model = event
    }
}

// MARK: - TableViewAdapter
extension PurchasesListViewModel  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.purchases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentModel = model.purchases[indexPath.row]
        let cell = PurchaseCell()
        let owner = Member(id: "11", name: "Alex", avatarUrl: nil, phone: "+39492734677")
        let list = Member.mockArr
        cell.setupCell(purchaseTitle: currentModel.title, owner: owner, price: currentModel.price, membersList: list)
//        cell.fdf = { height in
//            self.tt = height + 10
//            print(height)
//        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedEvent = model.purchases[indexPath.row]
       // pushDetailBlock?(selectedEvent)
    }
        
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if tt == 0 {
//            return UITableView.automaticDimension
//
//        } else {
//            return tt
//
//        }
//    }
    
}

// MARK: - BaseViewModelInterface
extension PurchasesListViewModel {
    func getHeaderSubtitle() -> String {
        model.title
    }
    
    func getHeaderAmount() -> Float {
        model.totalPrice
    }
    
}
