//
//  ViewController.swift
//  JsonParsingApp
//
//  Created by Pritam Dash on 13/06/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{
    
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var downloadedDataTableView: UITableView!
    
    var dataArray = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func downloadButtonClicked(_ sender: UIButton) {
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}

