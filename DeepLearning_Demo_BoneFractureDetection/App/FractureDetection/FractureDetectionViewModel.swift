//
//  FractureDetectionViewModel.swift
//  DeepLearning_Demo_BoneFractureDetection
//
//  Created by Muhammad Haroon on 31/10/2025.
//

import SwiftUI

@MainActor
final class FractureDetectionViewModel: ObservableObject {
    @Published var nsImage: NSImage?
    @Published var detections: [String] = []
    @Published var isLoading = false

    func pickImageFromMac() {
        let panel = NSOpenPanel()
        panel.allowedContentTypes = [.image]
        panel.allowsMultipleSelection = false
        panel.canChooseDirectories = false

        if panel.runModal() == .OK, let url = panel.url, let image = NSImage(contentsOf: url) {
            nsImage = image
            Task { await detectFracture() }
        }
    }

    func detectFracture() async {
        guard let image = nsImage else { return }
        isLoading = true
        detections.removeAll()

        do {
            let result = try await FractureDetectionManager.shared.detectFracture(from: image)
            detections = [result]
        } catch {
            detections = ["Prediction failed: \(error.localizedDescription)"]
        }

        isLoading = false
    }
}

