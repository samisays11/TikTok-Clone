//
//  Constants.swift
//  TikTok
//
//  Created by Osaretin Uyigue on 10/12/20.
//  Copyright © 2020 Osaretin Uyigue. All rights reserved.
//

import Photos
import UIKit
import Firebase
let barcodeIcon = UIImage(named: "barcode")
let magnifyIconInsideSearchbar = UIImage(named: "magnifying-search-lenses-tool")
let cancelIcon = UIImage(named: "cancelButtonIcon")
let landscapeIcon = UIImage(named: "landscapeIcon")
let effectsIcon = UIImage(named: "beauty")
let flipCameraIcon = UIImage(named: "flipCameraIcon")
let discardIcon = UIImage(named: "discardIcon")
let saveVideoCheckmarkIcon = UIImage(named: "saveVideoCheckmarkIcon")

let addFiltersToClipIcon = UIImage(named: "addFiltersToClipIcon")

let adjustclipsicon = UIImage(named: "adjustclipsicon")
let microphoneIcon = UIImage(named: "microphoneIcon")
let voiceEffectsIcon = UIImage(named: "voiceEffectsIcon")
let musicIcon = UIImage(named: "addSoundsIcon")
let secondmusicIcon = UIImage(named: "ic_music")

let timeEffectsIcon = UIImage(named: "timeEffectsIcon")
let emojiIcon = UIImage(named: "emojiIcon")
let enterTextIcon = UIImage(named: "enterTextIcon")
let archiveIcon = UIImage(named: "archive")
let postUploadIcon = UIImage(named: "postUploadIcon")
let iMessageIcon = UIImage(named: "iMessageIcon")
let instagramIcon = UIImage(named: "instagramIcon")
let igStoriesIcon = UIImage(named: "igStoriesIcon")
let snapchatIcon = UIImage(named: "snapchatIcon")
let privacyIcon = UIImage(named: "privacyIcon")
let allowCommentIcon = UIImage(named: "allowCommentIcon")
let allowDuetIcon = UIImage(named: "allowDuetIcon")
let saveVideoToDeviceIcon = UIImage(named: "saveVideoToDeviceIcon")
let allowStitchIcon = UIImage(named: "allowStitchIcon")
let rightArrowIcon = UIImage(named: "rightArrowIcon")
let selectedMediaCheckIcon = UIImage(named: "selectedMediaCheckIcon")
let unselectedMediaCheckIcon = UIImage(named: "unselectedMediaCheckIcon")
let expandAlbumsIcon = UIImage(named: "expandAlbumsIcon")
let speedIcon = UIImage(named: "ic_speed")
let beautyIcon = UIImage(named: "ic_beauty")

let countDownTimerIcon = UIImage(named: "ic_countdowntimer")
let flashIcon = UIImage(named: "ic_flash")
let userIcon = UIImage(named: "user")
let smalluserIcon = UIImage(named: "ic_smalluser")
let smallfacebookIcon = UIImage(named: "facebook_ic")
let googleIcon = UIImage(named: "google_ic")
let twitterIcon = UIImage(named: "twitter_ic")
let appleIcon = UIImage(named: "apple_ic")
let swipeRightArrow_ic = UIImage(named: "swiperightArrow_ic")






  var CURRENT_USER: User?

 func handleFetchCurrentUser() {
    guard let currentUid = Auth.auth().currentUser?.uid else {return}
    Database.database().reference().child("users").child(currentUid).observeSingleEvent(of: .value, with: { (snapshot) in
        guard let dict = snapshot.value as? [String : Any] else {return}
        let user = User(uid: snapshot.key, dictionary: dict)
        CURRENT_USER = user
    }) { (error) in
        print("failed to fetch current user:", error.localizedDescription)
    }
}





//MARK: - Colors
public let snapchatBlueColor = UIColor.rgb(red: 14, green: 173, blue: 255)
public let tikTokRed = UIColor.rgb(red: 254, green: 44, blue: 85)
//public let baseWhiteColor = UIColor.rgb(red: 234, green: 236, blue: 238)

///mirrors images
public func didTakePicture(_ picture: UIImage, to orientation: UIImage.Orientation) -> UIImage {
    let flippedImage = UIImage(cgImage: picture.cgImage!, scale: picture.scale, orientation: orientation)
    // Here you have got flipped image you can pass it wherever you are using image
    return flippedImage
    
    //.upMirrored for front cam video
    //.leftMirrored for front cam photos
}


public func getAssetThumbnail(asset: PHAsset, size: CGSize) -> UIImage? {
     let thumbnailImage = PHLibraryAPI.shared.getAssetThumbnail(asset: asset, size: size)
    return thumbnailImage
}



let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
/// Triggered an haptic feedback
 public func triggerHapticFeedback() {
     selectionFeedbackGenerator.selectionChanged()
 }



let notificationFeedbackGenerator = UINotificationFeedbackGenerator()

public func triggerHapticSuccessFeedback() {
    notificationFeedbackGenerator.notificationOccurred(.success)
}
