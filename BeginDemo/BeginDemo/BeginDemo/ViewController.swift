//
//  ViewController.swift
//

import UIKit
import Begin

class ViewController: UIViewController {
    
    var beginWorker : BeginWorker!

    override func viewDidLoad() {
        super.viewDidLoad()

        beginWorker = BeginWorker.init(url: "https://1065d990-67a0-4541-9cc5-74ee9787d4f9.mock.pstmn.io", appId: "bf5c1c94-dfb5-4775-a060-36e906c2dcc5", secretKey: "42d74395-9a60-47d5-9418-7c223770e6fa")

        //user 1
//        beginWorker.updateTextFeature(key: "userBirthDate", value: "28-09-1997")
//        beginWorker.updateLocationFeature(key: "userBirthLocation", value: LocationModel.init(latitude: 39.768403, longitude: -86.158068))
//        beginWorker.updateLocationFeature(key: "userLastKnownLocation", value: LocationModel.init(latitude: 39.768403, longitude: -86.158068))
//        beginWorker.updateTextFeature(key: "userJoinDate", value: "14-01-2021")
//        beginWorker.updateNumericalFeature(key: "userGender", value: -1)
//        beginWorker.updateTextFeature(key: "userBio", value: "Mmm")
//        beginWorker.updateTextFeature(key: "userCurrentTimezone", value: "+00:00")
//        beginWorker.updateTextFeature(key: "userCurrentCountry", value: "")
//        beginWorker.updateTextFeature(key: "userCurrentCity", value: "")
//        beginWorker.updateTextFeature(key: "userRelationshipStatus", value: "")
//        beginWorker.updateTextFeature(key: "userHereFor", value: "MARRIAGE")
//        beginWorker.updateNumericalFeature(key: "userStraightHidden", value: 1)
//        beginWorker.updateTextFeature(key: "userAstrologyKnowledge", value: "KNOWLEDGE_BIRTH_CHART")
//        beginWorker.updateTextFeature(key: "userZodiacSign", value: "LIBRA")
//        beginWorker.updateTextFeature(key: "userRegiPlatform", value: "iOS")
//        beginWorker.updateNumericalFeature(key: "userOnlyForFriendship", value: 0)
//        beginWorker.updateNumericalFeature(key: "usprShareHereFor", value: 1)
//        beginWorker.updateNumericalFeature(key: "usprAgeMin", value: 18)
//        beginWorker.updateNumericalFeature(key: "usprAgeMax", value: 33)
//        beginWorker.updateTextFeature(key: "userName", value: "Becky")
//        beginWorker.updateTextFeature(key: "userUsername", value: "beckybecky")
//        beginWorker.updateTextFeature(key: "userEmail", value: "jynerso79@gmail.com")
//        beginWorker.updateTextFeature(key: "userHowDoYouLoveAstrology", value: "")

        //user 2
        beginWorker.updateTextFeature(key: "userBirthDate", value: "09-12-1989")
        beginWorker.updateLocationFeature(key: "userBirthLocation", value: LocationModel.init(latitude: 36.8507689, longitude: -76.2858726))
        beginWorker.updateLocationFeature(key: "userLastKnownLocation", value: LocationModel.init(latitude: 29.0405489, longitude: -81.380449))
        beginWorker.updateTextFeature(key: "userJoinDate", value: "20-05-2018")
        beginWorker.updateNumericalFeature(key: "userGender", value: 0)
        beginWorker.updateTextFeature(key: "userBio", value: "")
        beginWorker.updateTextFeature(key: "userCurrentTimezone", value: "-04:00")
        beginWorker.updateTextFeature(key: "userCurrentCountry", value: "United States")
        beginWorker.updateTextFeature(key: "userCurrentCity", value: "Orlando")
        beginWorker.updateTextFeature(key: "userRelationshipStatus", value: "SINGLE")
        beginWorker.updateTextFeature(key: "userHereFor", value: "")
        beginWorker.updateNumericalFeature(key: "userStraightHidden", value: EMPTY_NUMBER)
        beginWorker.updateTextFeature(key: "userAstrologyKnowledge", value: "")
        beginWorker.updateTextFeature(key: "userZodiacSign", value: "SAGITTARIUS")
        beginWorker.updateTextFeature(key: "userRegiPlatform", value: "android")
        beginWorker.updateNumericalFeature(key: "userOnlyForFriendship", value: EMPTY_NUMBER)
        beginWorker.updateNumericalFeature(key: "usprShareHereFor", value: EMPTY_NUMBER)
        beginWorker.updateNumericalFeature(key: "usprAgeMin", value: EMPTY_NUMBER)
        beginWorker.updateNumericalFeature(key: "usprAgeMax", value: 33)
        beginWorker.updateTextFeature(key: "userName", value: "Stephanie")
        beginWorker.updateTextFeature(key: "userUsername", value: "Stephaniexo")
        beginWorker.updateTextFeature(key: "userEmail", value: "sslynn89@gmail.com")
        beginWorker.updateTextFeature(key: "userHowDoYouLoveAstrology", value: "")

        //user 3
//        beginWorker.updateTextFeature(key: "userBirthDate", value: "10-12-1995")
//        beginWorker.updateLocationFeature(key: "userBirthLocation", value: LocationModel.init(latitude: 35.2827524, longitude: -120.6596156))
//        beginWorker.updateLocationFeature(key: "userLastKnownLocation", value: LocationModel.init(latitude: 40.86965111, longitude: -124.08079346))
//        beginWorker.updateTextFeature(key: "userJoinDate", value: "24-05-2020")
//        beginWorker.updateNumericalFeature(key: "userGender", value: 0)
//        beginWorker.updateTextFeature(key: "userBio", value: "I'll come back to this later. Ig: mebbzy")
//        beginWorker.updateTextFeature(key: "userCurrentTimezone", value: "-07:00")
//        beginWorker.updateTextFeature(key: "userCurrentCountry", value: "United States")
//        beginWorker.updateTextFeature(key: "userCurrentCity", value: "Atascadero")
//        beginWorker.updateTextFeature(key: "userRelationshipStatus", value: "")
//        beginWorker.updateTextFeature(key: "userHereFor", value: "CASUAL")
//        beginWorker.updateNumericalFeature(key: "userStraightHidden", value: 0)
//        beginWorker.updateTextFeature(key: "userAstrologyKnowledge", value: "KNOWLEDGE_SUN_RISING")
//        beginWorker.updateTextFeature(key: "userZodiacSign", value: "SAGITTARIUS")
//        beginWorker.updateTextFeature(key: "userRegiPlatform", value: "iOS")
//        beginWorker.updateNumericalFeature(key: "userOnlyForFriendship", value: 0)
//        beginWorker.updateNumericalFeature(key: "usprShareHereFor", value: 1)
//        beginWorker.updateNumericalFeature(key: "usprAgeMin", value: 18)
//        beginWorker.updateNumericalFeature(key: "usprAgeMax", value: 34)
//        beginWorker.updateTextFeature(key: "userName", value: "Madeline")
//        beginWorker.updateTextFeature(key: "userUsername", value: "Mebbzy")
//        beginWorker.updateTextFeature(key: "userEmail", value: "minarik.madeline@gmail.com")
//        beginWorker.updateTextFeature(key: "userHowDoYouLoveAstrology", value: "")

//        user 4
//        beginWorker.updateTextFeature(key: "userBirthDate", value: "24-03-1988")
//        beginWorker.updateTextFeature(key: "userJoinDate", value: "11-03-1988")
//        beginWorker.updateNumericalFeature(key: "userGender", value: -1)
//        beginWorker.updateTextFeature(key: "userRelationshipStatus", value: "SINGLE")
//        beginWorker.updateTextFeature(key: "userJobTitle", value: "mad man")
//        beginWorker.updateTextFeature(key: "userHereFor", value: "CASUAL")
//        beginWorker.updateTextFeature(key: "userRegiPlatform", value: "iOS")
//        beginWorker.updateNumericalFeature(key: "usprAgeMin", value: 30)
//        beginWorker.updateNumericalFeature(key: "usprAgeMax", value: 54)
//        beginWorker.updateTextFeature(key: "userHowDoYouLoveAstrology", value: "a bit")
//        beginWorker.updateTextFeature(key: "userAstrologyKnowledge", value: "KNOWLEDGE_BIRTH_CHART")
//        beginWorker.updateTextFeature(key: "userBirthCountry", value: "syria")
//        beginWorker.updateTextFeature(key: "first_name", value: "Rima")
//        beginWorker.updateTextFeature(key: "userName", value: "Al Shikh")
//        beginWorker.updateTextFeature(key: "userEmail", value: "rr222@example.com")
//        beginWorker.updateTextFeature(key: "userZodiacSign", value: "ARIES")
//        beginWorker.updateTextFeature(key: "userBio", value: "some stuff")
//        beginWorker.updateTextFeature(key: "userCurrentTimezone", value: "+03:00")
//        beginWorker.updateTextFeature(key: "userCurrentCountry", value: "Canada")
//        beginWorker.updateTextFeature(key: "userCurrentCity", value: "Halifax")
//        beginWorker.updateTextFeature(key: "userLastLocationCountry", value: "Canada")
//        beginWorker.updateTextFeature(key: "userUsername", value: "Helena11")
//        beginWorker.updateLocationFeature(key: "userBirthLocation", value: LocationModel.init(latitude: 35.25135230502901, longitude: 36.57091427991631))
//        beginWorker.updateLocationFeature(key: "userLastKnownLocation", value: LocationModel.init(latitude: 44.65522534609574, longitude: -63.59272918496815))

    }
    
    
    
    @IBAction func inference (){
        beginWorker.inference()
    }

    @IBAction func showUserInfo (){
        showMessage(msg: beginWorker.logTest())
    }

    @IBAction func fetchInstructions (){
        beginWorker.fetchInstructions()
    }
    
    @IBAction func changeUserName (){
        beginWorker.updateTextFeature(key: "userUsername", value: "Rima")
        showMessage(msg: beginWorker.logTest())
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

