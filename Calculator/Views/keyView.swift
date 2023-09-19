//
//  keyView.swift
//  Calculator
//
//  Created by sudhanshu jha on 19/09/23.
//

import SwiftUI

struct keyView: View {
    @State var value = "0";
    @State var runningNumber = 0;
    @State var currentOperation:Operations = .none;
    @State var changeColor = false;
    
    let buttons : [[Keys]] = [
        [.clear,.negative,.percent,.divide],
        [.seven,.eight,.nine,.multiply],
        [.four,.five,.six,.subtract],
        [.one,.two,.three,.add],
        [.zero,.decimal,.equal],
    ]
    
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(changeColor ? Color("num").opacity(0.9) :  Color.pink.opacity(0.9))
                    .scaleEffect(changeColor ? 1.5 : 1.0)
                    .frame(width: 350, height: 280)
                    .animation(Animation.easeInOut
                        .speed(0.17).repeatForever(), value: changeColor)
                    .onAppear(perform: {
                        self.changeColor.toggle()
                    })
                    .overlay(Text(value)
                        .fontWeight(.bold)
                        .font(.system(size: 100))
                        .foregroundColor(.black)
                )
            };
            ForEach(buttons,id: \.self){row in
                HStack(spacing: 10){
                    ForEach(row,id: \.self){ column in
                        Button {
                            self.didTap(button: column)
                        } label: {
                            Text(column.rawValue)
                                .font(.system(size: 30))
                                .frame(width: getWidth(column: column), height: getHeight(column: column))
                                .background(column.buttonColor)
                                .foregroundColor(Color.black)
                                .cornerRadius(getWidth(column: column)/2)
                                .shadow(radius: 15)
                        }

                    }
                }.padding(.bottom,4)
                
                
            }
           
            Text("Developed by Sudhanshu Jha")
                .foregroundColor(Color.black)
        }
    }
    func didTap(button:Keys){
        switch (button){
        case .add,.subtract,.multiply,.divide,.equal :
            if(button == .add){
                self.currentOperation = .add;
                self.runningNumber = Int(self.value) ?? 0;
            }
            else if(button == .subtract){
                self.currentOperation = .subtract;
                self.runningNumber = Int(self.value) ?? 0;
            }
            else if(button == .multiply){
                self.currentOperation = .multiply;
                self.runningNumber = Int(self.value) ?? 0;
            }
            else if(button == .divide){
                self.currentOperation = .divide;
                self.runningNumber = Int(self.value) ?? 0;
            }
            else if(button == .equal){
                let runningValue = self.runningNumber;
                let currentValue = Int(self.value) ?? 0;
                
                switch (self.currentOperation){
                case .add: self.value = "\(runningValue + currentValue)"
                case .subtract: self.value = "\(runningValue - currentValue)"
                case .divide: self.value = "\(runningValue / currentValue)"
                case .multiply: self.value = "\(runningValue * currentValue)"
                case .none: break;
                }
          
            }
            if(button != .equal){
                self.value = "0";
            }
        case .clear: self.value = "0"
        case .negative,.decimal,.percent : break;
        default :
            let number = button.rawValue;
            if(self.value == "0"){
                value = number;
            }
            else{
                self.value = "\(self.value)\(number)"
            }
        }
    }
    func getWidth(column: Keys) -> CGFloat {
        if(column == .zero){
            return (UIScreen.main.bounds.width - (5*10))/2;
        }
        return (UIScreen.main.bounds.width - (5*10))/4;
    }
    
    func getHeight(column: Keys) -> CGFloat {
       return (UIScreen.main.bounds.width - (6*10))/5;
    }
}


struct keyView_Previews: PreviewProvider {
    static var previews: some View {
        keyView()
    }
}
