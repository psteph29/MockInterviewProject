//
//  DetailTableViewController.swift
//  MockInterviewProject#2
//
//  Created by Paige Stephenson on 7/17/23.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    var people: [Person] = []
    
    var network = Network()
    
    var isGenderDisplayed: Bool
    var isLocationDisplayed: Bool
    var isNationalityDisplayed: Bool
    var numberOfPeople: Int
    

    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            do {
                people = try await network.loadUsers(gender: isGenderDisplayed, location: isLocationDisplayed, nationality: isNationalityDisplayed, count: numberOfPeople)
                self.tableView.reloadData()
            } catch {
                print(error)
            }
        }
    }
    

    init?(gender: Bool, location: Bool, nationality: Bool, numberOfPeople: Int, coder: NSCoder) {
        isGenderDisplayed = gender
        isLocationDisplayed = location
        isNationalityDisplayed = nationality
        self.numberOfPeople = numberOfPeople
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init with coder is not implemented")
    
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return people.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonDetail", for: indexPath) as! PersonDetailTableViewCell

        let person = people[indexPath.row]
        
        Task {
            let url = URL(string: person.picture.large)!
            let image = try await network.fetchPhoto(from: url)
            cell.photo.image = image
        }
        
        cell.setPerson(person: person)

        return cell
    }
}
