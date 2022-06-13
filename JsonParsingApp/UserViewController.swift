//
//  UserViewController.swift
//  JsonParsingApp
//
//  Created by Pritam Dash on 14/06/22.
//

import UIKit

class UserViewController: UIViewController, UITableViewDataSource{
    
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var downloadedDataTableView: UITableView!
    
    var dataArray : [[String : Any]] = []   //Array of dictionary.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Attaching data source
        downloadedDataTableView.dataSource = self
    }

    @IBAction func downloadButtonClicked(_ sender: UIButton) {
        //On the click of the button, app downloads the data from the url mentioned.
        let strUrl = "https://jsonplaceholder.typicode.com/users"
        //We need to convert the given string to proper url using url class.
        let myUrl : URL? = URL(string: strUrl)
        
        //prepare GET Request
        var request : URLRequest = URLRequest(url: myUrl!)
        //specify request method.
        request.httpMethod = "GET"
        
        //create connection with URL using URL Session
        let session : URLSession = URLSession.shared
        
        //session.dataTask(with: <#T##URLRequest#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
        //completionHandler is a closure which will fetch 3 types of data.
        let dataTask : URLSessionDataTask = session.dataTask(with: request, completionHandler: downloadHandler(urlData:response:error:))
        
        //after passing the handler we resume the data task.
        dataTask.resume()
        
    }// eof Action
    
    //downloadHandler works in child thread
    func downloadHandler(urlData : Data?, response : URLResponse? , error : Error?) ->Void {
        //The urlData is in binary format.
        if(urlData != nil && error == nil){
            print("Downloaded data - ",urlData!)
            //O/p : Downloaded data -  5645 bytes
        }
        
        //The response data that we get from internet will be in form of Json, in that json the data might be in array, object, array of object format.
        //We need to convert the response data into apropriate swift format. For that a class is given to us known as "JSONSerialization" that converts json to swift data and viceversa.
        
        //The jsonObject() returns "Any" type so if the response starts from "[" then swift will convert it to array else if response starts from "{" the it will convert it to dictionary.
        //This can happen that you expect Json data but in response you get image, pdf, etc format data so there is scope of error, hence the suggestion is to keep it in do try catch block.
        //The line you expect an error add "try" in front of it.
        do{
            let swiftData : Any? = try JSONSerialization.jsonObject(with: urlData! ,options: JSONSerialization.ReadingOptions.mutableLeaves)
            
            if(swiftData != nil){
                dataArray = swiftData as! [[String : Any]]      //Here we are typecasting Any type of data to Array of dictionary
                
                print("Downloaded data - ",dataArray)
                //As reloadData needs to happen only in main thread we need to use DispatchQueue to switch threads to main.
                DispatchQueue.main.async(execute: {
                    self.downloadedDataTableView.reloadData()
                })
                
            }
        }
        catch{
            print("Error : ",error)
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: nil)
        
        //get dictionary of Index Path
        let dictionary : [String : Any] = dataArray[indexPath.row]
        //All the values are of type "Any" so we need to specially mask them to appropriate types.
        let id : Int = dictionary["id"] as! Int
        let name : String  = dictionary["name"] as! String
        let email : String = dictionary["email"] as! String
        let phoneNumber : String = dictionary["phone"] as! String
        //In order to store address we will get a dictionary
        let address : [String : Any] = dictionary["address"] as! [String:Any]
        let city : String = address["city"] as! String
        
        //Company is in dictinoary format.
        let company : [String : Any] = dictionary["company"] as! [String : Any]
        let companyName : String = company["name"] as! String
        cell.textLabel?.text = "\(id). \(name) at \(city)"
        cell.detailTextLabel?.text = "\(email), \(phoneNumber) ,\(companyName)"
        return cell
    }
}

