//
//  TableViewController.swift
//  onsei2
//
//  Created by 原 あゆみ on 2017/02/20.
//  Copyright © 2017年 原 あゆみ. All rights reserved.
//
import Foundation
import UIKit
import RealmSwift


class TableViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    var realmUser : UserData!
    let realm = try! Realm()
    var Items: Results<UserData>!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        do{
            let realm = try Realm()
            Items = realm.objects(UserData)
            tableView.reloadData()
        }catch{
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int {
        return Items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexpath: IndexPath)->UITableViewCell {
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        let object = Items[indexpath.row]
        
        cell.textLabel?.text = object.text
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
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
