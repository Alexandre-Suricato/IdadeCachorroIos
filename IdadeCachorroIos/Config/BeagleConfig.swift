//
//  BeagleConfig.swift
//  IdadeCachorroIos
//
//  Created by Alexandre Lima on 14/08/20.
//  Copyright © 2020 Alexandre Lima. All rights reserved.
//

import Beagle
import BeagleSchema
import Foundation

class BeagleConfig {
    static func config() {
        
        let dependencies = BeagleDependencies()
        dependencies.urlBuilder = UrlBuilder(
            baseUrl: URL(string: "http://localhost")
        )
        dependencies.decoder.register(component: ageComponent.self)
        Beagle.dependencies = dependencies
    }
}

class ageComponent : ServerDrivenComponent {
    var dogAge : Expression<Int>
    var shouldPresentAge : Expression<Bool>
    
    func toView(renderer: BeagleRenderer) -> UIView {
        let view : AgeUIComponent = AgeUIComponent()
        renderer.observe(shouldPresentAge, andUpdate: \.shouldShowAge, in: view)
        //renderer.observe(dogAge, andUpdate: \.dogAge, in: view)
        renderer.observe(dogAge, andUpdateManyIn: view) { value in
            
        }
        return view
    }
}

class AgeUIComponent: UIView {
    
    private lazy var ageLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    
    var shouldShowAge: Bool? = false {
        didSet {
            if shouldShowAge ?? false {
                let humanAge = (dogAge ?? 0) * 7
                ageLabel.text = "A idade do cachorro é: \(humanAge)"
            }
        }
    }
    
    var dogAge: Int? = 0
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return .init(width: size.width, height: 80)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(ageLabel)
        
        ageLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        ageLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        ageLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        ageLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
