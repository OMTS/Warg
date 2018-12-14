## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Warg is a UIView extension. So all you have to do is to call the one and only method in Warg to get a visible color.
```swift
do
    let madeColor = try self.backgroundIV.firstReadableColorInRect(self.refreshButton.frame, preferredColor: UIColor.red, strategy: .colorMatchingStrategyLinear, isVerbose: true)

    self.refreshButton.tintColor = madeColor
}
catch Warg.WargError.invalidBackgroundContent {
    self.refreshButton.tintColor = UIColor.red
}
catch {
    print("generic error")
}
```

## Parameters
```
- Parameter rect:  The rect (in the receiver coordinates) in which the forground content will be displayed.
- Parameter preferredColor: The color that you would preferaly like to use (this is usually the color given by a designer). This param is optional and the default value will be the color of the receiver in the rect provided.
- Parameter strategy: The startegy that will be applied when modifying the prefered color to find the first visible one. This param is optional and the default value is ColorMatchingStrategy.ColorMatchingStrategyLinear.
- Parameter isVerbose: A boolean indicating if the alogithm should print all the steps during computation. This param is optional and the default value is false.


- Throws: `WargError.InvalidBackgroundContent` if the rect parameter does not permit colors computations (for exemple a CGRectZero value).

- Returns: The first visible color found.
```
## Requirements

## Installation

Warg is NOT YET available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Warg"
```

## Author

Iman Zarrabian, iman@omts.fr

## License

Warg is available under the MIT license. See the LICENSE file for more info.
