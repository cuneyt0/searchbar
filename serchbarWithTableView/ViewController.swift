//
//  ViewController.swift
//  serchbarWithTableView
//
//  Created by Cuneyt on 4.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var countryList:[String]=[String]()
    var filterCountryList:[String]=[String]()
    
    var isSearching=false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    countryList=["Türkiye","Almanya","Fransa","Hollanda","İran","Amerika","Sırbistan","Yunanistan"]
        searchbar.delegate=self
        tableView.dataSource=self
        tableView.delegate=self
    }


}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
     
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(isSearching){
            return filterCountryList.count
        }else{
            return countryList.count
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
        
        if(isSearching){
            cell.textLabel?.text=filterCountryList[indexPath.row]
        }else{
            cell.textLabel?.text=countryList[indexPath.row]
        }
       
        
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(isSearching){
          
            print(filterCountryList[indexPath.row])
        }else{
            print(countryList[indexPath.row])
        }
       
    }
   
}
extension ViewController:UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        
        if(searchText==""){
            isSearching=false
        }else{
            isSearching=true
            filterCountryList=countryList.filter({$0.lowercased().contains(searchText.lowercased())})
        }
        
        tableView.reloadData();
    }
}
