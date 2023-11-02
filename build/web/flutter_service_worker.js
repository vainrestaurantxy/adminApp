'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "5c683be00117057ec1c5babb59459169",
"assets/AssetManifest.json": "6df928449f067cf4997985379b961265",
"assets/assets/add.png": "9ecd6b9d2b238da3123ea1424eea1277",
"assets/assets/add.svg": "854fe52ffd1213ebdfa339d93626beab",
"assets/assets/authImage.png": "74dcd0faa4137796fa9d4aac9ebb7123",
"assets/assets/bestseller.svg": "692c2d518a4c54264b2ac260425bcb66",
"assets/assets/burger.jpg": "2fe8c42988eee64fe9a722f48002de2b",
"assets/assets/cart.svg": "c53ab12076fad3257691a083301f11b6",
"assets/assets/club%2520icon.png": "653137be26030425b603d34e19a1ae27",
"assets/assets/data_usage.svg": "3d2acae2ff82df7f49e3da91cc708bc6",
"assets/assets/download.svg": "cc70bd7e50819c5a7628323738e4b04f",
"assets/assets/drinks.svg": "512499acfc1993eb1146c0c29e2f28e3",
"assets/assets/fastfood.png": "0c659629ac9e31caa034dffd48eb6588",
"assets/assets/fastfood.svg": "52505b440ad829bebdfbdd7e9e8f037d",
"assets/assets/fastfoodwhite.png": "c101330c7514c124c7135f6c99e1f2b1",
"assets/assets/geass.png": "cc4e67ff5feb30c4caf6bb0c5e217646",
"assets/assets/Icon.png": "2709266ed28c5daaac503aca08436c1e",
"assets/assets/Logo%2520Feast.jpg": "3ea14a012ed1451aca8a10973e27e06d",
"assets/assets/Logo%2520Feast.png": "73d3e088fffa940d01816e419a4dfe07",
"assets/assets/logo.svg": "7748a7d5f2603f3d5da7eb757d695a83",
"assets/assets/new.svg": "da9006cea9ff2ad75e910e33dee8f150",
"assets/assets/non-veg.svg": "d0f1e3e2e56bc42f01bccd0d5e51d892",
"assets/assets/qr_code.png": "9ccdcf369f1773ac459e2785f3a0a3bf",
"assets/assets/qr_code.svg": "fe2ee0a478a8ac3ed25f4391e3621256",
"assets/assets/recommend.svg": "99f4490239a194df12f76ad2cceaa4ec",
"assets/assets/Restaurant%2520icon.png": "9844406f85da94e4e5dddb5370aea2a3",
"assets/assets/restaurant.png": "3f29fbb8b1d65e984cd7a7103350e8cc",
"assets/assets/restaurant.svg": "162631d1e4eaf17c464ddeb62f964297",
"assets/assets/restaurantIcon.png": "6318936342097020e25ab9ac6db6a5f3",
"assets/assets/Small%2520with%2520Black%2520BG.png": "e76afe768effcf0c1ab13e03cd32bc30",
"assets/assets/Smallwith%2520White%2520BG.png": "85cadb1052a077a5f1c00b034ecd647e",
"assets/assets/Splash.png": "3f66a2c4f9183faf0820d8d12cff8302",
"assets/assets/taj.png": "64a96f7a022c95d37481826507ebad33",
"assets/assets/timelapse.svg": "641c73535a148fbccd5ee4c8dc36d309",
"assets/assets/vain_icon_png.png": "0de6c0ec3034224351818f6b870f05cf",
"assets/assets/Vector.png": "347d69ee7693f9b7fe990a75b35d3a5a",
"assets/assets/veg.svg": "d4ad344ff0dc0fc75f075b642f51b9e8",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "1a4ba1c0c8cfa6ca87c8c56de1f68fc9",
"assets/NOTICES": "a76a2991ebf9fcc9d7a15736dd46efb7",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/packages/toast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/toast/assets/toastify.js": "e7006a0a033d834ef9414d48db3be6fc",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"canvaskit/canvaskit.wasm": "42df12e09ecc0d5a4a34a69d7ee44314",
"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0",
"canvaskit/chromium/canvaskit.wasm": "be0e3b33510f5b7b0cc76cc4d3e50048",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "1a074e8452fe5e0d02b112e22cdcf455",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "e4bc26bac9bb156bee38179748a92de5",
"/": "e4bc26bac9bb156bee38179748a92de5",
"main.dart.js": "6240404ce6caa2dff9783440c507d049",
"manifest.json": "85762cede2556a524566057c61206351",
"splash/img/dark-1x.png": "7c5400f9083af98f2befe292cc950ca6",
"splash/img/dark-2x.png": "ac5a3ff084978143fe0ce7b41d9290b4",
"splash/img/dark-3x.png": "dca1960a598de65c6ced1f63602fc058",
"splash/img/dark-4x.png": "5a6f265ab5508344be2147709675578b",
"splash/img/light-1x.png": "7c5400f9083af98f2befe292cc950ca6",
"splash/img/light-2x.png": "ac5a3ff084978143fe0ce7b41d9290b4",
"splash/img/light-3x.png": "dca1960a598de65c6ced1f63602fc058",
"splash/img/light-4x.png": "5a6f265ab5508344be2147709675578b",
"version.json": "41182acee4ff5ebb2565195623bfdc7d"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
