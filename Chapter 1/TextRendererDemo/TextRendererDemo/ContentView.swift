import SwiftUI
import Foundation

struct CustomTextRenderer: TextRenderer {
    
    let angleFactor: Double
    
    func draw(layout: Text.Layout, in ctx: inout GraphicsContext) {
        for (index, line) in layout.enumerated() {
            ctx.opacity = Double(index + 1) * 0.1
            ctx.rotate(by: Angle(degrees: Double(index) * angleFactor))
            ctx.draw(line)
        }
    }
}

struct ContentView: View {                
    var body: some View {
        VStack {
            Text("Great new features come to texts in SwiftUI")
                .font(.system(size: 60))
                .textRenderer(CustomTextRenderer(angleFactor: 1))
        }

    }
}

#Preview {
    ContentView()
}
