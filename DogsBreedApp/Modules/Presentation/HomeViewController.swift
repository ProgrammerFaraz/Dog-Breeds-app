//
//  HomeViewController.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 25/10/2022.
//

import UIKit

class HomeViewController: BaseViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var tableView: UITableView?
    
    //MARK: - VARIABLES
    var viewModel: DefaultHomeViewModel?
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()

        bindHomeViewModel()
        viewModel?.getAllBreeds(method: .remote)
    }

    //MARK: - SETUP
    private func bindHomeViewModel() {
        viewModel?.onSuccess = { [weak self] breeds in
            self?.tableView?.reloadData()
        }
        viewModel?.onError = { [weak self] error in
//            guard let self = self else { return }
            print("onError called with \(error)")
        }
    }

}

//MARK: - UITableViewDelegate & UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.breeds.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier) as? HomeTableViewCell,
              let viewModel = viewModel else {
            return UITableViewCell()
        }
        cell.configure(breedName: viewModel.breeds[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return HomeTableViewCell.rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = BreedDetailDependencyProvider.viewController,
              let viewModel = viewModel else { return }
        vc.breedName = viewModel.breeds[indexPath.row]
        self.route(to: vc, navigation: .push)
    }
}
