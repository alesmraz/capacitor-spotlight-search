#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(SpotlightSearchPlugin, "SpotlightSearch",
           CAP_PLUGIN_METHOD(indexItems, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(indexItem, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getIndexedItemsIdentifiers, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(deleteItemsWithId, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(deleteAllItems, CAPPluginReturnPromise);
)
