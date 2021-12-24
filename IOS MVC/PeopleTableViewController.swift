//
//  PeopleTableViewController.swift
//  GET People
//
//  Created by administrator on 20/12/2021.
//

import UIKit

class PeopleTableViewController: UITableViewController {
    
    
    var peopleNames = [Result]()

    override func viewDidLoad() {
        super.viewDidLoad()

        StarWarsModel.getAllPeople(completionHandler: { // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
            data, response, error in
            
            guard let myData = data else {return}
            
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(Welcome.self, from: myData)
                    self.peopleNames += result.results
                    self.updateTableView()
                } catch {
                    print("Something went wrong")
                }
        })
    }
    
    func updateTableView(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return peopleNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = peopleNames[indexPath.row].name

        return cell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let peopleDetailsView = storyboard?.instantiateViewController(withIdentifier: "peopleDetails") as! PeopleDetailsViewController
        peopleDetailsView.info = peopleNames[indexPath.row]
        
        tabBarController?.present(peopleDetailsView, animated: true, completion: nil)
    }

}
