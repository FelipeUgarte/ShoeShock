//
//  MyBagVC.swift
//  ShoeShock-fuh
//
//  Created by Felipe Ugarte on 30-06-22.
//

import UIKit
import SwiftUI
import Combine

class MyBagVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UpdateBagDelegate {

    @IBOutlet weak var bagItemsTableView: UITableView!
    @IBOutlet weak var itemCountLB: UILabel!
    @IBOutlet weak var totalTextLB: UILabel!
    @IBOutlet weak var totalNumberLB: UILabel!
    @IBOutlet weak var nextBT: UIButton!

    var myBag = MyBagModel(product: [], totalCost: 0)
    var myBagObserver: AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()
        bagItemsTableView.dataSource = self
        bagItemsTableView.delegate = self

        getBag()
        updateTotal()
    }

    // MARK: - Methods
    private func initBag(shoe: BagProductsModel) {
//        MyBag = shoe
        navigationItem.title = "My Bag"
    }

    private func getBag() {
        self.myBagObserver = DataService.instance.getBag()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Finish")
                case .failure(let error):
                    print(error)
                }
            }, receiveValue: { [weak self] updatedBag in
                self?.myBag = updatedBag
                //                self?.updateTotalLabel()
                self?.bagItemsTableView.reloadData()
                self?.updateTotal()
            })

    }

    private func updateTotalLabel() {
        totalNumberLB.text = String("$ \(myBag.totalCost)")
    }

    func updateTotal() {
        updateTotalLabel()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myBag.bagProducts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == bagItemsTableView {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MyBagCell", for: indexPath) as? MyBagCell {
                let productOfBag = myBag.bagProducts[indexPath.row]
                cell.updateCell(shoe: productOfBag, cellIndex: indexPath.row)
                return cell
            }
            return MyBagCell()
        }
        return MyBagCell()
    }

    @IBAction func next(_ sender: Any) {
        let hostingController = UIHostingController(rootView: CongratulationsView(dismiss: {[weak self] in
            self?.navigationController?.popViewController(animated: true)
        }))
        self.navigationController?.pushViewController(hostingController, animated: true)
    }
}
