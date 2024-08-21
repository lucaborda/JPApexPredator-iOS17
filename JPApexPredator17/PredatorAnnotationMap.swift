//
//  PredatorAnnotationMap.swift
//  JPApexPredator17
//
//  Created by Luca Borda on 30/07/2024.
//

import SwiftUI

struct PredatorAnnotationMap: View {
    @State var showInfo = false
    var predator: ApexPredator
    
    var body: some View {
        Button {
            showInfo.toggle()
        } label: {
            VStack {
                Image(predator.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .shadow(color: .white, radius: 3)
                    .scaleEffect(x: -1)
                    .overlay(alignment: .bottom) {
                        if showInfo {
                            VStack (alignment: .leading) {
                                Text(predator.type.rawValue.capitalized)
                                    .padding(.horizontal, 13)
                                    .padding(.vertical, 5)
                                    .background(predator.type.background)
                                    .clipShape(.capsule)
                                Text("Movies:")
                                    .font(.title3)
                                    .padding(.top, 15)
                                
                                ForEach(predator.movies, id: \.self) { movie in
                                    Text("•" + movie)
                                        .font(.subheadline)
                                }
                            }
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding()
                            .background(.black.opacity(0.6))
                            .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
                            .frame(width: 400)
                            .overlay(alignment: .bottom) {
                                Image(systemName: "arrowtriangle.down.fill")
                                    .font(.title2)
                                    .offset(y: 19)
                                    .foregroundColor(.black.opacity(0.6))
                            }
                            .offset(y: -140)
                        }
                    }

            }
        }

    }
}

#Preview {
    PredatorAnnotationMap(predator: Predators().apexPredators[10])
}
