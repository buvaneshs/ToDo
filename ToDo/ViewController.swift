//
//  ViewController.swift
//  ToDo



import UIKit
 
class Task: Codable {
    var title: String
    var isCompleted: Bool
    
    init(title: String) {
        self.title = title
        self.isCompleted = false
    }
}
 
class ToDoListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [Task] = []
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        loadTasks()
    }
    
    // MARK: - Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.title
        
        if task.isCompleted {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    // MARK: - Table View Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        tasks[indexPath.row].isCompleted = !tasks[indexPath.row].isCompleted
        tableView.reloadRows(at: [indexPath], with: .automatic)
        
        saveTasks()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            saveTasks()
        }
    }
    // MARK: - Actions
    
    @IBAction func addTask(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add Task", message: nil, preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Task title"
        }
        
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            if let title = alert.textFields?.first?.text, !title.isEmpty {
                let newTask = Task(title: title)
                self?.tasks.append(newTask)
                self?.tableView.reloadData()
                
                self?.saveTasks()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    // MARK: - Data Persistence
    
    func saveTasks() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(tasks)
            userDefaults.set(data, forKey: "tasks")
        } catch {
            print("Error encoding tasks: \(error.localizedDescription)")
        }
    }
    
    func loadTasks() {
        if let data = userDefaults.data(forKey: "tasks") {
            do {
                let decoder = JSONDecoder()
                tasks = try decoder.decode([Task].self, from: data)
                tableView.reloadData()
            } catch {
                print("Error decoding tasks: \(error.localizedDescription)")
            }
        }
    }
}

