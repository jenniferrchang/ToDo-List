//
//  2ndViewController.swift
//  ToDo List
//
//  Created by Jennifer Chang on 7/13/20.
//  Copyright © 2020 Jennifer Chang. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    var toDos : [ToDo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
    toDos = createToDos()
}
    
func tableView(_ tableView: UITableView, number of RowsInSection section: Int) -> Int
    {
        return toDos.count
    }
    func createToDos() -> [ToDo] {
    
    let swift = ToDo()
    swift.name = "Learn Swift"
    swift.important = true
    
    let dog = ToDo()
    dog.name = "Walk the Dog"
    
    return [swift, dog]
}

    }
    

func tableView(_tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
    
    let toDo = toDos[indexPath.row]
    
    if toDo.important {
        cell.textLabel?.text = "!" + toDo.name
    } else {
        cell.textLabel?.text = toDo.name
    }
    
    return cell
}
func tableView(_tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    let toDo = toDos(indexPath.row)

    performSegue(withIdentifier: "moeToComplete", sender: toDo)
}

func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let addVC = segue.destination as? AddToDoViewController {
        addVC.previous.VC = self
}
    if let completeVC = segue.destination as? CompleteToDOViewController {
        if let toDo = sender as? ToDo {
            completeVC.selectedToD0 = toDo
            completeVC.previousVC = self
        }
}
}


