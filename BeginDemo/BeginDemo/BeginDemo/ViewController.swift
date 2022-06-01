//
//  ViewController.swift
//

import UIKit
import Begin

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // default
        let beginWorker = BeginWorker.init(appId: "1facc60a-6e8d-4272-adb6-9e69df734865", licenseKey: "gb_cGxo76g8EyWRfZABURt_6vhxg26h6MatmRYb6FTfSSqbXhd8TlQ_diDfOplOAMqyRGmUJv4fUNeH4aeuYadheTvvvtPRx3oVLReTVV5RIESo4vWQWi1lI6yHAd_teAixhGKp")
//
//        // recommend
//        let beginWorker = BeginWorker.init(appId: "36896e56-3be5-4f2c-9280-253efa861d43", licenseKey: "gb_qHQr76TEsI0dA5Elvmeieib4qg07bCiPNncPFA7lg3nGxOGx5U4pFYFqQYx3GJZy4CTk6R-IhDUZOXyGFM3lQcvI4Cbvp-oBURRVRucxEy_ahvGgmcPL-I6B06OdF9RRAZTo")
//
//        // classify
//        let beginWorker = BeginWorker.init(appId: "b8565560-3a20-48ff-a69a-e58492b8ed3e", licenseKey: "gb_-OrJbc_ySEmgt-t0PUKrYLbnTin_zOfC4f-jF6cCbwsdIsVoKgHP51eYD81C-Rdx8E4Q4HkXNk8oAo27RG5c1Rn_4U6pz59EJmV80JOSY9wxcsZ8FI7iK3SeFGvK7AahLCnR")
//
//        // predict
//        let beginWorker = BeginWorker.init(appId: "36896e56-3be5-4f2c-9280-253efa861d43", licenseKey: "gb_qHQr76TEsI0dA5Elvmeieib4qg07bCiPNncPFA7lg3nGxOGx5U4pFYFqQYx3GJZy4CTk6R-IhDUZOXyGFM3lQcvI4Cbvp-oBURRVRucxEy_ahvGgmcPL-I6B06OdF9RRAZTo")
        
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
        beginWorker.registerInteraction(objectType: "book", value: "rated_1", objectId: "1")
        beginWorker.registerInteraction(objectType: "book", value: "rated_5", objectId: "1")
        beginWorker.registerInteraction(objectType: "book2", value: "is_reviewed", objectId: "1")
        
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
        BeginWorker.shared().predictEngagement(projectId: "735d1ff6-feec-4f33-abaf-58a253919223", objectId: "5333265", userId: "22", success:  { [self] (result) in
            print("Begin API Response: \(result)")
        }) { (message) in
            print("Begin API Response \(message)")
        }
    }
    
    @IBAction func recommend (){
        BeginWorker.shared().recommend(projectId: "13601f88-a80d-4e1c-b335-298b5af845c9", userId: "22", success:  { [self] (result) in
            print("Begin API Response: \(result)")
        }) { (message) in
            print("Begin API Response \(message)")
        }
    }
    
    @IBAction func classify (){
        BeginWorker.shared().classify(projectId: "5f534c16-158c-4041-89ce-ce3acc5de251", id: "30", success:  { [self] (result) in
            print("Begin API Response: \(result)")
        }) { (message) in
            print("Begin API Response \(message)")
        }
    }
    @IBAction func showUserInfo (){
        showMessage(msg: BeginWorker.shared().logTest())
    }

    @IBAction func learnFromData (){
        BeginWorker.shared().learnFromData()
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

