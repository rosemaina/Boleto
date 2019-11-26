//
//  FCollectionReference.swift
//  Tikiti
//
//  Created by Rose Maina on 29/10/2019.
//  Copyright © 2019 rose maina. All rights reserved.
//

import FirebaseFirestore
import Foundation

enum FCollectionReference: String {
    case User
    case Typing
    case Recent
    case Message
    case Group
    case Call
}

func reference(_ collectionReference: FCollectionReference) -> CollectionReference{
    return Firestore.firestore().collection(collectionReference.rawValue)
}
