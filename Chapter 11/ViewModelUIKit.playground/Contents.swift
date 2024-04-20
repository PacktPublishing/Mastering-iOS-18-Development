//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import Combine

class MyViewModel {
    struct Item: Codable {
        let title: String
        let description: String
    }
    
    var dataPublisher: AnyPublisher<[Item], Error> {
        return URLSession.shared.dataTaskPublisher(for: URL(string: "https://api.example.com/data")!)
            .map { $0.data }
            .decode(type: [Item].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

class MyViewController: UIViewController {
    let viewModel = MyViewModel()
    var cancellables = Set<AnyCancellable>()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        
        let fetchButton = UIButton(type: .system)
        fetchButton.setTitle("Fetch Data", for: .normal)
        fetchButton.addTarget(self, action: #selector(fetchDataButtonTapped), for: .touchUpInside)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: fetchButton)
        
        // Subscribe to viewModel's dataPublisher
        viewModel.dataPublisher
            .sink(receiveCompletion: { completion in
            }, receiveValue: { [weak self] data in
                self?.updateTableView(with: data)
            })
            .store(in: &cancellables)
    }
    
    @objc private func fetchDataButtonTapped() {
        // Trigger fetching data by accessing viewModel's dataPublisher
        viewModel.dataPublisher
            .sink(receiveCompletion: { _ in },
                  receiveValue: { _ in })
            .store(in: &cancellables)
    }
    
    private func updateTableView(with data: [MyViewModel.Item]) {
        // Update tableView with fetched data
    }
}

extension MyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return number of rows based on fetched data
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure tableView cell with fetched data
        return UITableViewCell()
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
