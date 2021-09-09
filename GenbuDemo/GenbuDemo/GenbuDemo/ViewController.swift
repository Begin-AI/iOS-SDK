//
//  ViewController.swift
//  GenbuDemo
//
//  Created by Serhan CANOVA on 19.08.2021.
//

import UIKit
import Genbu

class ViewController: UIViewController {

    var genbuWorker : GenbuWorker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        genbuWorker = GenbuWorker.init(url: "https://1065d990-67a0-4541-9cc5-74ee9787d4f9.mock.pstmn.io", appId: "bf5c1c94-dfb5-4775-a060-36e906c2dcc5", secretKey: "42d74395-9a60-47d5-9418-7c223770e6fa")
        
        //user 1
//        genbuWorker.updateTextFeature(key: "userBirthDate", value: "28-09-1997")
//        genbuWorker.updateLocationFeature(key: "userBirthLocation", value: LocationModel.init(latitude: 39.768403, longitude: -86.158068))
//        genbuWorker.updateLocationFeature(key: "userLastKnownLocation", value: LocationModel.init(latitude: 39.768403, longitude: -86.158068))
//        genbuWorker.updateTextFeature(key: "userJoinDate", value: "14-01-2021")
//        genbuWorker.updateNumericalFeature(key: "userGender", value: -1)
//        genbuWorker.updateTextFeature(key: "userBio", value: "Mmm")
//        genbuWorker.updateTextFeature(key: "userCurrentTimezone", value: "+00:00")
//        genbuWorker.updateTextFeature(key: "userCurrentCountry", value: "")
//        genbuWorker.updateTextFeature(key: "userCurrentCity", value: "")
//        genbuWorker.updateTextFeature(key: "userRelationshipStatus", value: "")
//        genbuWorker.updateTextFeature(key: "userHereFor", value: "MARRIAGE")
//        genbuWorker.updateNumericalFeature(key: "userStraightHidden", value: 1)
//        genbuWorker.updateTextFeature(key: "userAstrologyKnowledge", value: "KNOWLEDGE_BIRTH_CHART")
//        genbuWorker.updateTextFeature(key: "userZodiacSign", value: "LIBRA")
//        genbuWorker.updateTextFeature(key: "userRegiPlatform", value: "iOS")
//        genbuWorker.updateNumericalFeature(key: "userOnlyForFriendship", value: 0)
//        genbuWorker.updateNumericalFeature(key: "usprShareHereFor", value: 1)
//        genbuWorker.updateNumericalFeature(key: "usprAgeMin", value: 18)
//        genbuWorker.updateNumericalFeature(key: "usprAgeMax", value: 33)
//        genbuWorker.updateTextFeature(key: "userName", value: "Becky")
//        genbuWorker.updateTextFeature(key: "userUsername", value: "beckybecky")
//        genbuWorker.updateTextFeature(key: "userEmail", value: "jynerso79@gmail.com")
//        genbuWorker.updateTextFeature(key: "userHowDoYouLoveAstrology", value: "")
        
        //user 2
        genbuWorker.updateTextFeature(key: "userBirthDate", value: "09-12-1989")
        genbuWorker.updateLocationFeature(key: "userBirthLocation", value: LocationModel.init(latitude: 36.8507689, longitude: -76.2858726))
        genbuWorker.updateLocationFeature(key: "userLastKnownLocation", value: LocationModel.init(latitude: 29.0405489, longitude: -81.380449))
        genbuWorker.updateTextFeature(key: "userJoinDate", value: "20-05-2018")
        genbuWorker.updateNumericalFeature(key: "userGender", value: 0)
        genbuWorker.updateTextFeature(key: "userBio", value: "")
        genbuWorker.updateTextFeature(key: "userCurrentTimezone", value: "-04:00")
        genbuWorker.updateTextFeature(key: "userCurrentCountry", value: "United States")
        genbuWorker.updateTextFeature(key: "userCurrentCity", value: "Orlando")
        genbuWorker.updateTextFeature(key: "userRelationshipStatus", value: "SINGLE")
        genbuWorker.updateTextFeature(key: "userHereFor", value: "")
        genbuWorker.updateNumericalFeature(key: "userStraightHidden", value: EMPTY_NUMBER)
        genbuWorker.updateTextFeature(key: "userAstrologyKnowledge", value: "")
        genbuWorker.updateTextFeature(key: "userZodiacSign", value: "SAGITTARIUS")
        genbuWorker.updateTextFeature(key: "userRegiPlatform", value: "android")
        genbuWorker.updateNumericalFeature(key: "userOnlyForFriendship", value: EMPTY_NUMBER)
        genbuWorker.updateNumericalFeature(key: "usprShareHereFor", value: EMPTY_NUMBER)
        genbuWorker.updateNumericalFeature(key: "usprAgeMin", value: EMPTY_NUMBER)
        genbuWorker.updateNumericalFeature(key: "usprAgeMax", value: 33)
        genbuWorker.updateTextFeature(key: "userName", value: "Stephanie")
        genbuWorker.updateTextFeature(key: "userUsername", value: "Stephaniexo")
        genbuWorker.updateTextFeature(key: "userEmail", value: "sslynn89@gmail.com")
        genbuWorker.updateTextFeature(key: "userHowDoYouLoveAstrology", value: "")
        
        //user 3
//        genbuWorker.updateTextFeature(key: "userBirthDate", value: "10-12-1995")
//        genbuWorker.updateLocationFeature(key: "userBirthLocation", value: LocationModel.init(latitude: 35.2827524, longitude: -120.6596156))
//        genbuWorker.updateLocationFeature(key: "userLastKnownLocation", value: LocationModel.init(latitude: 40.86965111, longitude: -124.08079346))
//        genbuWorker.updateTextFeature(key: "userJoinDate", value: "24-05-2020")
//        genbuWorker.updateNumericalFeature(key: "userGender", value: 0)
//        genbuWorker.updateTextFeature(key: "userBio", value: "I'll come back to this later. Ig: mebbzy")
//        genbuWorker.updateTextFeature(key: "userCurrentTimezone", value: "-07:00")
//        genbuWorker.updateTextFeature(key: "userCurrentCountry", value: "United States")
//        genbuWorker.updateTextFeature(key: "userCurrentCity", value: "Atascadero")
//        genbuWorker.updateTextFeature(key: "userRelationshipStatus", value: "")
//        genbuWorker.updateTextFeature(key: "userHereFor", value: "CASUAL")
//        genbuWorker.updateNumericalFeature(key: "userStraightHidden", value: 0)
//        genbuWorker.updateTextFeature(key: "userAstrologyKnowledge", value: "KNOWLEDGE_SUN_RISING")
//        genbuWorker.updateTextFeature(key: "userZodiacSign", value: "SAGITTARIUS")
//        genbuWorker.updateTextFeature(key: "userRegiPlatform", value: "iOS")
//        genbuWorker.updateNumericalFeature(key: "userOnlyForFriendship", value: 0)
//        genbuWorker.updateNumericalFeature(key: "usprShareHereFor", value: 1)
//        genbuWorker.updateNumericalFeature(key: "usprAgeMin", value: 18)
//        genbuWorker.updateNumericalFeature(key: "usprAgeMax", value: 34)
//        genbuWorker.updateTextFeature(key: "userName", value: "Madeline")
//        genbuWorker.updateTextFeature(key: "userUsername", value: "Mebbzy")
//        genbuWorker.updateTextFeature(key: "userEmail", value: "minarik.madeline@gmail.com")
//        genbuWorker.updateTextFeature(key: "userHowDoYouLoveAstrology", value: "")
        
//        user 4
//        genbuWorker.updateTextFeature(key: "userBirthDate", value: "24-03-1988")
//        genbuWorker.updateTextFeature(key: "userJoinDate", value: "11-03-1988")
//        genbuWorker.updateNumericalFeature(key: "userGender", value: -1)
//        genbuWorker.updateTextFeature(key: "userRelationshipStatus", value: "SINGLE")
//        genbuWorker.updateTextFeature(key: "userJobTitle", value: "mad man")
//        genbuWorker.updateTextFeature(key: "userHereFor", value: "CASUAL")
//        genbuWorker.updateTextFeature(key: "userRegiPlatform", value: "iOS")
//        genbuWorker.updateNumericalFeature(key: "usprAgeMin", value: 30)
//        genbuWorker.updateNumericalFeature(key: "usprAgeMax", value: 54)
//        genbuWorker.updateTextFeature(key: "userHowDoYouLoveAstrology", value: "a bit")
//        genbuWorker.updateTextFeature(key: "userAstrologyKnowledge", value: "KNOWLEDGE_BIRTH_CHART")
//        genbuWorker.updateTextFeature(key: "userBirthCountry", value: "syria")
//        genbuWorker.updateTextFeature(key: "first_name", value: "Rima")
//        genbuWorker.updateTextFeature(key: "userName", value: "Al Shikh")
//        genbuWorker.updateTextFeature(key: "userEmail", value: "rr222@example.com")
//        genbuWorker.updateTextFeature(key: "userZodiacSign", value: "ARIES")
//        genbuWorker.updateTextFeature(key: "userBio", value: "some stuff")
//        genbuWorker.updateTextFeature(key: "userCurrentTimezone", value: "+03:00")
//        genbuWorker.updateTextFeature(key: "userCurrentCountry", value: "Canada")
//        genbuWorker.updateTextFeature(key: "userCurrentCity", value: "Halifax")
//        genbuWorker.updateTextFeature(key: "userLastLocationCountry", value: "Canada")
//        genbuWorker.updateTextFeature(key: "userUsername", value: "Helena11")
//        genbuWorker.updateLocationFeature(key: "userBirthLocation", value: LocationModel.init(latitude: 35.25135230502901, longitude: 36.57091427991631))
//        genbuWorker.updateLocationFeature(key: "userLastKnownLocation", value: LocationModel.init(latitude: 44.65522534609574, longitude: -63.59272918496815))
        
    }
    
    
    
    @IBAction func inference (){
        genbuWorker.inference()
    }

    @IBAction func showUserInfo (){
        showMessage(msg: genbuWorker.logTest())
    }

    @IBAction func fetchInstructions (){
        genbuWorker.fetchInstructions()
    }
    
    @IBAction func changeUserName (){
        genbuWorker.updateTextFeature(key: "userUsername", value: "Rima")
        showMessage(msg: genbuWorker.logTest())
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

