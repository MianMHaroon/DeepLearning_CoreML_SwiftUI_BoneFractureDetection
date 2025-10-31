//
//  ImageHelpers.swift
//  DeepLearning_Demo_BoneFractureDetection
//
//  Created by Muhammad Haroon on 31/10/2025.
//

import AppKit
import CoreVideo
import CoreGraphics


extension CGImage {
    func toCVPixelBuffer(size: CGSize) -> CVPixelBuffer? {
        var pxbuffer: CVPixelBuffer?
        let attrs = [
            kCVPixelBufferCGImageCompatibilityKey: true,
            kCVPixelBufferCGBitmapContextCompatibilityKey: true
        ] as CFDictionary

        guard CVPixelBufferCreate(kCFAllocatorDefault,
                                  Int(size.width),
                                  Int(size.height),
                                  kCVPixelFormatType_32BGRA,
                                  attrs,
                                  &pxbuffer) == kCVReturnSuccess,
              let pixelBuffer = pxbuffer else { return nil }

        CVPixelBufferLockBaseAddress(pixelBuffer, [])
        guard let context = CGContext(data: CVPixelBufferGetBaseAddress(pixelBuffer),
                                      width: Int(size.width),
                                      height: Int(size.height),
                                      bitsPerComponent: 8,
                                      bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer),
                                      space: CGColorSpaceCreateDeviceRGB(),
                                      bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue | CGBitmapInfo.byteOrder32Little.rawValue)
        else { return nil }

        context.draw(self, in: CGRect(origin: .zero, size: size))
        CVPixelBufferUnlockBaseAddress(pixelBuffer, [])
        return pixelBuffer
    }
}

