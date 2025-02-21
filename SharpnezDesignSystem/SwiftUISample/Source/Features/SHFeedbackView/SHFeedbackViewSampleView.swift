//
//  SHFeedbackViewSampleView.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 21/11/24.
//

import SharpnezDesignSystem
import SwiftUI

struct SHFeedbackViewSampleView: View {
    var body: some View {
        List {
            NavigationLink {
                SHFeedbackView(
                    type: .success,
                    title: "Success",
                    description: "Congratulations!",
                    primaryButtonTitle: "Finish"
                ) {
                    print("success")
                }
            } label: {
                Text("Success")
            }
            NavigationLink {
                SHFeedbackView(
                    type: .warning,
                    title: "Atention",
                    description: "Something can go wrong",
                    primaryButtonTitle: "Dismiss"
                ) {
                    print("warning")
                }
            } label: {
                Text("Warning")
            }
            NavigationLink {
                SHFeedbackView(
                    type: .error,
                    title: "Error",
                    description: "Something went wrong",
                    primaryButtonTitle: "Try again",
                    secondaryButtonTitle: "Dismiss"
                ) {
                    print("error")
                } secondaryAction: {
                    print("dismiss")
                }

            } label: {
                Text("Error")
            }
            NavigationLink {
                SHFeedbackView(
                    type: .info,
                    title: "Info",
                    description: "Something",
                    primaryButtonTitle: "Dismiss"
                ) {
                    print("info")
                }
            } label: {
                Text("Info")
            }
            NavigationLink {
                SHFeedbackView(
                    type: .custom(
                        icon: .card,
                        iconColor: .primarySH
                    ),
                    title: "Custom",
                    description: "Custom description",
                    primaryButtonTitle: "Dismiss"
                ) {
                    print("Custom")
                }
            } label: {
                Text("Custom")
            }
            .navigationTitle("Select color scheme")
        }
    }
}
