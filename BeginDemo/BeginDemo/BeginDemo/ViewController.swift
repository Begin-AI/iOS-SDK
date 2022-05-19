//
//  ViewController.swift
//

import UIKit
import Begin

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let beginWorker = BeginWorker.init(appId: "1facc60a-6e8d-4272-adb6-9e69df734865", licenseKey: "gb_cGxo76g8EyWRfZABURt_6vhxg26h6MatmRYb6FTfSSqbXhd8TlQ_diDfOplOAMqyRGmUJv4fUNeH4aeuYadheTvvvtPRx3oVLReTVV5RIESo4vWQWi1lI6yHAd_teAixhGKp")
        
        beginWorker.registerUser(userId: "1337")
        
        beginWorker.updateUserDateField(key: "date_of_birth", day: "17", month: "04", year: "1987")
        beginWorker.updateUserDateField(key: "joining_date", day: "17", month: "04", year: "2000")
        beginWorker.updateLocationField(key: "location", value: LocationModel.init(latitude: 33.123, longitude: 32.110))
        beginWorker.updateUserTextField(key: "user_category_field", value: "romance")
        beginWorker.updateUserNumericalField(key: "user_number_field", value: 7)
        beginWorker.updateUserBooleanField(key: "user_boolean_field", value: true)
                
        beginWorker.registerObject(objectName: "book", objectId: "1")
        beginWorker.registerObject(objectName: "book", objectId: "2")
        beginWorker.registerObject(objectName: "book_not_existing", objectId: "2")
        
        // book 1
        beginWorker.updateObjectTextField(objectType: "book", objectId: "1", key: "is_ebook", value: "true")
        beginWorker.updateObjectTextField(objectType: "book", objectId: "1", key: "publication_month", value: "7")
        beginWorker.updateObjectTextField(objectType: "book", objectId: "1", key: "publication_year", value: "1927")
        beginWorker.updateObjectTextField(objectType: "book", objectId: "1", key: "genre_1", value: "fiction")
        beginWorker.updateObjectTextField(objectType: "book", objectId: "1", key: "genre_2", value: "fantasy_paranormal")
        beginWorker.updateObjectTextField(objectType: "book", objectId: "1", key: "genre_3", value: "romance")

        beginWorker.updateObjectNumericalField(objectType: "book", objectId: "1", key: "text_reviews_count", value: 17)
        beginWorker.updateObjectNumericalField(objectType: "book", objectId: "1", key: "average_rating", value: 3)
        beginWorker.updateObjectNumericalField(objectType: "book", objectId: "1", key: "num_pages", value: 15)
        beginWorker.updateObjectNumericalField(objectType: "book", objectId: "1", key: "ratings_count", value: 33)
        beginWorker.updateObjectNumericalField(objectType: "book", objectId: "1", key: "avg_author_rating", value: 1)
        beginWorker.updateObjectNumericalField(objectType: "book", objectId: "1", key: "avg_author_reviews_count", value: 100)
        beginWorker.updateObjectNumericalField(objectType: "book", objectId: "1", key: "sum_all_author_ratings", value: 5)
        
        // book 2
        beginWorker.updateObjectTextField(objectType: "book", objectId: "2", key: "is_ebook", value: "false")
        beginWorker.updateObjectTextField(objectType: "book", objectId: "2", key: "publication_month", value: "3")
        beginWorker.updateObjectTextField(objectType: "book", objectId: "2", key: "publication_year", value: "1955")
        beginWorker.updateObjectTextField(objectType: "book", objectId: "2", key: "genre_1", value: "children")
        beginWorker.updateObjectTextField(objectType: "book", objectId: "2", key: "genre_2", value: "comics_graphic")
        beginWorker.updateObjectTextField(objectType: "book", objectId: "2", key: "genre_3", value: "poetry")
        
        beginWorker.updateObjectNumericalField(objectType: "book", objectId: "2", key: "text_reviews_count", value: 11)
        beginWorker.updateObjectNumericalField(objectType: "book", objectId: "2", key: "average_rating", value: 7)
        beginWorker.updateObjectNumericalField(objectType: "book", objectId: "2", key: "num_pages", value: 3)
        beginWorker.updateObjectNumericalField(objectType: "book", objectId: "2", key: "ratings_count", value: 41)
        beginWorker.updateObjectNumericalField(objectType: "book", objectId: "2", key: "avg_author_rating", value: 4)
        beginWorker.updateObjectNumericalField(objectType: "book", objectId: "2", key: "avg_author_reviews_count", value: 37)
        beginWorker.updateObjectNumericalField(objectType: "book", objectId: "2", key: "sum_all_author_ratings", value: 3)
        
        // book that doesn't exist
        beginWorker.updateObjectTextField(objectType: "book_not_existing", objectId: "2", key: "location", value: "Japan")
        beginWorker.updateObjectTextField(objectType: "book_not_existing", objectId: "3", key: "location", value: "Japan")

        // interactions
        beginWorker.registerInteraction(objectType: "book", objectId: "1", value: "rated_1")
        beginWorker.registerInteraction(objectType: "book", objectId: "1", value: "rated_5")
        beginWorker.registerInteraction(objectType: "book2", objectId: "1", value: "is_reviewed")
        
        // labels
        beginWorker.addLabel(objectType: "book", objectId: "1", value: "some")
        beginWorker.addLabel(objectType: "book", objectId: "1", value: "random")
        beginWorker.addLabel(objectType: "book", objectId: "2", value: "label")
        beginWorker.addLabel(objectType: "book", objectId: "2", value: "hello")
        
        beginWorker.addLabel(objectType: "user", objectId: "1337", value: "fake")
        beginWorker.addLabel(objectType: "user", objectId: "1337", value: "hello")
        
        beginWorker.addLabel(objectType: "book_not_existing", objectId: "111", value: "some")

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

