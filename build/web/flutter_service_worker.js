'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "b9d779299b9b8df580850f5e82397e44",
".git/config": "bd4ed44d46035e533b68dc0081f29573",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/FETCH_HEAD": "f6c5c4be9ecbaf31a2cc6dfeaec0b04f",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "ea587b0fae70333bce92257152996e70",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "1190bccd464d3994af31dae76129a89f",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "cbc28d1817c3395616699a6c5d32abfa",
".git/logs/refs/heads/main": "07e689e9b616f035858d46d260283fd4",
".git/logs/refs/heads/master": "1df72a9df8a8301bd196639a6eeb71d7",
".git/logs/refs/remotes/origin/main": "1e9827620f78ee47fadaefd3e0d5d0ed",
".git/objects/04/b8bd1e3ab3e4fab47a2daf09a923dd328dc1e9": "8dbeea1e4ed1ce9fe13d428772bd26d1",
".git/objects/08/6850e339e2cc2cd0fe93f2b6749ebb9e250cb7": "fe8f8d4c6b7c764a2df9a641af9a91e0",
".git/objects/1d/93ee18d806ac6b2ffa14ea7279e46aa948a9e1": "e0ba74fd776b7be1773b1e7fc5d9dc51",
".git/objects/21/b52c74feb4c01569e7c87672fe3573142cedac": "83606b2fb9ce30b64f05aa9e3a7f4874",
".git/objects/3b/819e8c701dad4115380ae20efa54b41117ada4": "fa989d94652cb7718f60d93aa1d2bbd2",
".git/objects/40/112ce6a78ae59d48a064a602b2470efce97499": "dbbeb54e6401dfd12d5264065a9c5b0e",
".git/objects/41/f538e1c5279d8bbfa5e81865d432bbebd30390": "c508d7dd7ee553c81c748c0e99aff354",
".git/objects/44/ce9fc1bc89c158d912393a42856b57e2e9fc6a": "c527368dc4501eb5bacf4cf66e1de80d",
".git/objects/47/914a32fb83630dac884aeeb2ad90e9ab92c6e2": "5c3fc6038c22b2d133e6e63a8cc666b8",
".git/objects/5b/ad8661ef072e2756f03a5d5e476cd89ae33c5c": "64c42a267fa50dcd9492de6e40470437",
".git/objects/5f/63e1e7ae5cdc33c34bcdab0caa910b15efe371": "d8a57eda036bb2063a1e49ec76931087",
".git/objects/73/7f77a1e113d61bb5e3b03b37fbdd792bebad00": "c9f32414819b0d4e0f13c9c186f02d65",
".git/objects/79/7a28f625015713c80e4c202121d49cbeaf6697": "ac52f8b37b1824ffbf637170dcaf22ba",
".git/objects/81/0bc6924fdc24f8201bb4f17dacd9d0d3f9304b": "addaf10e4dfa87e175c0e91c55e24514",
".git/objects/98/4ff81ab0672d52e6a4a5ad7f1762270aceaa1b": "5e98001a3a41ab651325c570c10148b4",
".git/objects/a5/161a99419d55ee04892ec727565b3d55ef0aa2": "c2461a8044fbe046943535dfeb1c4b28",
".git/objects/a7/074258f9670c9f6e65761d98ff38cfb6d22fc1": "eed65703c23fc3a02b42ef1da0661e15",
".git/objects/b1/d8d0990536f1025583a1879d8d319c76056a25": "b832e2a3b82a20be94e62d9edfd80455",
".git/objects/db/c2181e2ad4b399e034ab4dc2aeeaa4df14917e": "452b9bba11f5c22f8b58bc716a40145c",
".git/objects/ef/da7fdac27b2695a7a48805bc05ff6a1dcf5c44": "cdca8141bd05475ae4255543a4794cc9",
".git/objects/f1/ee682a9a7970f5cbcafe3e37e64c00d5faa3f6": "129f9e50b3bdfbb3e4d65929ce2cb3a2",
".git/objects/fd/1200ee8f9672a0bc6173c3db44369e1cf193ce": "a4c90b2a5222efa7544e423b0f06487a",
".git/objects/pack/pack-8ccd77f330ad5b44e1e4327068a3ececfbfb7505.idx": "9f60795f272c1c4a70f1946bb238ede2",
".git/objects/pack/pack-8ccd77f330ad5b44e1e4327068a3ececfbfb7505.pack": "016dc7f6477a2179d57998e4d1e8a051",
".git/ORIG_HEAD": "96a2e29e4c6ab469aca7a78af0c4bda5",
".git/refs/heads/main": "96a2e29e4c6ab469aca7a78af0c4bda5",
".git/refs/heads/master": "b50c24822a8734a81c38daad166a30fa",
".git/refs/remotes/origin/main": "96a2e29e4c6ab469aca7a78af0c4bda5",
".github/workflows/firebase-hosting-merge.yml": "37a6a2740c0df9cdc5e64a2f94f84cb9",
".github/workflows/firebase-hosting-pull-request.yml": "6a4c1c00000d047f814168ddaa0f561a",
"assets/AssetManifest.bin": "5c683be00117057ec1c5babb59459169",
"assets/AssetManifest.json": "6df928449f067cf4997985379b961265",
"assets/assets/add.png": "9ecd6b9d2b238da3123ea1424eea1277",
"assets/assets/add.svg": "18a36524f292be9d961bb91b22d3ac79",
"assets/assets/authImage.png": "74dcd0faa4137796fa9d4aac9ebb7123",
"assets/assets/bestseller.svg": "692c2d518a4c54264b2ac260425bcb66",
"assets/assets/burger.jpg": "2fe8c42988eee64fe9a722f48002de2b",
"assets/assets/cart.svg": "c53ab12076fad3257691a083301f11b6",
"assets/assets/club%2520icon.png": "653137be26030425b603d34e19a1ae27",
"assets/assets/data_usage.svg": "0bee1d612b0bbc6b58ee4a19b89f1f6f",
"assets/assets/download.svg": "b6f6985ab1d82ec3e3a71faf26ac36b0",
"assets/assets/drinks.svg": "512499acfc1993eb1146c0c29e2f28e3",
"assets/assets/fastfood.png": "0c659629ac9e31caa034dffd48eb6588",
"assets/assets/fastfood.svg": "17296b36151ea322af9377337c84eaa9",
"assets/assets/fastfoodwhite.png": "c101330c7514c124c7135f6c99e1f2b1",
"assets/assets/geass.png": "cc4e67ff5feb30c4caf6bb0c5e217646",
"assets/assets/Icon.png": "2709266ed28c5daaac503aca08436c1e",
"assets/assets/Logo%2520Feast.jpg": "3ea14a012ed1451aca8a10973e27e06d",
"assets/assets/Logo%2520Feast.png": "73d3e088fffa940d01816e419a4dfe07",
"assets/assets/logo.svg": "7748a7d5f2603f3d5da7eb757d695a83",
"assets/assets/new.svg": "da9006cea9ff2ad75e910e33dee8f150",
"assets/assets/non-veg.svg": "d0f1e3e2e56bc42f01bccd0d5e51d892",
"assets/assets/qr_code.png": "9ccdcf369f1773ac459e2785f3a0a3bf",
"assets/assets/qr_code.svg": "29eebf89f339fbd731d689402cd7aef4",
"assets/assets/recommend.svg": "99f4490239a194df12f76ad2cceaa4ec",
"assets/assets/Restaurant%2520icon.png": "9844406f85da94e4e5dddb5370aea2a3",
"assets/assets/restaurant.png": "3f29fbb8b1d65e984cd7a7103350e8cc",
"assets/assets/restaurant.svg": "d5b8fb2d3228e3bc78fc1b864c3d7f00",
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
"assets/fonts/MaterialIcons-Regular.otf": "6437e934b126bfda94390ab57eee97be",
"assets/NOTICES": "68101802ed7d0a76567787e9c796b50c",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/packages/toast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/toast/assets/toastify.js": "e7006a0a033d834ef9414d48db3be6fc",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "ee300cb13ce1478de9ca15f2eb2a1854",
"/": "ee300cb13ce1478de9ca15f2eb2a1854",
"main.dart.js": "81009b5ca5f87ad8a3c719d4ebf9724b",
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
