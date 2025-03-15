//
//  ImageGradient.swift
//  swiftui fase1
//
//  Created by Pinto, Santiago (Apprentice Developer) on 14/03/2025.
//

import SwiftUI
import UIKit

enum Side {
    case bottom
    
    func frame(from size: CGSize) -> CGRect {
        return CGRect(x: 0,
                      y: size.height * 0.75,
                      width: size.width,
                      height: size.height * 0.25)
    }
}

struct AverageColorUtility {
    static func getAverageColor(for image: UIImage, side: Side) -> UIColor? {
        guard let cgImage = crop(image: image, side: side) else { return nil }

        let size = CGSize(width: 40, height: 40)
        let width = Int(size.width)
        let height = Int(size.height)
        let totalPixels = width * height

        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo: UInt32 = CGBitmapInfo.byteOrder32Little.rawValue | CGImageAlphaInfo.premultipliedFirst.rawValue
        
        guard let context = CGContext(data: nil,
                                      width: width,
                                      height: height,
                                      bitsPerComponent: 8,
                                      bytesPerRow: width * 4,
                                      space: colorSpace,
                                      bitmapInfo: bitmapInfo) else { return nil }

        context.draw(cgImage, in: CGRect(origin: .zero, size: size))
        guard let pixelBuffer = context.data else { return nil }

        let pointer = pixelBuffer.bindMemory(to: UInt32.self, capacity: width * height)

        var totalRed = 0
        var totalBlue = 0
        var totalGreen = 0

        for x in 0 ..< width {
            for y in 0 ..< height {
                let pixel = pointer[(y * width) + x]
                totalRed += Int((pixel >> 16) & 255)
                totalGreen += Int((pixel >> 8) & 255)
                totalBlue += Int(pixel & 255)
            }
        }

        let averageRed = CGFloat(totalRed) / CGFloat(totalPixels)
        let averageGreen = CGFloat(totalGreen) / CGFloat(totalPixels)
        let averageBlue = CGFloat(totalBlue) / CGFloat(totalPixels)

        return UIColor(red: averageRed / 255.0, green: averageGreen / 255.0, blue: averageBlue / 255.0, alpha: 1.0)
    }
    
    private static func crop(image: UIImage, side: Side) -> CGImage? {
        let croppedFrame = side.frame(from: image.size)
        return image.cgImage?.cropping(to: croppedFrame)
    }
}

extension UIColor {
    func darker(by percentage: CGFloat = 40) -> UIColor {
        var hue: CGFloat = 0, saturation: CGFloat = 0, brightness: CGFloat = 0, alpha: CGFloat = 0
        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            brightness = max(brightness - (brightness * percentage / 100), 0)
            return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
        }
        return self
    }
}

struct GradientModifier: ViewModifier {
    let color: Color
    let height: CGFloat
    let alignment: Alignment = .bottom

    func body(content: Content) -> some View {
        content
            .overlay(alignment: alignment) {
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: color.opacity(0), location: 0),
                        Gradient.Stop(color: color.opacity(0.2), location: 0.1),
                        Gradient.Stop(color: color.opacity(0.3), location: 0.15),
                        Gradient.Stop(color: color.opacity(0.7), location: 0.3),
                        Gradient.Stop(color: color.opacity(0.8), location: 0.35),
                        Gradient.Stop(color: color.opacity(1), location: 0.5),
                        Gradient.Stop(color: color.opacity(1.3), location: 0.75),
                        Gradient.Stop(color: color.opacity(2), location: 1)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: height)
            }
    }
}


extension View {
    func gradientOverlay(color: Color, height: CGFloat) -> some View {
        self.modifier(GradientModifier(color: color, height: height))
    }
}

extension Image {
    @MainActor
    func asUIImage() -> UIImage? {
        let renderer = ImageRenderer(content: self)
        renderer.scale = UIScreen.main.scale
        return renderer.uiImage
    }
}
