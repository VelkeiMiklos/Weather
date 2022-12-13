//
//  CitiesWeatherViewController.swift
//  Weather
//
//  Created by MV on 2022. 12. 12..
//

import UIKit

class CitiesWeatherViewController: BaseController {
    
    //MARK: - Variables
    let tableView = UITableView()
    var cities    : [City] = []
    
    //MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        configureViewController()
        configureTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readCities(fileName: "cities", type: "json")
    }

}

//MARK: - Methods
extension CitiesWeatherViewController{
    
    private func readCities(fileName: String, type: String){
        
        showLoadingView()
        guard let path = Bundle.main.path(forResource: fileName, ofType: type) else {
            dismissLoadingView()
            self.showEmptyView(message: "label_empty_cities".localized(), view: self.view)
            return
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            do {
                let decodedData = try JSONDecoder().decode(Cities.self, from: data)
                self.cities = decodedData.cities
                dismissLoadingView()
                if self.cities.isEmpty{
                    self.showEmptyView(message: "label_empty_cities".localized(), view: self.view)
                } else {
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            } catch {
                dismissLoadingView()
                self.showEmptyView(message: "label_empty_cities".localized(), view: self.view)
                print("error: \(error)")
            }
        } catch {
            dismissLoadingView()
            self.showEmptyView(message: "label_empty_cities".localized(), view: self.view)
            print("error: \(error)")
        }
    }
    
    private func showEmptyView(message: String, view: UIView) {
        
        let emptyView = WEmptyView(message: message)
        view.addSubview(emptyView)
        emptyView.fillSuperview()
        
    }
    
}

//MARK: - Configure Methods
extension CitiesWeatherViewController{
    
    func configureViewController() {
        
        view.backgroundColor    = .systemBackground
        title                   = "nav_weather_title".localized()
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    func configureTableView() {
        
        view.addSubview(tableView)
        
        tableView.fillSuperview()
        tableView.rowHeight     = 75
        tableView.delegate      = self
        tableView.dataSource    = self
        
        tableView.register(CityCell.self, forCellReuseIdentifier: CityCell.reuseId)
    }
    
}

//MARK: - Table View
extension CitiesWeatherViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityCell.reuseId) as! CityCell
        let city = cities[indexPath.row]
        cell.set(city: city)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCity    = cities[indexPath.row]
        let destController = CityViewController(city: selectedCity.city)
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(destController, animated: true)
    }
    
}
