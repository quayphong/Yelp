//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Chau Vo on 10/17/16.
//  Copyright © 2016 CoderSchool. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var navBar: UINavigationItem!
    
    var searchActive : Bool = false
    
    var businesses: [Business]!
    var currentFilter: [String]?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor.red

        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        navBar.titleView = searchBar
        
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableViewAutomaticDimension
        
        Business.search(with: "") { (businesses: [Business]?, error: Error?) in
            if let businesses = businesses {
                self.businesses = businesses
                self.tableView.reloadData()
            }
        }

        // Example of Yelp search with more search options specified
        /*
        Business.search(with: "Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]?, error: Error?) in
            if let businesses = businesses {
                self.businesses = businesses

                for business in businesses {
                    print(business.name!)
                    print(business.address!)
                }
            }
        }
        */
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navVC = segue.destination as! UINavigationController
        let filterVC = navVC.topViewController as! FiltersViewController
        filterVC.delegate = self
    }

}

extension BusinessesViewController: UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if businesses == nil {
            return 0
        }
        else{
            return businesses.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusinessCell") as! BusinessCell
        cell.business = businesses[indexPath.row]
        
        return cell
    }
    
    
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        searchActive = true;
//    }
//    
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        searchActive = false;
//    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        Business.search(with: searchText, sort: nil, categories: currentFilter, deals: nil, radiusFilter: nil) { (businesses: [Business]?, errors: Error?) in
            if let businesses = businesses {
                self.businesses = businesses
                self.tableView.reloadData()
            }
        }
    }
}

extension BusinessesViewController: FiltersViewControllerDelegate{
    func filtersViewController(filtersViewController: FiltersViewController, didUpdateSort sort: Int?, didUpdateCategories categories: [String]?, didUpdateDeals deals: Bool?, didUpdateDistance radiusFilter: Double?) {
        currentFilter = categories;
        var sortEnum:YelpSortMode?
        if sort != nil {
            sortEnum = YelpSortMode(rawValue: sort!)
        }
        
        Business.search(with: "", sort: sortEnum, categories: categories, deals: deals, radiusFilter: radiusFilter){ (businesses: [Business]?, errors: Error?) in
            if let businesses = businesses {
                self.businesses = businesses
                self.tableView.reloadData()
            }
        }
    }
//    func filtersViewController(filtersViewController: FiltersViewController, didUpdateFilter filter: [String]?) {
//        currentFilter = filter;
//        Business.search(with: "", sort: nil, categories: filter, deals: nil, radiusFilter: nil) { (businesses: [Business]?, errors: Error?) in
//            if let businesses = businesses {
//                self.businesses = businesses
//                self.tableView.reloadData()
//            }
//        }
//    }
}
