//
//  WKWebView+XPChain.swift
//  SwiftStudy
//
//  Created by 麻小亮 on 2019/5/21.
//  Copyright © 2019 麻小亮. All rights reserved.
//

import WebKit

extension XPChain where Base : WKWebView {
    
    @discardableResult
    func navigationDelegate(_ navigationDelegate : WKNavigationDelegate?) -> XPChain {
        object.navigationDelegate = navigationDelegate
        return self
    }
    
    @discardableResult
    func uiDelegate(_ uiDelegate : WKUIDelegate?) -> XPChain {
        object.uiDelegate = uiDelegate
        return self
    }
    
    @discardableResult
    func evaluateJavaScript(_ javaScriptString: String, completionHandler: ((Any?, Error?) -> Void)? = nil) -> XPChain {
        object.evaluateJavaScript(javaScriptString, completionHandler: completionHandler)
        return self
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func takeSnapshot(with snapshotConfiguration: WKSnapshotConfiguration?, completionHandler: @escaping (UIImage?, Error?) -> Void) -> XPChain {
        object.takeSnapshot(with: snapshotConfiguration, completionHandler: completionHandler)
        return self
    }
    
    @discardableResult
    func allowsBackForwardNavigationGestures(_ allowsBackForwardNavigationGestures : Bool) -> XPChain {
        object.allowsBackForwardNavigationGestures = allowsBackForwardNavigationGestures
        return self
    }
    
    @discardableResult
    func customUserAgent(_ customUserAgent : String?) -> XPChain {
        object.customUserAgent = customUserAgent
        return self
    }
    
    @discardableResult
    func allowsLinkPreview(_ allowsLinkPreview : Bool) -> XPChain {
        object.allowsLinkPreview = allowsLinkPreview
        return self
    }
    
    
}
