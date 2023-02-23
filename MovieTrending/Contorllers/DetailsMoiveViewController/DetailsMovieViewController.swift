//
//  DetailsMovieViewController.swift
//  MovieTrending
//
//  Created by JINSEOK on 2023/02/23.
//

import UIKit
import SDWebImage

class DetailsMovieViewController: UIViewController {
    
    //IBOutlets:
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // View Model:
    var viewModel: DetailsMovieViewModel
    
    init(viewModel: DetailsMovieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DetailsMovieViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
    }
    
    func configView() {
        self.title = "Movie Details"
        self.titleLabel.text = viewModel.moviewTitle
        self.descriptionLabel.text = viewModel.movieDescription
        self.imageView.sd_setImage(with: viewModel.movieImage)
    }
}
