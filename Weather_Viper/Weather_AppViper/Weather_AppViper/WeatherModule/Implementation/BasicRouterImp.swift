//
//  BasicRouterImp.swift
//  Weather_AppViper
//
//  Created by Dima on 26.01.22.
//

import UIKit
import Jelly

final class BasicRouterImp: BasicRouterInput {
    var animator: Jelly.Animator?
    weak var view: UIViewController?
    
    func showSearchScreen(ouput: ModuleOuput?) {
        let uiConfiguration = PresentationUIConfiguration(cornerRadius: 35,
                                                          backgroundStyle: .blurred(effectStyle: .dark), isTapBackgroundToDismissEnabled: true)
        
        let size = PresentationSize(width: .fullscreen, height: .fullscreen)
        let alignment = PresentationAlignment(vertical: .center, horizontal: .center)
        let marginGuards = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        let timing = PresentationTiming(duration: .slow, presentationCurve: .linear, dismissCurve: .linear)
        let presentation = CoverPresentation(directionShow: .top,
                                             directionDismiss: .top,
                                             
                                             uiConfiguration: uiConfiguration, size: size,
                                             alignment: alignment,
                                             marginGuards: marginGuards,
                                             timing: timing,
                                             spring: .tight )
        animator = Animator(presentation:presentation)
        guard let view = view, let controller = SearchAssembly.configSearchModule(output: ouput) else { return }
        animator?.prepare(presentedViewController: controller)
        
        view.present(controller, animated: true, completion: nil)
    }
}

final class SearchRouterImp: SearchRouterInput {
    weak var view: UIViewController?
    
    func dismissSearch(output: ModuleOuput?) {
        guard let view = view else { return }
        view.dismiss(animated: true)
    }
}


