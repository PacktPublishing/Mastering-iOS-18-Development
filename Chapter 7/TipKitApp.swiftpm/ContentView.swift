import SwiftUI
import TipKit

struct ContentView: View {
    var body: some View {
        
        NavigationStack(root: {
            
            VStack {
                List {
                    NavigationLink("Inline Tip") {
                        InlineTipView()
                    }
                    NavigationLink("Popover Tip") {
                        PopoverTipView()
                    }
                    NavigationLink("Tip View Properties") {
                        CustomizeTipViewProperties()
                    }
                    NavigationLink("Tip View Style example") {
                        TipViewStyleView()
                    }
                    NavigationLink("Tip Actions Example") {
                        ActionableTips()
                    }
                    NavigationLink("Rule based tip example") {
                        RuleBasedTipView()
                    }
                    NavigationLink("Event rule based tip example") {
                        EventRuleTipExample()
                    }
                    NavigationLink("Tip Group example") {
                        TipGroupView()
                    }
                    
                }

            }
            
        })
        

    }
}
