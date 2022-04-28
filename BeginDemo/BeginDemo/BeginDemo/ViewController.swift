//
//  ViewController.swift
//

import UIKit
import Begin

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let beginWorker = BeginWorker.init(appId: "eaf848a4-9248-4959-9f68-5207ca99750f", licenseKey: "gb_mmY1QjtNMKImxKxqA4aah5r7st0DeNLWBrYWzfyULkp2qiYs9d89uEBgqv79qq5FeOnfEjUIXR07T5dhSt9_ArmS6IV73GnRIUG6V2nnx6aA1uIM2xWFdg0qmnzrbKiIKkfZ")
        
        beginWorker.registerUser(userId: "1337")
//        beginWorker.updateUserDateField(key: "date_of_birth", day: "17", month: "04", year: "1987")
//        beginWorker.updateLocationField(key: "location", value: LocationModel.init(latitude: 33.123, longitude: 32.110))
        beginWorker.updateUserTextField(key: "Size", value: "7")
        beginWorker.updateUserTextField(key: "Country", value: "Turkey")
        beginWorker.updateUserTextField(key: "Location", value: "Japan")
        beginWorker.updateUserNumericalField(key: "Age", value: 0)
        beginWorker.updateUserNumericalField(key: "User-ID", value: 7)
                
        beginWorker.registerObject(objectName: "content", objectId: "1")
        beginWorker.registerObject(objectName: "content", objectId: "2")
        
        beginWorker.updateObjectTextField(objectType: "content", objectId: "1", key: "Book-Title", value: "Shingeki no Kyojin")
        beginWorker.updateObjectTextField(objectType: "content", objectId: "1", key: "Book-Author", value: "Hajime Isayama")
        beginWorker.updateObjectTextField(objectType: "content", objectId: "1", key: "Year-Of-Publication", value: "2009")
        beginWorker.updateObjectTextField(objectType: "content", objectId: "1", key: "Publisher", value: "Kodansha")
        beginWorker.updateObjectTextField(objectType: "content", objectId: "1", key: "Image-URL-L", value: "https://static.wikia.nocookie.net/shingekinokyojin/images/d/db/Volume_1_Cover.png")
        beginWorker.updateObjectTextField(objectType: "content", objectId: "1", key: "Image-URL-M", value: "https://static.wikia.nocookie.net/shingekinokyojin/images/d/db/Volume_1_Cover.png")
        beginWorker.updateObjectTextField(objectType: "content", objectId: "1", key: "Image-URL-S", value: "https://static.wikia.nocookie.net/shingekinokyojin/images/d/db/Volume_1_Cover.png")
        beginWorker.updateObjectTextField(objectType: "content", objectId: "1", key: "No-Of-Digits", value: "How To Count Digits?")
        beginWorker.updateObjectNumericalField(objectType: "content", objectId: "1", key: "YoP-2000", value: 2009)
        
        beginWorker.registerInteraction(objectType: "content", objectId: "1", value: "1")
        beginWorker.registerInteraction(objectType: "content", objectId: "1", value: "2")
        beginWorker.registerInteraction(objectType: "content", objectId: "1", value: "7")
        
        beginWorker.registerInteraction(objectType: "content", objectId: "2", value: "3")
        beginWorker.registerInteraction(objectType: "content", objectId: "2", value: "4")

    }
    
    @IBAction func predictEngagement (){
        BeginWorker.shared().predictEngagement(projectId: "ade25f0b-921d-472b-a236-fecf4514ba28", objectId: "0195153448", userId: "2")
    }

    @IBAction func showUserInfo (){
        showMessage(msg: BeginWorker.shared().logTest())
    }

    @IBAction func learnFromData (){
        BeginWorker.shared().learnFromData()
    }
    
    @IBAction func changeUserName (){
        BeginWorker.shared().updateUserTextField(key: "user_name", value: "Serhan")
        BeginWorker.shared().updateUserDateField(key: "joining_date", day: "10", month: "03", year: "2011")
        showMessage(msg: BeginWorker.shared().logTest())
    }
    
    func showMessage (msg : String){
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        self.present(alert, animated: true)
        let duration: Double = 3
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
            alert.dismiss(animated: true)
        }
    }


}

