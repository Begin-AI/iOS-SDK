//
//  ViewController.swift
//

import UIKit
import Begin

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let beginWorker = BeginWorker.init(appId: "d98fe930-5160-4673-9efc-4534fe89d443", licenseKey: "gb_DDmNJ_YyMp2CZCskZH5pBi1Gd_t0XWGXWY2tKvJ9314FxQszlVv83WDVpYwQ62K1vUBcyDY2NDgPWKy7fNSwS18LKcqI180ldnMNpkvuy0qjDx9youX5lU4x3QZjqVUTwn5C")
        
        beginWorker.registerUser(userId: "1337")
        
        beginWorker.updateUserDateField(key: "date_of_birth", day: "17", month: "04", year: "1987")
        beginWorker.updateLocationField(key: "location", value: LocationModel.init(latitude: 33.123, longitude: 32.110))
        beginWorker.updateUserTextField(key: "country", value: "Turkey")
        beginWorker.updateUserNumericalField(key: "number_of_bookings", value: 17)
        beginWorker.updateUserBooleanField(key: "is_admin", value: false)
                
        beginWorker.registerObject(objectName: "home", objectId: "1")
        beginWorker.registerObject(objectName: "home", objectId: "2")
        beginWorker.registerObject(objectName: "home_not_existing", objectId: "2")
        
        beginWorker.updateObjectTextField(objectType: "home", objectId: "1", key: "Book-Title", value: "Shingeki no Kyojin")
        beginWorker.updateObjectTextField(objectType: "home", objectId: "1", key: "Book-Author", value: "Hajime Isayama")
        beginWorker.updateObjectTextField(objectType: "home", objectId: "1", key: "Year-Of-Publication", value: "2009")
        beginWorker.updateObjectTextField(objectType: "home", objectId: "1", key: "Publisher", value: "Kodansha")
        beginWorker.updateObjectTextField(objectType: "home", objectId: "2", key: "Publisher", value: "Kodansha")
        beginWorker.updateObjectTextField(objectType: "home", objectId: "3", key: "location", value: "Japan")
        beginWorker.updateObjectTextField(objectType: "home_not_existing", objectId: "2", key: "location", value: "Japan")
        beginWorker.updateObjectTextField(objectType: "home_not_existing", objectId: "3", key: "location", value: "Japan")

        beginWorker.updateObjectNumericalField(objectType: "home", objectId: "1", key: "number_of_rooms", value: 4)
        beginWorker.updateObjectBooleanField(objectType: "home", objectId: "1", key: "has_hottub", value: true)
        beginWorker.updateObjectBooleanField(objectType: "home", objectId: "1", key: "has_crib", value: false)
        beginWorker.updateObjectBooleanField(objectType: "home", objectId: "1", key: "has_wifi", value: true)
        beginWorker.updateObjectBooleanField(objectType: "home", objectId: "1", key: "has_fast_wifi", value: false)
        beginWorker.updateObjectBooleanField(objectType: "home", objectId: "1", key: "has_game_console", value: true)
        beginWorker.updateObjectBooleanField(objectType: "home", objectId: "1", key: "has_full_kitchen", value: false)
        beginWorker.updateObjectBooleanField(objectType: "home", objectId: "1", key: "has_basic_kitchen", value: true)
        
        beginWorker.registerInteraction(objectType: "home", objectId: "1", value: "reviewed")
        beginWorker.registerInteraction(objectType: "home2", objectId: "1", value: "reviewed")
        
        beginWorker.addLabel(objectType: "home", objectId: "1", value: "booking_rate_high")
        beginWorker.addLabel(objectType: "home", objectId: "1", value: "booking_rate_low")
        beginWorker.addLabel(objectType: "home", objectId: "2", value: "booking_rate_low")
        beginWorker.addLabel(objectType: "home", objectId: "2", value: "erewrerwrwere")
        beginWorker.addLabel(objectType: "user", objectId: "1337", value: "booking_rate_high")
        beginWorker.addLabel(objectType: "home_not_existing", objectId: "111", value: "booking_rate_high")

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

