//
//  FocusAndSubmit.swift
//  SignUp
//
//  Created by Jungjin Park on 2024-04-26.
//

import SwiftUI

struct FocusAndSubmit: View {
    enum AddressField {
        case street
        case city
        case state
        case zipCode
    }
    
    @State private var street = ""
    @State private var city = ""
    @State private var state = ""
    @State private var zipCode = ""
    
    @FocusState private var currentFocus: AddressField?
    
    var body: some View {
        VStack {
            TextField("Address", text: $street)
                .focused($currentFocus, equals: . street)
                .submitLabel(.next)
            TextField("City", text: $city)
                .focused($currentFocus, equals: .city)
                .submitLabel(.next)
            TextField("State", text: $state)
                .focused($currentFocus, equals: .state)
                .submitLabel(.next)
            TextField("Zip Code", text: $zipCode)
                .focused($currentFocus, equals: .zipCode)
                .submitLabel(.done)
        }
        .padding()
        .onSubmit {
            switch currentFocus {
            case .street:
                currentFocus = .city
            case .city:
                currentFocus = .state
            case .state:
                currentFocus = .zipCode
            default:
                print("Done!")
            }
        }
        .onAppear {
            currentFocus = .street
        }
    }
}

#Preview {
    FocusAndSubmit()
}
