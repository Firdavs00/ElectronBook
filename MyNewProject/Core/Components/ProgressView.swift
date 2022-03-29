//
//  ProgressView.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 14/03/22.
//

import SwiftUI

struct ProgresView: View {
    var body: some View {
        VStack {
            ProgressView()
        }
        .frame(width: 200, height: 200)
        .padding(.horizontal,25)
        .background(
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.ultraThinMaterial)
        )
    }
}

struct ProgresView_Previews: PreviewProvider {
    static var previews: some View {
        ProgresView()    
    }
}
