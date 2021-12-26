//
//  ViewController.swift
//  Stocks
//
//  Created by Aidin Ahmadian on 12/26/21.
//

import UIKit

class WatchListViewController: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupSearchController()
        setUpTitleView()
        
    }
    
    // MARK: - Private
    
    private func setUpTitleView() {
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: navigationController?.navigationBar.height ?? 100))
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: titleView.width-40, height: titleView.height))
        label.text = "Stocks"
        //label.backgroundColor = .red
        label.font = .systemFont(ofSize: 24, weight: .medium)
        titleView.addSubview(label)
        navigationItem.titleView = titleView
    }
    
    private func setupSearchController() {
        let resultVC = SearchResultsViewController()
        resultVC.delegate = self
        let searchVC = UISearchController(searchResultsController: resultVC)
        searchVC.searchResultsUpdater = self
        navigationItem.searchController = searchVC
    }
    
}

extension WatchListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text,
              let resultsVC = searchController.searchResultsController as?
                  SearchResultsViewController,
              !query.trimmingCharacters(in: .whitespaces).isEmpty else {
                  return
              }
        
        // Optimize to reduce number of searches for when user stops typing
        // Call API to search
        // Update results controller
        resultsVC.update(with: ["Google"])
        
    }
}

extension WatchListViewController: SearchResultsViewControllerDelegate {
    func searchResultsViewControllerDidSelect(searchResult: String) {
        //
    }
}
