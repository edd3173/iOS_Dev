//
//  CategoriyViewController.swift
//  Todoey
//
//  Created by 원성현 on 2022/03/30.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

class CategoriyViewController: UITableViewController {
    
    let realm = try! Realm()
    var categories: Results<Category>?
    
    
    //var categoryArray = [MyCategory]()
    //let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor.systemIndigo
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        
        loadCategory()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Category Added"
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        if let indexPath = tableView.indexPathForSelectedRow{
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }

    @IBAction func addButttonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            //let newCategory = MyCategory(context: self.context)
            //newCategory.name = textField.text
            //self.categoryArray.append(newCategory)
            
            let newCategory = Category()
            newCategory.name = textField.text!
            
            self.save(category: newCategory)
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func save(category: Category){
        do {
            //try context.save()
            try realm.write{
                realm.add(category)
            }
        }catch{
            print("Save err : \(error)")
        }
        self.tableView.reloadData()
    }
    
    func loadCategory(){
        categories = realm.objects(Category.self)
        
//        let request : NSFetchRequest<MyCategory> = MyCategory.fetchRequest()
//
//        do{
//            try categoryArray = context.fetch(request)
//        }catch{
//            print("Load err : \(error)")
//        }
        
        self.tableView.reloadData()
    }

    
}
