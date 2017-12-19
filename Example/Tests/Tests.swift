//import Quick
//import Nimble
//import Warg
//
//class WargSpec: QuickSpec {
//    
//    //Helper method based on https://gist.github.com/yannickl/16f0ed38f0698d9a8ae7
//    private func colorWithHexString(string: String) -> UIColor {
//        let hexString: NSString = string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
//        let scanner            = NSScanner(string: hexString as String)
//        
//        if (hexString.hasPrefix("#")) {
//            scanner.scanLocation = 1
//        }
//        
//        var color:UInt32 = 0
//        scanner.scanHexInt(&color)
//        
//        let mask = 0x000000FF
//        let r = Int(color >> 16) & mask
//        let g = Int(color >> 8) & mask
//        let b = Int(color) & mask
//        
//        let red   = CGFloat(r) / 255.0
//        let green = CGFloat(g) / 255.0
//        let blue  = CGFloat(b) / 255.0
//        
//        return UIColor(red:red, green:green, blue:blue, alpha:1)
//    }
//    
//    override func spec() {
//        describe("the ColorMatchingStrategy") {
//            context("given a linear strategy") {
//                it("has the correct name output") {
//                    let strategy = Warg.ColorMatchingStrategy.ColorMatchingStrategyLinear
//                    expect(strategy.name).to(equal("Linear Strategy"))
//                }
//            }
//        }
//        
//        describe("the firstReadableColorInRect method of an UIView") {
//            
//            var backgroundView: UIView!
//            var rect = CGRectZero
//            var prefColor = UIColor.blackColor()
//            var strategy = ColorMatchingStrategy.ColorMatchingStrategyLinear
//            var expectedColor: UIColor!
//            
//            beforeEach {
//                backgroundView = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 100, height: 100)))
//                rect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 10, height: 10))
//                strategy = ColorMatchingStrategy.ColorMatchingStrategyLinear
//            }
//
//            context("given a zero rect zone, a prefered color to back, and a linear strategy") {
//                
//                beforeEach {
//                    rect = CGRectZero
//                    prefColor = UIColor.blackColor()
//                }
//                
//                it("throws with an InvalidBackgroundContent error code ") {
//                    expect{
//                        try backgroundView.firstReadableColorInRect(rect, preferredColor:prefColor, strategy:strategy)
//                        }.to(throwError(Warg.WargError.InvalidBackgroundContent))
//                }
//            }
//            
//            context("given a black background, a 10X10 pts rect zone, a prefered color to back, and a linear strategy") {
//                
//                beforeEach {
//                    backgroundView.backgroundColor = UIColor.blackColor()
//                    prefColor = UIColor.blackColor()
//                }
//                
//                it("returns #979797 color as the first readable color ") {
//                    expectedColor = self.colorWithHexString("#979797")
//                    
//                    do {
//                        let readableColor = try backgroundView.firstReadableColorInRect(rect, preferredColor:prefColor, strategy:strategy)
//                        expect(readableColor).to(equal(expectedColor))
//                    }
//                    catch {
//                        fail("should not throw an error")
//                    }
//                }
//            }
//            
//            context("given a white background, a 10X10 pts rect zone, a prefered color to white, and a linear strategy") {
//                
//                beforeEach {
//                    backgroundView.backgroundColor = UIColor.whiteColor()
//                    prefColor = UIColor.whiteColor()
//                }
//                
//                it("returns #7d7d7d color as the first readable color ") {
//                    expectedColor = self.colorWithHexString("#7d7d7d")
//
//                    do {
//                        let readableColor = try backgroundView.firstReadableColorInRect(rect, preferredColor:prefColor, strategy:strategy)
//                        expect(readableColor).to(equal(expectedColor))
//                    }
//                    catch {
//                        fail("should not throw an error")
//                    }
//                }
//            }
//            
//            context("given a medium grey background (127,127,127), a 10X10 pts rect zone, a prefered color to black, and a linear strategy") {
//                
//                beforeEach {
//                    backgroundView.backgroundColor = UIColor(red: 127.0/255.0, green: 127.0/255.0, blue: 127.0/255.0, alpha: 1.0)
//                    prefColor = UIColor.blackColor()
//                }
//
//                it("returns #000000 (black) color as the first readable color ") {
//                    expectedColor = self.colorWithHexString("#000000")
//
//                    do {
//                        let readableColor = try backgroundView.firstReadableColorInRect(rect, preferredColor:prefColor, strategy:strategy)
//                        expect(readableColor).to(equal(expectedColor))
//                    }
//                    catch {
//                        fail("should not throw an error")
//                    }
//                }
//            }
//       
//            context("given a medium grey background (127,127,127), a 10X10 pts rect zone, a prefered color to white, and a linear strategy") {
//                
//                beforeEach {
//                    backgroundView.backgroundColor = UIColor(red: 127.0/255.0, green: 127.0/255.0, blue: 127.0/255.0, alpha: 1.0)
//                    prefColor = UIColor.whiteColor()
//                }
//                
//                it("returns #ffffff (white) color as the first readable color ") {
//                    let expectedColor = self.colorWithHexString("#ffffff")
//                    
//                    do {
//                        let readableColor = try backgroundView.firstReadableColorInRect(rect, preferredColor:prefColor, strategy:strategy)
//                        expect(readableColor).to(equal(expectedColor))
//                    }
//                    catch {
//                        fail("should not throw an error")
//                    }
//                }
//            }
//        
//            context("given a black background, a 10X10 pts rect zone, no prefered color, and a linear strategy") {
//                
//                beforeEach {
//                    backgroundView.backgroundColor = UIColor.blackColor()
//                }
//                
//                it("returns #ff5454 color as the first readable color ") {
//                    let expectedColor = self.colorWithHexString("#979797")
//                    
//                    do {
//                        let readableColor = try backgroundView.firstReadableColorInRect(rect, strategy:strategy)
//                        expect(readableColor).to(equal(expectedColor))
//                    }
//                    catch {
//                        fail("should not throw an error")
//                    }
//                }
//            }
//        }
//    }
//}
