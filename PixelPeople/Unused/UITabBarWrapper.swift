//
//  UITabBarWrapper.swift
//  PixelPeople
//
//  Created by Eric Carroll on 1/25/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

fileprivate struct UITabBarControllerWrapper: UIViewControllerRepresentable {
    var viewControllers: [UIViewController]
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<UITabBarControllerWrapper>) -> UITabBarController {
        let tabBar = UITabBarController()
        
        // Configure Tab Bar here, if needed
        
        return tabBar
    }
    
    func updateUIViewController(_ uiViewController: UITabBarController, context: UIViewControllerRepresentableContext<UITabBarControllerWrapper>) {
        uiViewController.setViewControllers(self.viewControllers, animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var parent: UITabBarControllerWrapper
        
        init(_ controller: UITabBarControllerWrapper) {
            self.parent = controller
        }
    }
}

struct UITabBarWrapper: View {
    var controllers: [UIHostingController<TabBarElement>] // 1
    
    init(_ elements: [TabBarElement]) {
        self.controllers = elements.enumerated().map { // 2
            let hostingController = UIHostingController(rootView: $1)
            
            hostingController.tabBarItem = UITabBarItem( // 3
                title: $1.tabBarElementItem.title,
                image: UIImage.init(systemName: $1.tabBarElementItem.systemImageName),
                tag: $0 // 4
            )
            
            return hostingController
        }
    }
    
    var body: some View {
        UITabBarControllerWrapper(viewControllers: self.controllers) // 5
    }
}

struct UITabBarWrapper_Previews: PreviewProvider {
    static var previews: some View {
        UITabBarWrapper([
            TabBarElement(tabBarElementItem:
                TabBarElementItem(title: "Test 1", systemImageName: "house.fill")) {
                    Text("Test 1 Text")
            }
        ])
    }
}

/*
           UITabBarWrapper([
                   TabBarElement(tabBarElementItem: .init(title: "Administration", systemImageName: "person.3")) {
                       CategoryView(category: .administration)
                   },
                   TabBarElement(tabBarElementItem: .init(title: "Business", systemImageName: "checkmark.circle")) {
                       CategoryView(category: .business)
                   },
                   TabBarElement(tabBarElementItem: .init(title: "Creative", systemImageName: "questionmark.diamond")) {
                       CategoryView(category: .creative)
                   },
                   TabBarElement(tabBarElementItem: .init(title: "Entertainment", systemImageName: "house.fill")) {
                       CategoryView(category: .entertainment)
                   },
                   TabBarElement(tabBarElementItem: .init(title: "F&B", systemImageName: "person.2")) {
                       CategoryView(category: .fb)
                   },
                   TabBarElement(tabBarElementItem: .init(title: "Science", systemImageName: "globe")) {
                       CategoryView(category: .science)
                   },
                   TabBarElement(tabBarElementItem: .init(title: "Services", systemImageName: "person")) {
                       CategoryView(category: .services)
                   },
                   TabBarElement(tabBarElementItem: .init(title: "None", systemImageName: "link.circle.fill")) {
                       CategoryView(category: .none)
                   }
               ]
           )
           .environmentObject(buildings)
           .navigationBarItems(leading: Button("Save") {
 //              self.buildings.save()
           })
 
 */
