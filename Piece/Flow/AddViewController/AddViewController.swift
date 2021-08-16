//
//  ViewController.swift
//  Piece
//
//  Created by Mac on 16.08.2021.
//

import UIKit

final class AddViewController: UIViewController, AddEventActionsDelegate {
    func nextButtonDidPressed() {

    }

    func previousButtonDidPressd() {

    }

    init(bg: UIColor) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = bg
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
    }

}
