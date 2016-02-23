import Quick
import Nimble
import Warg

class WargSpec: QuickSpec {
    override func spec() {
        describe("the ColorMatchingStrategy") {
            context("given a Linear strategy") {
                it("should have the correct name output") {
                    let strategy = Warg.ColorMatchingStrategy.ColorMatchingStrategyLinear
                    expect(strategy.name).to(equal("Linear Strategy"))
                }
            }
        }
    }
}