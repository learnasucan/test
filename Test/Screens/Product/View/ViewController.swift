//
//  ViewController.swift
//  Test
//
//  Created by Prachit on 04/03/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var productTableView: UITableView!
    
    private var viewModel = ProductVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        productTableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        
        self.configuration()
    }

}

extension ViewController {
    
    func configuration() {
        initViewModel()
        observerEvent()
    }
    
    func initViewModel() {
        viewModel.fetchData()
    }
    
    func observerEvent() {
        
        viewModel.eventHandler = { event in
            
            switch event {
            case .loading:
                print("Loading")
                break
            case .loaded:
                print(self.viewModel.products,"Loaded")
                DispatchQueue.main.async {
                    self.productTableView.reloadData()
                }
                break
            case .error(let err):
                print(err.localizedDescription)
                break
            default:
                break
            }
            
        }
    }
}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductCell else { return UITableViewCell() }
        
        let product = viewModel.products[indexPath.row]
        cell.product = product
        
        return cell
    }
 
}
