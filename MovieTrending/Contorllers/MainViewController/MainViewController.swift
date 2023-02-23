//
//  MainViewController.swift
//  MovieTrending
//
//  Created by JINSEOK on 2023/02/23.
//

import UIKit

class MainViewController: UIViewController {
    
    // IBoutlets:
    @IBOutlet weak var tableView: UITableView!
    
    // ViewModel:
    var viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
        
    }
    
    func configView() {
        self.title = "Main View"

        setupTableView()
    }
}