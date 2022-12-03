import UIKit
import Capacitor
import CoreSpotlight
import MobileCoreServices

// MARK: - Structs
struct SpotlightItem {
    let identifier: String
    let domainIdentifier: String
    let title: String
    let description: String
    let thumbnail: String
    let thumbnailData: Data?
    let keywords: [String]
    let url: String
}

public class SpotlightSearchPlugin: CAPPlugin {

    // MARK: - Properties
    var addedItems: [CSSearchableItem] = []

    var addedItemsIdentifiers: [String] = UserDefaults.standard.stringArray(forKey: "addedItemsIdentifiers") ?? []
    
    // MARK: - Methods
    @objc func indexItems(_ call: CAPPluginCall) -> Void {
        var items = (call.getArray("items") ?? []) as? [SpotlightItem];

        if (items == nil) {
            call.reject("No items to index")
            return
        }
        
        for item in items ?? [] {
            let attributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
            attributeSet.title = item.title
            attributeSet.contentDescription = item.description
            attributeSet.keywords = item.keywords
            attributeSet.thumbnailData = item.thumbnailData

            let searchableItem = CSSearchableItem(uniqueIdentifier: item.identifier, domainIdentifier: item.domainIdentifier, attributeSet: attributeSet)
            addedItemsIdentifiers.append(item.identifier)
            self.addedItems.append(searchableItem)
        }

        CSSearchableIndex.default().indexSearchableItems(self.addedItems) { (error) in
            if let error = error {
                call.reject("Indexing error: \(error.localizedDescription)")
            } else {
                for item in items ?? [] {
                    self.addedItemsIdentifiers.append(item.identifier)
                }
                
                call.resolve()
            }
        }
    }

    @objc func indexItem(_ call: CAPPluginCall) -> Void {
        let itemJS = call.getObject("item");
        
        if (itemJS == nil) {
            call.reject("No item to index")
            return
        }

        let item = SpotlightItem(
            identifier: itemJS?["identifier"] as? String ?? "",
            domainIdentifier: itemJS?["domainIdentifier"] as? String ?? "",
            title: itemJS?["title"] as? String ?? "",
            description: itemJS?["description"] as? String ?? "",
            thumbnail: itemJS?["thumbnail"] as? String ?? "",
            thumbnailData: itemJS?["thumbnailData"] as? Data,
            keywords: itemJS?["keywords"] as? [String] ?? [],
            url: itemJS?["url"] as? String ?? ""
        )

        let attributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
        attributeSet.title = item.title
        attributeSet.contentDescription = item.description
        attributeSet.keywords = item.keywords
        attributeSet.thumbnailData = item.thumbnailData

        let searchableItem = CSSearchableItem(uniqueIdentifier: item.identifier, domainIdentifier: item.domainIdentifier, attributeSet: attributeSet)
        self.addedItems.append(searchableItem)

        CSSearchableIndex.default().indexSearchableItems(self.addedItems) { (error) in
            if let error = error {
                call.reject("Indexing error: \(error.localizedDescription)")
            } else {
                self.addedItemsIdentifiers.append(item.identifier)

                call.resolve()
            }
        }
    }

    @objc func getIndexedItemsIdentifiers(_ call: CAPPluginCall) -> Void {
        call.resolve([
            "identifiers": self.addedItemsIdentifiers
        ])
    }

    @objc func deleteItemsWithId(_ call: CAPPluginCall) -> Void {
        let itemIdentifiersJS = call.getArray("items") ?? []
                
        let itemIdentifiers = itemIdentifiersJS as? [String] ?? []
        
        CSSearchableIndex.default().deleteSearchableItems(withIdentifiers: itemIdentifiers) { [self] (error) in
            if let error = error {
                call.reject("Deletion error: \(error.localizedDescription)")
            } else {
                self.addedItems.removeAll(where: { itemIdentifiers.contains($0.uniqueIdentifier) })
                self.addedItemsIdentifiers.removeAll(where: { itemIdentifiers.contains($0) })

                call.resolve()
            }
        }
    }

    @objc func deleteAllItems(_ call: CAPPluginCall) -> Void {
        CSSearchableIndex.default().deleteAllSearchableItems { (error) in
            if let error = error {
                call.reject("Deletion error: \(error.localizedDescription)")
            } else {
                self.addedItems.removeAll()
                self.addedItemsIdentifiers.removeAll()

                call.resolve()
            }
        }
    }

}
