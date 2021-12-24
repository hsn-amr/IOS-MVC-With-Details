//
//  FilmsTableViewController.swift
//  GET People
//
//  Created by administrator on 20/12/2021.
//

import UIKit

class FilmsTableViewController: UITableViewController {

   
    var films =  [FilmResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        StarWarsModel.getAllFilms(completionHandler: { // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
            data, response, error in
            
            guard let myData = data else {return}
            
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(FilmsWelcome.self, from: myData)
                    self.films += result.results
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
        return films.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = films[indexPath.row].title

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let filmsDetailsView = storyboard?.instantiateViewController(withIdentifier: "filmsDetails") as! FilmsDetailsViewController
        filmsDetailsView.info = films[indexPath.row]
        
        tabBarController?.present(filmsDetailsView, animated: true, completion: nil)
    }

}
