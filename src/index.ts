import { registerPlugin } from '@capacitor/core';

import type { SpotlightSearchPlugin } from './definitions';

const SpotlightSearch = registerPlugin<SpotlightSearchPlugin>(
  'SpotlightSearch',
  {
    web: () => import('./web').then(m => new m.SpotlightSearchWeb()),
  },
);

export * from './definitions';
export { SpotlightSearch };
