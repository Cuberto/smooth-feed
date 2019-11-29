//
//  SmoothFeedCollectionReusableView.swift
//  smooth-feed
//
//  Created by Denis Shvetsov on 29/11/2019.
//  Copyright © 2019 Cuberto. All rights reserved.

import Foundation

/// SmoothFeedCollectionViewLayout alternative for self-sizing cells via `preferredLayoutAttributesFitting(_:)`
/// You can calculate height by calling:
///
///     return systemLayoutSizeFitting(
///         CGSize(width: width, height: 0),
///         withHorizontalFittingPriority: .required,
///         verticalFittingPriority: .fittingSizeLevel
///     ).height
///
/// or just return constant
///
public protocol SmoothFeedCollectionReusableView {
    func heightFitting(width: CGFloat) -> CGFloat
}
