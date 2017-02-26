//
//  FilterSetting.swift
//  Yelp
//
//  Created by Phong on 25/2/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import Foundation

class FilterSetting{
    init() {
        defaults = UserDefaults.standard
        
    }
    
    private var defaults: UserDefaults
    private var categoryKey:String = "filter_category"
    private var offerKey:String = "filter_offer"
    private var distanceKey:String = "filter_distance"
    private var sortByKey:String = "filter_sortBy"
    private var distanceSwitchKey:String = "filter_distance_switch"
    private var sortBySwitchKey:String = "filter_sortBy_switch"

    
    func setCategories(filter:[String]) {
        defaults.setValue(filter, forKey: categoryKey)
        defaults.synchronize()
    }
    
    func getCategories() -> [String]? {
        let filters = defaults.array(forKey: categoryKey) as! [String]?
        return filters
    }
    
    func setOffer(isOffer: Bool) {
        defaults.setValue(isOffer, forKey: offerKey)
        defaults.synchronize()
    }
    
    func getOffer() -> Bool {
        let isOffer = defaults.bool(forKey: offerKey)
        return isOffer
    }
    
    func setDistanceSwitch(isSwitchOn: Bool) {
        defaults.setValue(isSwitchOn, forKey: distanceSwitchKey)
        defaults.synchronize()
    }
    
    func getDistanceSwitch() -> Bool {
        let isSwitchOn = defaults.bool(forKey: distanceSwitchKey)
        return isSwitchOn
    }

    func setDistance(distance:String?) {
        defaults.setValue(distance, forKey: distanceKey)
        defaults.synchronize()
    }
    
    func getDistance() -> String? {
        let distance = defaults.string(forKey: distanceKey) 
        return distance
    }
    
    func setSortBySwitch(isSwitchOn: Bool) {
        defaults.setValue(isSwitchOn, forKey: sortBySwitchKey)
        defaults.synchronize()
    }
    
    func getSortBySwitch() -> Bool {
        let isSwitchOn = defaults.bool(forKey: sortBySwitchKey)
        return isSwitchOn
    }

    func setSortBy(sortBy: String?) {
        defaults.setValue(sortBy, forKey: sortByKey)
        defaults.synchronize()
    }
    
    func getSortBy() -> String? {
        let sortBy = defaults.string(forKey: sortByKey)
        return sortBy
    }
}
