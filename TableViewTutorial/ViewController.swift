//
//  ViewController.swift
//  TableViewTutorial
//
//  Created by MAC on 11/30/20.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var todoListTableView: UITableView!
  
  private var todos = ["Make Coffee", "Still Making Coffee", "Sleeping", "Make Some more Coffee", "Code"]
  /*
   Access levels
   Private - can only be used within the defining class scope. Note that provate variables can be used within extensions, provided the extensions are in the same file
   fileprivate - fileprivate can be used by any class in the same file
   internal - this is the default if not specified. This can be accessed by anything within the target, but not outside.
   public - Generally reserved for classes. This means it can be used by anything inside or outside the target. However, public classes can't be subclasses, and public functions can't be overridden
   open - This means it can be used by anything inside or outside the target, as well as being able to be subclassed/overridden
   */
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.todoListTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    self.todoListTableView.dataSource = self
    self.todoListTableView.delegate = self
  }
  
  @IBAction func addNewTodo(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let addTodoVC = storyboard.instantiateViewController(withIdentifier: "AddTodoViewController") as! AddTodoViewController
    addTodoVC.delegate = self
    self.navigationController?.pushViewController(addTodoVC, animated: true)
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.todos.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
//    cell.textLabel?.text = "Some Cool TODO thing"
//    return cell
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
    let todo = self.todos[indexPath.row]
    cell.todoLabel.text = todo
    print(indexPath)
    return cell
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.todos.remove(at: indexPath.row)
    tableView.reloadData()
  }
}

extension ViewController: AddTodoViewControllerDelegate {
  func addItem(_ item: String) {
    self.todos.append(item)
    self.todoListTableView.reloadData()
  }
}
