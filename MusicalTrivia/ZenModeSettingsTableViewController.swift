//
//  ZenModeSettingsTableViewController.swift
//  MusicalTrivia
//
//  Created by David Wolgemuth on 1/25/16.
//  Copyright © 2016 David. All rights reserved.
//

import UIKit

class ZenModeSettingsTableViewController: UITableViewController
{
    var game: Game?
    var delegate: StandardDelegate?
    
    let types = [
        ["triads", ["root", "first", "second"]],
        ["key-signatures", ["all-modes", "sharps", "flats"]]
    ]
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        setTableViewBooleans()
    }
    func setTableViewBooleans()
    {
        for section in 0..<types.count {
            let key = types[section][0] as! String
            for row in 0..<types[section][1].count {
                let indexPath = NSIndexPath(forRow: row, inSection: section)
                let cell = tableView.cellForRowAtIndexPath(indexPath)
                let option = types[section][1][row] as! String
                let isSet = game!.questionTypes[key]![option]!
                cell?.accessoryType = isSet ? .Checkmark : .None
            }
        }
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let cell = tableView.cellForRowAtIndexPath(indexPath)!
        
        if cell.accessoryType.rawValue == 0 {
//            cell.accessoryType = .Checkmark
        } else if cell.accessoryType.rawValue == 3 {
//            cell.accessoryType = .None
        }
        let type = types[indexPath.section]
        let key = type[0] as! String
        let option = type[1][indexPath.row] as! String
        print(key + " - " + option)
        let isSet = game!.questionTypes[key]![option]!
        print(isSet)
        game!.questionTypes[key]![option] = !isSet
        setTableViewBooleans()
    }
    @IBAction func saveButtonPressed(sender: UIBarButtonItem)
    {
        delegate?.dismissView()
    }
}