# 🚨🚨🚨 THIS PLUGIN IS STILL IN DEVELOPMENT 🚨🚨🚨

# capacitor-spotlight-search

Capacitor plugin for iOS Spotlight search functionality

__Heavily inspired by [react-native-spotlight-search](https://github.com/jdmunro/react-native-spotlight-search)__

Make shout-out to [jdmunro](https://github.com/jdmunro) (Author of react-native-spotlight-search) for the idea and some code inspiration.

preview (also from `react-native-spotlight-search`):

![Spotlight Search Demo](http://i.imgur.com/tbI3yAs.gif)

## Install

```bash
npm install capacitor-spotlight-search
npx cap sync
```

## API

<docgen-index>

* [`indexItems(...)`](#indexitems)
* [`indexItem(...)`](#indexitem)
* [`getIndexedItemsIdentifiers()`](#getindexeditemsidentifiers)
* [`deleteItemsWithId(...)`](#deleteitemswithid)
* [`deleteAllItems()`](#deleteallitems)
* [Type Aliases](#type-aliases)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### indexItems(...)

```typescript
indexItems(items: SpotlightItem[]) => Promise<void>
```

| Param       | Type                         |
| ----------- | ---------------------------- |
| **`items`** | <code>SpotlightItem[]</code> |

--------------------


### indexItem(...)

```typescript
indexItem(item: SpotlightItem) => Promise<void>
```

| Param      | Type                                                    |
| ---------- | ------------------------------------------------------- |
| **`item`** | <code><a href="#spotlightitem">SpotlightItem</a></code> |

--------------------


### getIndexedItemsIdentifiers()

```typescript
getIndexedItemsIdentifiers() => Promise<string[]>
```

**Returns:** <code>Promise&lt;string[]&gt;</code>

--------------------


### deleteItemsWithId(...)

```typescript
deleteItemsWithId(id: string[]) => Promise<void>
```

| Param    | Type                  |
| -------- | --------------------- |
| **`id`** | <code>string[]</code> |

--------------------


### deleteAllItems()

```typescript
deleteAllItems() => Promise<void>
```

--------------------


### Type Aliases


#### SpotlightItem


| Property                 | Description                                                                                                   | Type       | Required |
| ------------------------ | ------------------------------------------------------------------------------------------------------------- | ---------- | -------- |
| **`title`**              | The title of the search item.                                                                                 | `string`   | Yes      |
| **`contentDescription`** | A description which appears below the title in the search results.                                            | `string`   | No       |
| **`uniqueIdentifier`**   | A unique and stable identifier. Used to refer to the item.                                                    | `string`   | Yes      |
| **`domain`**             | A string for grouping related items together in a way that makes sense. Not displayed to the user.            | `string`   | Yes      |
| **`thumbnailName`**      | A local file name/key to a thumbnail image. See [A Note About Thumbnails](#a-note-about-thumbnails).          | `string`   | No       |
| **`thumbnailData`**      | A base64 string representation of a thumbnail image. See [A Note About Thumbnails](#a-note-about-thumbnails). | `string`   | No       |
| **`keywords`**           | An array of keywords which can be used to help inform the search index. Not visible to the user.              | `[string]` | No       |

</docgen-api>

### TODO

- [ ] add handler to open app from spotlight search with specific item
- [ ] Android support (is it even possible?)
