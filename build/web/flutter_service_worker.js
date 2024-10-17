'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "1bf58c9f3459598146761a697aedcfc2",
"assets/AssetManifest.bin.json": "1cde0a5952d148c273ee1a9bcd96515e",
"assets/AssetManifest.json": "6cf9fd54c494fffba0a43666d07f4897",
"assets/assets/Android.png": "549d0830da4a9dc0e04608256eedb6f9",
"assets/assets/AttendEase-1.jpg": "a038f1ac388ec2c809ff79ed57224dde",
"assets/assets/AttendEase-2.jpg": "96da97312819231536e7dc204e8015a6",
"assets/assets/AttendEase-3.jpg": "877396ca2428085fee1a9f428eb22335",
"assets/assets/AttendEase.png": "d08f2be6d095b2fba0a7bbdfc881e414",
"assets/assets/C++.png": "e4f46516b8d0d4b45f958b7e404f2d55",
"assets/assets/C.png": "87693642e73b9834d8362182efe503ec",
"assets/assets/Cancel.png": "3e2920758b4d82791f367ad6d7b5f52f",
"assets/assets/Canva.png": "312666865e603754c7b169b53680cbbd",
"assets/assets/Chess-1.jpg": "1db1e76fd97e558b9a1f2fccba327e12",
"assets/assets/Chess-2.jpg": "6e9e9576e8246a7f73f9a153a1b40b5b",
"assets/assets/Chess-3.jpg": "478cafebbc65507cf530d6878991ee9e",
"assets/assets/Chess.png": "3d60666ca92e551083df6954959e2286",
"assets/assets/CodeBuddy-1.jpg": "e5ee58e4de1ce5848dbe8870c8be66a1",
"assets/assets/CodeBuddy-2.jpg": "16b4e622b86338f39b875e52d3c80829",
"assets/assets/CodeBuddy-3.jpg": "85926f4e5068870b099f62b0b02b8317",
"assets/assets/CodeBuddy.png": "f4b25ae24828cb9f48d19c590b7b3ad4",
"assets/assets/Codechef.png": "f9c4544519d7b113575a050ec1a92d49",
"assets/assets/Dart.png": "0932de4f5f74e0419a73f786dd270ce6",
"assets/assets/Figma.png": "81d093d1b22a2752beb0d8d6d0c61647",
"assets/assets/Firebase.png": "0afa5a36bcce64148685e55ec14564d7",
"assets/assets/Flutter.png": "8e018941b965a75026871d7036714873",
"assets/assets/Gemini.png": "c04efabb41e149feecfa1c2a6e5c18f1",
"assets/assets/Git.png": "87a955816509ce7ca810ca8157d69586",
"assets/assets/GitHub.png": "fcc8683605cc3d533fb733ae07fc32e2",
"assets/assets/Github96.png": "cd614458f20c74a5ebedb9bb64696ddb",
"assets/assets/Instagram.png": "8ae95cc30627ded09054e7e295705f13",
"assets/assets/Java.png": "b6a7b79dd611cf0fcb11e85f284f7f1f",
"assets/assets/Leetcode.png": "18d8fd1704e434918ffd74d451474b91",
"assets/assets/LinkedIn.png": "f9b0ad66df07645ddfe48693de7de782",
"assets/assets/Logo.png": "ce3b40fc6bf4f988acfbd9d3eb54296a",
"assets/assets/Maps.png": "48e4193112ecd6a017029e896a49b4ae",
"assets/assets/Menu.png": "bc35bf3d8eb557a685e71ac436234bfd",
"assets/assets/Mysql.png": "48345a0caadf08800ffd838017fb3352",
"assets/assets/Neon.png": "aae405785b03a346f5c96324471d2c2a",
"assets/assets/Office.png": "facb227b880de3528ce5e5fcd343efe6",
"assets/assets/Portfolio.png": "6f41de3f94b03c95ff674d771f699a43",
"assets/assets/Postgresql.png": "64ff3b093853e9d340eaef55a038fefd",
"assets/assets/ProfilePicture.jpeg": "e48edaa61748cb2ce1ef47b9ed5aaf8f",
"assets/assets/TrueLink-1.jpg": "20fc62b1d4a8c60465e28fe63319a0e6",
"assets/assets/TrueLink-2.jpg": "5af3020f52382b0e76d83d824cdc2471",
"assets/assets/TrueLink-3.jpg": "76586d03f0947e1b87d20c090db8767c",
"assets/assets/TrueLink.png": "04b0be7db27303ab2a10d8c8bde49e9f",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "6809be91dd53af02a17205b66a9b8a44",
"assets/NOTICES": "8dc7477687ecfae392bbb408bfe7a652",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "59cfc04977cff10ff3f69f26a8f284da",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "7d97b5250edbf4c6f9df3edf4a3f1744",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "510120590b61e2d30c387d4022ef629e",
"/": "510120590b61e2d30c387d4022ef629e",
"main.dart.js": "d741a4bfffa0fe45aaa43167a8a3e397",
"manifest.json": "e74af8957b5899dc6da961caee768ec9",
"version.json": "009c9e65172e010890f7f65fde438006"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
