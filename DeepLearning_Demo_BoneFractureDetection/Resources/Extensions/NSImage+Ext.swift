//
//  NSImage+Ext.swift
//  DeepLearning_Demo_BoneFractureDetection
//
//  Created by Muhammad Haroon on 31/10/2025.
//

import AppKit

extension NSImage {
    func toCGImage() -> CGImage? {
        var rect = CGRect(origin: .zero, size: self.size)
        return self.cgImage(forProposedRect: &rect, context: nil, hints: nil)
    }
}
