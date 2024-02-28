//
//  ModalView.swift
//
//
//  Created by Jevon Mao on 1/30/21.
//

import SwiftUI
import SwiftUIIntrospect

@available(iOS 13.0, macOS 12.0, tvOS 13.0, *)
struct ModalView: View {
    @EnvironmentObject var store: PermissionStore
    @EnvironmentObject var schemaStore: PermissionSchemaStore

    @Binding var showModal: Bool
    var mainText: MainTexts{store.mainTexts.contentChanged ? store.mainTexts : store.configStore.mainTexts}

    var body: some View {
        ScrollView {
            VStack { 
                HeaderView(exitButtonAction: {showModal = schemaStore.shouldStayInPresentation}, mainText: mainText)
                    
                PermissionSection(showing: $showModal)
                    .background(Color(.systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding()
                    .frame(maxWidth:screenSize.width-30)

                Text(.init(mainText.bottomDescription))
                    .font(.system(.callout, design: .rounded))
                    .foregroundColor(Color(.systemGray))
                    .padding(.horizontal)
                    .textHorizontalAlign(.leading)

                Spacer()
            }
            .padding(.bottom,30)

        }
        .background(Color(.secondarySystemBackground))
        .edgesIgnoringSafeArea(.all)
        #if canImport(UIKit)
        .introspect(.viewController, on: .iOS(.v13, .v14, .v15, .v16, .v17), customize: { viewController in
            if store.configStore.restrictDismissal ||
                store.restrictAlertDismissal ||
                store.restrictModalDismissal {
                viewController.isModalInPresentation = true
            }
        })
//        #elseif canImport(AppKit)
//        .introspect(.view, on: .macOS(.v12, .v13, .v14), customize: { view in
//            if store.configStore.restrictDismissal ||
//                store.restrictAlertDismissal ||
//                store.restrictModalDismissal {
//                NOTHING TO DO?
//            }
//        })
        #endif
        
//        .introspectViewController{
//            if store.configStore.restrictDismissal ||
//                store.restrictAlertDismissal ||
//                store.restrictModalDismissal {
//                $0.isModalInPresentation = true
//            }
//        }
    }
}
