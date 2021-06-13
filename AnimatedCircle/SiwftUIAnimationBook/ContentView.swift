//
//  ContentView.swift
//  SiwftUIAnimationBook
//
//  Created by Ankit Jaiswal on 13/06/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var isChange = false
    @State var circleProgress: CGFloat = 0.3
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    Circle()
                        .stroke(Color.red.opacity(0.3), style: StrokeStyle(lineWidth: 20.0, lineCap: CGLineCap.round))
                        .frame(height: 200)
                        .padding(40)
                    Text(String(format: "%.0f %%", min(self.circleProgress, 1.0)*100.0))
                        .font(.largeTitle)
                        .bold()
                    
                    Circle()
                        .trim(from: 0, to: circleProgress)
                        .stroke(Color.red, style: StrokeStyle.init(lineWidth: 20.0, lineCap: CGLineCap.round))
                        .frame(height: 200)
                        .rotationEffect(.degrees(-90))
                        .padding(40)
                        .animation(.linear)
                }
                
                Spacer(minLength: 10)
                
                Button("Change") {
                    isChange.toggle()
                    circleProgress = isChange ? 0.3 : 0.90
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
