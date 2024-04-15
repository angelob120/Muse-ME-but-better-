//
//  Profile View.swift
//  Muse ME (but better)
//
//  Created by Angelo Brown on 4/15/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var profile: Profile = Profile(name: "", email: "", profileImage: nil)
    @State private var isLoading = false
    
    var body: some View {
        VStack {
            if let image = profile.profileImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            } else {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
            TextField("Name", text: $profile.name)
            TextField("Email", text: $profile.email)
            if isLoading {
                ProgressView()
            } else {
                Button("Save") {
                    isLoading = true
                    CloudKitHelper.saveProfile(profile: profile) { result in
                        isLoading = false
                        switch result {
                        case .success(let updatedProfile):
                            self.profile = updatedProfile
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                }
            }
        }
        .padding()
        .onAppear {
            CloudKitHelper.fetchProfile { result in
                switch result {
                case .success(let fetchedProfile):
                    self.profile = fetchedProfile
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
