//
//  Storyboard.swift
//  DemoApp
//
//  Created by Ankit Verma on 12/04/23.
//

enum Storyboard: String, CaseIterable {
    case uiLabel = "UILabel"
    case uiButton = "UIButton"
    case uiTextField = "UITextField"
    case uiTextView = "UITextView"
    case uiSwitch = "UISwitch"
    case uiSlider = "UISlider"
    case uiProgressView = "UIProgressView"
    case uiSegmentedControl = "UISegmentedControl"
    case uiPageViewController = "UIPageViewController"
    case uiStepper = "UIStepper"
    case imageView = "ImageView"
    case scrollView = "ScrollView"
    case task1 = "Task1"
    case tableView = "TableView"
    case collectionView = "CollectionView"
    case ottScreen = "OTTScreen"
    case stackView = "StackView"
    case activityIndicator = "ActivityIndicator"
    case searchBar = "SearchBar"
    case uiTabBar = "UITabBar"
    case wkWebView = "WKWebView"
    case uiToolBar = "UIToolBar"
    case uiPickerView = "UIPickerView"
    case uiDatePicker = "UIDatePicker"
    case mkMapView = "MKMapView"
    case uiNavigation = "UINavigation"
    case golfScreens = "GolfScreens"
    case webServices = "WebServices"
    case customControls = "CustomControls"
    
    var storyboardName: String {
        return rawValue
    }
    
    var initialViewControllerName: String {
        switch self {
        case .uiPageViewController:
            return "ContainerViewController"
        case .ottScreen:
            return "OTTViewController"
        case .wkWebView:
            return "WKWebViewTabBarVC"
        case .mkMapView:
            return "MapTabBarVC"
        case .golfScreens:
            return "GolfHomeScreenVC"
        default:
            return "\(rawValue)VC"
        }
    }
}
