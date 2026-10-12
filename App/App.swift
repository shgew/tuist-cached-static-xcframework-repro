import Feature
import SwiftUI

@main
struct ReproApp: App {
    var body: some Scene {
        WindowGroup { Text("\(Feature.answer())") }
    }
}
