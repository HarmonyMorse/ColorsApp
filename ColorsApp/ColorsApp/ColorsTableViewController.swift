//
//  ColorsTableViewController.swift
//  ColorsApp
//
//  Created by Harm on 1/7/23.
//

import UIKit

class ColorsTableViewController: UIViewController {
    
    var colors: [UIColor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createAllRandomColors()
        // Do any additional setup after loading the view.
    }
    
    func createAllRandomColors() {
        for _ in 0..<50 {
            colors.append(createOneRandomColor())
        }
    }
    
    func createOneRandomColor() -> UIColor {
        let randomColor = UIColor(red: CGFloat.random(in: 0...1),
                                  green: CGFloat.random(in: 0...1),
                                  blue: CGFloat.random(in: 0...1),
                                  alpha: 1)
        return randomColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? ColorsDetailViewController else { return }
        destinationVC.color = sender as? UIColor
    }
    
}


extension ColorsTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell") else { return UITableViewCell() }
        
        cell.backgroundColor = colors[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        performSegue(withIdentifier: "ToColorsDetailViewController", sender: color)
    }

}
