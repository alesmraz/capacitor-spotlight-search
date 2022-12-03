/* eslint-disable @typescript-eslint/no-unused-vars */
import { WebPlugin } from '@capacitor/core';

import type { SpotlightItem, SpotlightSearchPlugin } from './definitions';

export class SpotlightSearchWeb
  extends WebPlugin
  implements SpotlightSearchPlugin
{
  async indexItems(_items: SpotlightItem[]): Promise<void> {
    return new Promise((_, reject) => {
      reject('Not implemented for web.');
    });
  }

  async indexItem(_item: SpotlightItem): Promise<void> {
    return new Promise((_, reject) => {
      reject('Not implemented for web.');
    });
  }

  async getIndexedItemsIdentifiers(): Promise<string[]> {
    return new Promise((_, reject) => {
      reject('Not implemented for web.');
    });
  }

  async deleteItemsWithId(_id: string[]): Promise<void> {
    return new Promise((_, reject) => {
      reject('Not implemented for web.');
    });
  }

  async deleteAllItems(): Promise<void> {
    return new Promise((_, reject) => {
      reject('Not implemented for web.');
    });
  }
}
