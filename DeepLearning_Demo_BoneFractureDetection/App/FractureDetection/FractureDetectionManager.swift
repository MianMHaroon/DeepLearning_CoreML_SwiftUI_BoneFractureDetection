//
//  FractureDetectionManager.swift
//  DeepLearning_Demo_BoneFractureDetection
//
//  Created by Muhammad Haroon on 31/10/2025.
//

import Foundation
import CoreML
import AppKit

actor FractureDetectionManager {
    static let shared = FractureDetectionManager()
    private init() { }

    func detectFracture(from nsImage: NSImage) async throws -> String {
        guard let cgImage = nsImage.toCGImage(),
              let pixelBuffer = cgImage.toCVPixelBuffer(size: CGSize(width: cgImage.width,
                                                                     height: cgImage.height))
        else {
            throw DetectionError.invalidImage
        }

        let model = try BoneFractureDetection(configuration: MLModelConfiguration())
        let output = try await model.prediction(input: BoneFractureDetectionInput(image: pixelBuffer))

        if let (label, confidence) = output.targetProbability.max(by: { $0.value < $1.value }) {
            return "\(label) (\(Int(confidence * 100))%)"
        } else {
            return "No fracture detected"
        }
    }

    enum DetectionError: Error {
        case invalidImage
    }
}

