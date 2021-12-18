import SwiftUI

public extension AutocompleteToolbar where ItemView == AnyView, SeparatorView == AnyView {

    /**
     Create an autocomplete toolbar.

     - Parameters:
       - suggestions: A list of suggestions to display in the toolbar.
       - locale: The locale to apply to the toolbar.
       - style: The style to apply to the toolbar, by default `.standard`.
       - itemBuilder: An optional, custom item builder. By default, the static `standardItem` will be used.
       - separatorBuilder: An optional, custom separator builder. By default, the static `standardSeparator` will be used.
       - replacementAction: An optional, custom replacement action. By default, the static `standardReplacementAction` will be used.
     */
    @available(*, deprecated, message: "Use the generic initializers instead.")
    init(
        suggestions: [AutocompleteSuggestion],
        locale: Locale,
        style: AutocompleteToolbarStyle = .standard,
        itemBuilder: @escaping ItemBuilder = Self.standardItem,
        separatorBuilder: @escaping SeparatorBuilder = Self.standardSeparator,
        replacementAction: @escaping ReplacementAction = Self.standardReplacementAction) {
        self.items = suggestions.map { BarItem($0) }
        self.itemBuilder = itemBuilder
        self.locale = locale
        self.style = style
        self.separatorBuilder = separatorBuilder
        self.replacementAction = replacementAction
    }
    
    /**
     This typealias represents the action block that is used
     to create autocomplete suggestion views, which are then
     wrapped in buttons that trigger the `replacementAction`.
     */
    @available(*, deprecated, message: "Use the generic initializers instead.")
    typealias ItemBuilder = SuggestionBuilder<AnyView>
    
    /**
     This typealias represents the action block that is used
     to create autocomplete suggestion separator views.
     */
    @available(*, deprecated, message: "Use the generic initializers instead.")
    typealias SeparatorBuilder = SuggestionsSeparatorBuilder<AnyView>
    
    /**
     This is the default function that will be used to build
     an item view for the provided `suggestion`.
     */
    @available(*, deprecated, message: "Use the generic initializers instead.")
    static func standardItem(
        for suggestion: AutocompleteSuggestion,
        locale: Locale,
        style: AutocompleteToolbarStyle) -> AnyView {
        AnyView(standardSuggestion(for: suggestion, locale: locale, style: style))
    }
    
    /**
     This is the default function that will be used to build
     an item separator after the provided `suggestion`.
     */
    @available(*, deprecated, message: "Use the standardSuggestionsSeparator instead.")
    static func standardSeparator(
        for suggestion: AutocompleteSuggestion,
        style: AutocompleteToolbarStyle) -> AnyView {
        AnyView(standardSuggestionsSeparator(for: suggestion, style: style))
    }
}
