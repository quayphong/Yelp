//
//  FiltersViewController.swift
//  Yelp
//
//  Created by Phong on 24/2/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit

protocol FiltersViewControllerDelegate {
    func filtersViewController(filtersViewController: FiltersViewController, didUpdateSort sort: Int?, didUpdateCategories categories: [String]?, didUpdateDeals deals: Bool?, didUpdateDistance radiusFilter: Double? )
}
class FiltersViewController: UIViewController {

    let categories: [Dictionary<String,String>] =
        [["name" : "Afghan", "code": "afghani"],
         ["name" : "African", "code": "african"],
         ["name" : "American, New", "code": "newamerican"],
         ["name" : "American, Traditional", "code": "tradamerican"],
         ["name" : "Arabian", "code": "arabian"],
         ["name" : "Argentine", "code": "argentine"],
         ["name" : "Armenian", "code": "armenian"],
         ["name" : "Asian Fusion", "code": "asianfusion"],
         ["name" : "Asturian", "code": "asturian"],
         ["name" : "Australian", "code": "australian"],
         ["name" : "Austrian", "code": "austrian"],
         ["name" : "Baguettes", "code": "baguettes"],
         ["name" : "Bangladeshi", "code": "bangladeshi"],
         ["name" : "Barbeque", "code": "bbq"],
         ["name" : "Basque", "code": "basque"],
         ["name" : "Bavarian", "code": "bavarian"],
         ["name" : "Beer Garden", "code": "beergarden"],
         ["name" : "Beer Hall", "code": "beerhall"],
         ["name" : "Beisl", "code": "beisl"],
         ["name" : "Belgian", "code": "belgian"],
         ["name" : "Bistros", "code": "bistros"],
         ["name" : "Black Sea", "code": "blacksea"],
         ["name" : "Brasseries", "code": "brasseries"],
         ["name" : "Brazilian", "code": "brazilian"],
         ["name" : "Breakfast & Brunch", "code": "breakfast_brunch"],
         ["name" : "British", "code": "british"],
         ["name" : "Buffets", "code": "buffets"],
         ["name" : "Bulgarian", "code": "bulgarian"],
         ["name" : "Burgers", "code": "burgers"],
         ["name" : "Burmese", "code": "burmese"],
         ["name" : "Cafes", "code": "cafes"],
         ["name" : "Cafeteria", "code": "cafeteria"],
         ["name" : "Cajun/Creole", "code": "cajun"],
         ["name" : "Cambodian", "code": "cambodian"],
         ["name" : "Canadian", "code": "New)"],
         ["name" : "Canteen", "code": "canteen"],
         ["name" : "Caribbean", "code": "caribbean"],
         ["name" : "Catalan", "code": "catalan"],
         ["name" : "Chech", "code": "chech"],
         ["name" : "Cheesesteaks", "code": "cheesesteaks"],
         ["name" : "Chicken Shop", "code": "chickenshop"],
         ["name" : "Chicken Wings", "code": "chicken_wings"],
         ["name" : "Chilean", "code": "chilean"],
         ["name" : "Chinese", "code": "chinese"],
         ["name" : "Comfort Food", "code": "comfortfood"],
         ["name" : "Corsican", "code": "corsican"],
         ["name" : "Creperies", "code": "creperies"],
         ["name" : "Cuban", "code": "cuban"],
         ["name" : "Curry Sausage", "code": "currysausage"],
         ["name" : "Cypriot", "code": "cypriot"],
         ["name" : "Czech", "code": "czech"],
         ["name" : "Czech/Slovakian", "code": "czechslovakian"],
         ["name" : "Danish", "code": "danish"],
         ["name" : "Delis", "code": "delis"],
         ["name" : "Diners", "code": "diners"],
         ["name" : "Dumplings", "code": "dumplings"],
         ["name" : "Eastern European", "code": "eastern_european"],
         ["name" : "Ethiopian", "code": "ethiopian"],
         ["name" : "Fast Food", "code": "hotdogs"],
         ["name" : "Filipino", "code": "filipino"],
         ["name" : "Fish & Chips", "code": "fishnchips"],
         ["name" : "Fondue", "code": "fondue"],
         ["name" : "Food Court", "code": "food_court"],
         ["name" : "Food Stands", "code": "foodstands"],
         ["name" : "French", "code": "french"],
         ["name" : "French Southwest", "code": "sud_ouest"],
         ["name" : "Galician", "code": "galician"],
         ["name" : "Gastropubs", "code": "gastropubs"],
         ["name" : "Georgian", "code": "georgian"],
         ["name" : "German", "code": "german"],
         ["name" : "Giblets", "code": "giblets"],
         ["name" : "Gluten-Free", "code": "gluten_free"],
         ["name" : "Greek", "code": "greek"],
         ["name" : "Halal", "code": "halal"],
         ["name" : "Hawaiian", "code": "hawaiian"],
         ["name" : "Heuriger", "code": "heuriger"],
         ["name" : "Himalayan/Nepalese", "code": "himalayan"],
         ["name" : "Hong Kong Style Cafe", "code": "hkcafe"],
         ["name" : "Hot Dogs", "code": "hotdog"],
         ["name" : "Hot Pot", "code": "hotpot"],
         ["name" : "Hungarian", "code": "hungarian"],
         ["name" : "Iberian", "code": "iberian"],
         ["name" : "Indian", "code": "indpak"],
         ["name" : "Indonesian", "code": "indonesian"],
         ["name" : "International", "code": "international"],
         ["name" : "Irish", "code": "irish"],
         ["name" : "Island Pub", "code": "island_pub"],
         ["name" : "Israeli", "code": "israeli"],
         ["name" : "Italian", "code": "italian"],
         ["name" : "Japanese", "code": "japanese"],
         ["name" : "Jewish", "code": "jewish"],
         ["name" : "Kebab", "code": "kebab"],
         ["name" : "Korean", "code": "korean"],
         ["name" : "Kosher", "code": "kosher"],
         ["name" : "Kurdish", "code": "kurdish"],
         ["name" : "Laos", "code": "laos"],
         ["name" : "Laotian", "code": "laotian"],
         ["name" : "Latin American", "code": "latin"],
         ["name" : "Live/Raw Food", "code": "raw_food"],
         ["name" : "Lyonnais", "code": "lyonnais"],
         ["name" : "Malaysian", "code": "malaysian"],
         ["name" : "Meatballs", "code": "meatballs"],
         ["name" : "Mediterranean", "code": "mediterranean"],
         ["name" : "Mexican", "code": "mexican"],
         ["name" : "Middle Eastern", "code": "mideastern"],
         ["name" : "Milk Bars", "code": "milkbars"],
         ["name" : "Modern Australian", "code": "modern_australian"],
         ["name" : "Modern European", "code": "modern_european"],
         ["name" : "Mongolian", "code": "mongolian"],
         ["name" : "Moroccan", "code": "moroccan"],
         ["name" : "New Zealand", "code": "newzealand"],
         ["name" : "Night Food", "code": "nightfood"],
         ["name" : "Norcinerie", "code": "norcinerie"],
         ["name" : "Open Sandwiches", "code": "opensandwiches"],
         ["name" : "Oriental", "code": "oriental"],
         ["name" : "Pakistani", "code": "pakistani"],
         ["name" : "Parent Cafes", "code": "eltern_cafes"],
         ["name" : "Parma", "code": "parma"],
         ["name" : "Persian/Iranian", "code": "persian"],
         ["name" : "Peruvian", "code": "peruvian"],
         ["name" : "Pita", "code": "pita"],
         ["name" : "Pizza", "code": "pizza"],
         ["name" : "Polish", "code": "polish"],
         ["name" : "Portuguese", "code": "portuguese"],
         ["name" : "Potatoes", "code": "potatoes"],
         ["name" : "Poutineries", "code": "poutineries"],
         ["name" : "Pub Food", "code": "pubfood"],
         ["name" : "Rice", "code": "riceshop"],
         ["name" : "Romanian", "code": "romanian"],
         ["name" : "Rotisserie Chicken", "code": "rotisserie_chicken"],
         ["name" : "Rumanian", "code": "rumanian"],
         ["name" : "Russian", "code": "russian"],
         ["name" : "Salad", "code": "salad"],
         ["name" : "Sandwiches", "code": "sandwiches"],
         ["name" : "Scandinavian", "code": "scandinavian"],
         ["name" : "Scottish", "code": "scottish"],
         ["name" : "Seafood", "code": "seafood"],
         ["name" : "Serbo Croatian", "code": "serbocroatian"],
         ["name" : "Signature Cuisine", "code": "signature_cuisine"],
         ["name" : "Singaporean", "code": "singaporean"],
         ["name" : "Slovakian", "code": "slovakian"],
         ["name" : "Soul Food", "code": "soulfood"],
         ["name" : "Soup", "code": "soup"],
         ["name" : "Southern", "code": "southern"],
         ["name" : "Spanish", "code": "spanish"],
         ["name" : "Steakhouses", "code": "steak"],
         ["name" : "Sushi Bars", "code": "sushi"],
         ["name" : "Swabian", "code": "swabian"],
         ["name" : "Swedish", "code": "swedish"],
         ["name" : "Swiss Food", "code": "swissfood"],
         ["name" : "Tabernas", "code": "tabernas"],
         ["name" : "Taiwanese", "code": "taiwanese"],
         ["name" : "Tapas Bars", "code": "tapas"],
         ["name" : "Tapas/Small Plates", "code": "tapasmallplates"],
         ["name" : "Tex-Mex", "code": "tex-mex"],
         ["name" : "Thai", "code": "thai"],
         ["name" : "Traditional Norwegian", "code": "norwegian"],
         ["name" : "Traditional Swedish", "code": "traditional_swedish"],
         ["name" : "Trattorie", "code": "trattorie"],
         ["name" : "Turkish", "code": "turkish"],
         ["name" : "Ukrainian", "code": "ukrainian"],
         ["name" : "Uzbek", "code": "uzbek"],
         ["name" : "Vegan", "code": "vegan"],
         ["name" : "Vegetarian", "code": "vegetarian"],
         ["name" : "Venison", "code": "venison"],
         ["name" : "Vietnamese", "code": "vietnamese"],
         ["name" : "Wok", "code": "wok"],
         ["name" : "Wraps", "code": "wraps"],
         ["name" : "Yugoslav", "code": "yugoslav"]]
    
    let distances = ["0.3 miles", "1 miles", "5 miles", "20 miles"]
    let sortBys = ["Best Match", "Distance", "Highest Rated"]
    
    var offerSwitchOn = false
    var distanceSwitchOn = false
    var sortBySwitchOn = false
    
    var switchStage = [Int: Bool]()
    var selectedDistance: String?
    var selectedSortBy: String?
    
    var delegate: FiltersViewControllerDelegate?
    var currentFilter: [String]?
    
    @IBOutlet weak var filterTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        filterTableView.delegate = self
        filterTableView.dataSource = self

        self.navigationController?.navigationBar.barTintColor = UIColor.red
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        // Do any additional setup after loading the view.
        
        let setting = FilterSetting()
        currentFilter = setting.getCategories()
        selectedDistance = setting.getDistance()
        selectedSortBy = setting.getSortBy()
        offerSwitchOn = setting.getOffer()
        distanceSwitchOn = setting.getDistanceSwitch()
        sortBySwitchOn = setting.getSortBySwitch()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func onSave(_ sender: UIBarButtonItem) {
        var filter = [String]()
        for (row, isSelected) in switchStage {
            if isSelected{
                filter.append(categories[row]["code"]!)
            }
        }
        // Save filter to user defaults
        let setting = FilterSetting()
        setting.setCategories(filter: filter)
        setting.setOffer(isOffer: offerSwitchOn)
        setting.setSortBy(sortBy: selectedSortBy)
        setting.setDistance(distance: selectedDistance)
        setting.setDistanceSwitch(isSwitchOn: distanceSwitchOn)
        setting.setSortBySwitch(isSwitchOn: sortBySwitchOn)
        
        var sort: Int?
        if sortBySwitchOn {
            sort = sortBys.index(of: selectedSortBy!)
        }
        
        var deal: Bool?
        if offerSwitchOn{
            deal = offerSwitchOn
        }
        
        var distance: Double?
        if distanceSwitchOn {
            let distanceIndex = distances.index(of: selectedDistance!)
            switch distanceIndex! {
            case 0: distance = 0.3
            case 1: distance = 1
            case 2: distance = 5
            case 3: distance = 20
            default: distance = 0.3
            }
        }
        delegate?.filtersViewController(filtersViewController: self, didUpdateSort: sort, didUpdateCategories: filter, didUpdateDeals: deal, didUpdateDistance: distance)
        
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FiltersViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return ""
        case 1: return "Distance"
        case 2: return "Sort By"
        case 3: return "Category"
        default: return ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return distances.count + 1
        case 2: return sortBys.count + 1
        case 3: return categories.count
        default: return 0
        }
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView()
//        view.backgroundColor = UIColor.lightGray
//        return view
//        var title = ""
//        switch section {
//            case 1: title = "Distance"
//            case 2: title = "Sort By"
//            case 3: title = "Category"
//            default: title = ""
//        }
//        
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 60))
//        label.textAlignment = NSTextAlignment.left
//        label.backgroundColor = UIColor.lightGray
//        label.text = title
//        return label
//    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath as NSIndexPath).section {
        case 0: return 44
        case 1:
            if (indexPath as NSIndexPath).row == 0 {
                return 44
            } else {
                return distanceSwitchOn == true ? 44: 0
            }
        case 2:
            if (indexPath as NSIndexPath).row == 0 {
                return 44
            } else {
                return sortBySwitchOn == true ? 44: 0
            }
        case 3: return 44
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath as NSIndexPath).section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "offerCell", for: indexPath) as! OfferCell
            cell.offerSwitch.isOn = offerSwitchOn
            cell.delegate = self
            return cell
            
        case 1:
            if (indexPath as NSIndexPath).row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "distanceCell", for: indexPath) as! DistanceCell
                cell.distanceSwitch.isOn = distanceSwitchOn
                cell.delegate = self
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "distanceItemCell", for: indexPath) as! DistanceItemCell
                let distance = distances[(indexPath as NSIndexPath).row - 1]
                cell.distanceItemLabel.text = distance
                cell.distanceItemImage.isHidden = distance != selectedDistance
                return cell
            }
            case 2:
                if (indexPath as NSIndexPath).row == 0 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "sortByCell", for: indexPath) as! SortByCell
                    cell.sortBySwitch.isOn = sortBySwitchOn
                    cell.delegate = self
                    return cell
                } else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "sortByItemCell", for: indexPath) as! SortByItemCell
                    let sortBy = sortBys[(indexPath as NSIndexPath).row - 1]
                    cell.sortByItemLabel.text = sortBy
                    cell.sortByItemImage.isHidden = sortBy != selectedSortBy
                    return cell
            }
            case 3:
                let cell = filterTableView.dequeueReusableCell(withIdentifier: "switchCell") as! SwitchCell
                cell.categoryLabel.text = categories[indexPath.row]["name"]
                
                let categoryCode = categories[indexPath.row]["code"]!
                if currentFilter != nil {
                    if (currentFilter?.contains(categoryCode))! {
                        switchStage[indexPath.row] = true
                    }
                }
                
                cell.switchButton.isOn = switchStage[indexPath.row] ?? false
                cell.delegate = self
                return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = (indexPath as NSIndexPath).section
        let row = (indexPath as NSIndexPath).row
        if section == 1 && row != 0 {
            selectedDistance = distances[(indexPath as NSIndexPath).row - 1]
            tableView.reloadSections(IndexSet(integer: 1), with: .none)
        }
        if section == 2 && row != 0 {
            selectedSortBy = sortBys[(indexPath as NSIndexPath).row - 1]
            tableView.reloadSections(IndexSet(integer: 2), with: .none)
        }
    }
}

extension FiltersViewController: SwitchCellDelagate{
    func switchCell(switchCell: SwitchCell, didChangeValue value: Bool) {
        let ip = filterTableView.indexPath(for: switchCell)
        switchStage[ip!.row] = value
        
        if value == false{
            let categoryCode = categories[ip!.row]["code"]!
            let index = currentFilter?.index(of: categoryCode)
            currentFilter?.remove(at: index!)
        }
    }
}

extension FiltersViewController: OfferCellDelegate{
    func offerCellDidSwitchChanged(_ switchCell: OfferCell) {
        offerSwitchOn = switchCell.offerSwitch.isOn
        filterTableView.reloadSections(IndexSet(integer: 1), with: .automatic)
    }
}

extension FiltersViewController: DistanceCellDelegate{
    func distanceCellDidSwitchChanged(_ switchCell: DistanceCell) {
        distanceSwitchOn = switchCell.distanceSwitch.isOn
        if selectedDistance == "" {
            selectedDistance = distances[0]
        }
        filterTableView.reloadSections(IndexSet(integer: 1), with: .automatic)
    }
}

extension FiltersViewController: SortByCellDelegate{
    func sortByCellDidSwitchChanged(_ switchCell: SortByCell) {
        sortBySwitchOn = switchCell.sortBySwitch.isOn
        if selectedSortBy == "" {
            selectedSortBy = sortBys[0]
        }
        filterTableView.reloadSections(IndexSet(integer: 2), with: .automatic)
    }
}


