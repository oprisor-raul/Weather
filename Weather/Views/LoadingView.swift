//
//  LoadingView.swift
//  Weather
//
//  Created by Oprișor Raul-Alexandru on 18.07.2022.
//

import SwiftUI

struct LoadingView: View {
    //    Simple Progress Bar waiting for the data to load
    var body: some View {
        ProgressView("Loading…")
            .progressViewStyle(CircularProgressViewStyle())
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
