package com.getcapacitor.plugin.spotlightsearch;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "SpotlightSearch")
public class SpotlightSearchPlugin extends Plugin {

    @PluginMethod
    public void indexItems(PluginCall call) {
        call.reject("Not implemented on Android.");
    }

    @PluginMethod
    public void indexItem(PluginCall call) {
        call.reject("Not implemented on Android.");
    }

    @PluginMethod
    public void getIndexedItemsIdentifiers(PluginCall call) {
        call.reject("Not implemented on Android.");
    }

    @PluginMethod
    public void deleteItemsWithId(PluginCall call) {
        call.reject("Not implemented on Android.");
    }

    @PluginMethod
    public void deleteAllItems(PluginCall call) {
        call.reject("Not implemented on Android.");
    }
}
