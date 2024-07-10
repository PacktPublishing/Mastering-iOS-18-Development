import SwiftUI

struct WithAnimationCompletionBlock: View {
    
    @State var yPos: CGFloat = 300
    @State var isReset: Bool = false
    
    var body: some View {
        VStack {
            Circle()
                .foregroundColor(.blue)
                .frame(width: 50, height:50)
                .position(x: 200, y:yPos)
            Button(isReset ? "Reset" : "Start") {
                withAnimation(.snappy) {
                    if isReset {
                        yPos = 300
                    } else {
                        yPos = 500
                    }
                } completion: {
                    isReset.toggle()
                }
            }
        }
    }
}

#Preview {
    WithAnimationCompletionBlock()
}
