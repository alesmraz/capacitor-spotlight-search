export type SpotlightItem = {
  title: string;
  contentDescription?: string;
  uniqueIdentifier: string;
  domain: string;
  thumbnailName?: string;
  thumbnailData?: string;
  keywords?: string[];
};

export interface SpotlightSearchPlugin {
  indexItems(items: SpotlightItem[]): Promise<void>;

  indexItem(item: SpotlightItem): Promise<void>;

  getIndexedItemsIdentifiers(): Promise<string[]>;

  deleteItemsWithId(id: string[]): Promise<void>;

  deleteAllItems(): Promise<void>;
}
