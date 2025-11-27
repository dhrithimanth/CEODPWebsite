
export default {
  bootstrap: () => import('./main.server.mjs').then(m => m.default),
  inlineCriticalCss: true,
  baseHref: '/',
  locale: undefined,
  routes: [
  {
    "renderMode": 2,
    "route": "/"
  },
  {
    "renderMode": 2,
    "route": "/about"
  },
  {
    "renderMode": 2,
    "route": "/product-suite"
  },
  {
    "renderMode": 2,
    "route": "/architecture"
  },
  {
    "renderMode": 2,
    "route": "/why-ceodp"
  },
  {
    "renderMode": 2,
    "route": "/testimonials"
  },
  {
    "renderMode": 2,
    "route": "/news"
  },
  {
    "renderMode": 2,
    "route": "/contact"
  },
  {
    "renderMode": 2,
    "redirectTo": "/",
    "route": "/**"
  }
],
  entryPointToBrowserMapping: undefined,
  assets: {
    'index.csr.html': {size: 11582, hash: 'fba74b104e4ded0043f5423ff42eab37a59dcc4853ff5581b9095aec1ab69c63', text: () => import('./assets-chunks/index_csr_html.mjs').then(m => m.default)},
    'index.server.html': {size: 12095, hash: 'd61f23bac6e8b4215326a1cd73e37e5c45484dddf6e952234c9dfcfcead48f24', text: () => import('./assets-chunks/index_server_html.mjs').then(m => m.default)},
    'testimonials/index.html': {size: 28017, hash: 'c27d430e0abd76ec417ff523bef75a4825d256f941d9e32c56caf3f4e2cf89cd', text: () => import('./assets-chunks/testimonials_index_html.mjs').then(m => m.default)},
    'news/index.html': {size: 27727, hash: '36a8e7dc53b49ae6e2abcd45015557fef47ea5e5d0e8512ad3313b4325db35ab', text: () => import('./assets-chunks/news_index_html.mjs').then(m => m.default)},
    'index.html': {size: 34370, hash: '79f74749668d6bcf1005dcd71d44816bdddab2fc3d7db6f42537c489c20bab54', text: () => import('./assets-chunks/index_html.mjs').then(m => m.default)},
    'why-ceodp/index.html': {size: 27555, hash: '6dbc0efabf402d2cbb046770fbccda34235b6277b4749acdfedbf9e30dedf60a', text: () => import('./assets-chunks/why-ceodp_index_html.mjs').then(m => m.default)},
    'product-suite/index.html': {size: 29058, hash: 'cf8fad57c35d0a98327f8bffffc578e27163ced4fb05b3ff452a0337f40b0bf0', text: () => import('./assets-chunks/product-suite_index_html.mjs').then(m => m.default)},
    'contact/index.html': {size: 28204, hash: '35cf335e455290f71144757e8cb3f4ee2944b3123c561de67cbee079545cf546', text: () => import('./assets-chunks/contact_index_html.mjs').then(m => m.default)},
    'architecture/index.html': {size: 29006, hash: 'fd0b2abeadcec17da4ef2d5c4cf15706a87799ffd351216a1b03e63fdc627876', text: () => import('./assets-chunks/architecture_index_html.mjs').then(m => m.default)},
    'about/index.html': {size: 28471, hash: 'd104fcb477bdc1f5199bce97775372ac86646b4ef7897d3b2548e5b13c7763b7', text: () => import('./assets-chunks/about_index_html.mjs').then(m => m.default)},
    'styles-5INURTSO.css': {size: 0, hash: 'menYUTfbRu8', text: () => import('./assets-chunks/styles-5INURTSO_css.mjs').then(m => m.default)}
  },
};
