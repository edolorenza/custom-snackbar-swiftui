//
//  ContentView.swift
//  CustomSnackbar
//
//  Created by Edo Lorenza on 25/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showError = false
    @State private var showInfo = false
    @State private var showSuccess = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Show Error Snackbar") {
                showError = true
            }
            
            Button("Show Info Snackbar") {
                showInfo = true
            }
            
            Button("Show Success Snackbar") {
                showSuccess = true
            }
        }
        .snackbar(show: $showError, bgColor: .red, txtColor: .white, icon: "xmark", iconColor: .white, message: "This is an error message")
        .snackbar(show: $showInfo, bgColor: .blue, txtColor: .white, icon: "info.circle", iconColor: .white, message: "This is an info message")
        .snackbar(show: $showSuccess, bgColor: .green, txtColor: .white, icon: "checkmark", iconColor: .white, message: "This is a success message")
    }
}

extension View {
    func snackbar(show: Binding<Bool>, bgColor: Color, txtColor: Color, icon: String?, iconColor: Color, message: String) -> some View {
        self.modifier(SnackbarModifier(show: show, bgColor: bgColor, txtColor: txtColor, icon: icon, iconColor: iconColor, message: message))
    }
}

struct SnackbarModifier: ViewModifier {
    @Binding var show: Bool
    var bgColor: Color
    var txtColor: Color
    var icon: String?
    var iconColor: Color
    var message: String
    
    func body(content: Content) -> some View {
        ZStack {
            content
            SnackbarView(show: $show, bgColor: bgColor, txtColor: txtColor, icon: icon, iconColor: iconColor, message: message)
        }
    }
}
