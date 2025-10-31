//
//  FractureDetectionView.swift
//  DeepLearning_Demo_BoneFractureDetection
//
//  Created by Muhammad Haroon on 29/10/2025.


import SwiftUI

struct FractureDetectionView: View {
    @StateObject private var viewModel = FractureDetectionViewModel()
    @State private var animateBackground = false

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.cyan.opacity(0.6), Color.purple.opacity(0.6), Color.blue.opacity(0.6)],
                startPoint: animateBackground ? .topLeading : .bottomTrailing,
                endPoint: animateBackground ? .bottomTrailing : .topLeading
            )
            .ignoresSafeArea()
            .blur(radius: 80)
            .animation(.easeInOut(duration: 10).repeatForever(autoreverses: true), value: animateBackground)
            .onAppear { animateBackground = true }

            VStack(spacing: 20) {
                Text("🦴 Bone Fracture Detection")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                    .shadow(radius: 10)
                    .padding(.top)

                ZStack {
                    RoundedRectangle(cornerRadius: 24)
                        .fill(Color.white.opacity(0.15))
                        .background(.ultraThinMaterial)
                        .overlay(RoundedRectangle(cornerRadius: 24).stroke(Color.white.opacity(0.25), lineWidth: 1))
                        .shadow(color: .black.opacity(0.25), radius: 8, x: 0, y: 4)

                    if let image = viewModel.nsImage {
                        Image(nsImage: image)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(16)
                            .padding()
                    } else {
                        VStack(spacing: 8) {
                            Image(systemName: "xmark.circle")
                                .font(.system(size: 40))
                                .foregroundColor(.white.opacity(0.6))
                            Text("No X-ray selected")
                                .foregroundColor(.white.opacity(0.7))
                        }
                    }
                }
                .frame(height: 320)
                .padding(.horizontal)

                Button {
                    viewModel.pickImageFromMac()
                } label: {
                    Label("Select X-ray", systemImage: "photo.on.rectangle")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: 220)
                        .background(
                            LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing)
                                .opacity(0.9)
                        )
                        .foregroundColor(.white)
                        .cornerRadius(14)
                        .shadow(radius: 6)
                }
                .buttonStyle(.plain)

                if viewModel.isLoading {
                    HStack(spacing: 12) {
                        ProgressView()
                        Text("Analyzing X-ray...")
                            .font(.headline)
                            .foregroundColor(.white.opacity(0.9))
                    }
                    .padding(.top, 10)
                }

                if !viewModel.detections.isEmpty {
                    ZStack {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(Color.white.opacity(0.15))
                            .background(.ultraThinMaterial)
                            .overlay(RoundedRectangle(cornerRadius: 24).stroke(Color.white.opacity(0.25), lineWidth: 1))
                        VStack(alignment: .leading, spacing: 6) {
                            ForEach(viewModel.detections, id: \.self) { detection in
                                Text(detection)
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                            }
                        }
                        .padding()
                    }
                    .frame(height: 120)
                    .padding(.horizontal)
                }

                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    FractureDetectionView()
}
