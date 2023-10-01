'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "563d5f8be9d2d9801f36a7b5d164291f",
".git/config": "bd4ed44d46035e533b68dc0081f29573",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
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
".git/index": "e03fdea08e380cf2681450dc7d01904e",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "83c310ddd96569d9c6481e7e1e8b25ba",
".git/logs/refs/heads/main": "c7ea2d1f4b349354eefa2f1caec27eb6",
".git/logs/refs/remotes/origin/main": "f4607f325fbe7f5a9d4403a367a34332",
".git/objects/00/fdc6ad81d1dbeea162cd1be66d340bef026a89": "82aad02e555edc6187e661730f09c6a4",
".git/objects/00/ff23a61d06457479bbd6d5aca5d904aaf776ef": "6f721b6c84fa70c850d06145aa592dd9",
".git/objects/03/874086a59dce893582c6f4c2d634923d256a78": "f5f47b1e7036f181cabbb03b1a6bdeed",
".git/objects/03/c531a7a4eadfbb97e5434401927ee31890cf33": "fe6b24f60048b7f218835d95c2c650ae",
".git/objects/03/c745201e109765694f748db3975831d9bec16b": "ee35ae4bb0af8f379ee81f650f5f07cb",
".git/objects/04/b848250def99975d222f39d8955c35d3c3d04c": "7732187fcbde835e6dfd7f04a2d2480b",
".git/objects/06/5a156ad876ae75d08bca0aabc8c1e01f285abb": "1338ac20d12542d14345378e2fe2be26",
".git/objects/06/fa319f117b30bb68dd72f0f62af403acd8c264": "1b30ecd03026185b426af9a90e3d7edd",
".git/objects/08/18e9a2a972e5e5f32394c44cb619a10c4d9177": "0f44aac1162bea919ed6f793ffc811cd",
".git/objects/0a/0fb8d18086fbd0cd48d2d372fe15c4a9c6235b": "7a5f63c98d7088c94c8f1b963854323a",
".git/objects/0b/85bcdb86bf9e9f9fda81b13cec9c9349d47d77": "77cbf4b6cc88e2471afd14a98ef2e0ed",
".git/objects/0d/c6975c6e24eddde1bd781237bd8dd1f4bc40cb": "bd43a9f8f50874589a74384bb3e17d2a",
".git/objects/10/595ef4eef0c8aebb6fc2eee8b9624fffeeadf3": "2b2c58ce1d77e3a49ed2b0b4c8a72548",
".git/objects/11/0a1bdd9f58b79faca389b454141ed054aec6c1": "4820a44164e1320581728355cccbebae",
".git/objects/11/cf17213b06e98a2aaa443b27436ab1e070da67": "308f092937d4ac109f35c8d24229035d",
".git/objects/11/ebe0abf0e894a859e0fb58e7eae195cda45183": "a448adc1da0456db701dc50d773d932a",
".git/objects/12/112383befe105d4234e23bb9d29645bcdebf91": "25d99c3f8257df574e3508eaba5baf2c",
".git/objects/12/693fd5784087cd366b2cf0db0432587c878e83": "6c722a798345e66d489701c6f77a4136",
".git/objects/13/b96d69664f8fa99b67a635063d3e8045cb13f4": "4c00ab25b59fd3424c78dc88b8292859",
".git/objects/17/6528de985c061632fbf8a6e38422507ac93519": "85c1fe09d16c03493843b2c4c47d6502",
".git/objects/19/e1218574cfb3ee0caa3eb1e0ac11545c9ff714": "702ba612e0d7f627238d5f709b0af9e9",
".git/objects/1d/384f3748038966a5c7316223edf120dd5894dd": "a8d542276aa823dfefb8d26439e1077a",
".git/objects/1e/bf993c04c08e17a0122730f8d7ce6e139c8bad": "eeb4f0d71f24758335fe1753273ad6c2",
".git/objects/1e/fed0519afdcc35dd7051922a39d7d030269ec9": "782014f9b9e4e14f9835cc220aacf47e",
".git/objects/1f/686edd1465272558af328ca43cb7189a0059e6": "5e83820f6d3e5392693d45bc239b2b61",
".git/objects/1f/bf696c456c56f1c25735e8a06691bce8c5f9d8": "3bd43259b97e1e506e42eb2861dd49f8",
".git/objects/20/97f61ab8b2c25bee2d106ee9de4b67a457187b": "460190c1c37d978429ce279f6bcb674e",
".git/objects/24/bd39e0e2e25f1cbbfa4525e6e2ea7068c72e72": "b434b9bc44ce7a7c9d0cc6da879228e9",
".git/objects/2d/0471ef9f12c9641643e7de6ebf25c440812b41": "d92fd35a211d5e9c566342a07818e99e",
".git/objects/2d/3b3dc6357def8412076aa991b7c6f36d93d367": "0a3939a1b8af6795af1fd05a644f866c",
".git/objects/2d/efdf19ff8ae81a57ee90d11f981064e60974f0": "1c013bbba1985f87d2e3e190b4f0d808",
".git/objects/2f/804ca3167546f337d5e8665cd5359149a531d6": "37cf727f2856691f4b78fa961232a121",
".git/objects/2f/953efa19e37e267aeaad300cc0fb35c2de7276": "80c176d10a5c37cfd0db24b89573d206",
".git/objects/33/9501bb34d1a36d9cc0d005d98199515306d6bf": "42ffd927508785156c033363edf87462",
".git/objects/35/91af41948adc8001f3586d76b91181311953fc": "c91d33b29071dcff3b2b3385383761cb",
".git/objects/35/a8c183672224a2a974203d635821695a41c11a": "6edb36c3c39b3aab76a56e4e22cf6a2f",
".git/objects/35/f851774b8bf392994108ecd4ae0e49c72bac77": "c5f20a8a4de2fbff7697c61b6d8efd8f",
".git/objects/37/7580cbf691d03aea79c63a3a251b1b48ac01f1": "c196d282a50e3c372b4445c6b8868297",
".git/objects/39/7e78c2fb4b2849ba408f3911fa7ba2296e5a92": "728c4f5ec4498fa19ab5c30da34c7402",
".git/objects/3b/b0860a0981211a1ab11fced3e6dad7e9bc1834": "3f00fdcdb1bb283f5ce8fd548f00af7b",
".git/objects/3b/e37b6c4cd6121d214459fa1801d009513d4872": "c667dd9018eb43726c7f649680e606c1",
".git/objects/3c/3e7b4b1958f3cd2b743f71fc9effcb26322066": "272afedf51c69efc8225785492c7229b",
".git/objects/3c/b3b53a24ee4712b8463133dca203ddd72fb43b": "c3066eae2c84f5465b93f0624f5ecfa6",
".git/objects/3d/29fd9a4981ecf7898f55aa20ac340fca10e8b4": "51a5187da0c4815ddd869abcd09d42ea",
".git/objects/3e/24403bd325738adb92136ce90ec9b9d76f717c": "b46444a372b8ef82528f51a85f665578",
".git/objects/41/145ab6915eac6000ea14ca5cb207d6d196f6f8": "1c51068a8083828dafd117e4e7081905",
".git/objects/43/13a7cae50249082e750daec413381a29ac1e3b": "f1f48f34f7854ef7d1465f346c4937af",
".git/objects/45/76e6837a45d86baf6514267ddbe4cd90488445": "2ab52daee69afaa412d3e1fed6e70318",
".git/objects/45/ec9f345e50838517a4ea20d6272b257d9cb507": "85981a24e6c3ded13f1c0c795cc1d9b7",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/46/5b04e85d7176f3c74625689596dc6a3b74b6fe": "0d963ca2b1a342a0f52c28959c410a2a",
".git/objects/47/df998bea8dbb80b2410db25eaf3e2985de307e": "d4d463cb483e6f612390746c0a6eba60",
".git/objects/48/cca26673cf8cd302b499503fff8c8276edfaf7": "61880238a512dc94bff1ab9bf8ddab98",
".git/objects/49/6fc69ee1fe71418b43e12026b017d0c2eb6254": "e913c892b537001db2e65f4a17dde685",
".git/objects/4a/c61f1ae6097f977944a2b46c483975df5dc91e": "8bbd2d090ae90ca5057cfd816a1a0674",
".git/objects/4b/626628532cf1bb6018d1b5407cac64ae85a466": "7641b7fef51a9d0b0aaf5c35cba5ac58",
".git/objects/4c/33195d94ff827e9b52c31467bed23a2751c59e": "694a328086be387b88bcff0a33691710",
".git/objects/4c/bb06c53acacf452e5c6b44b4cfa735a67e3bc7": "7979ef291d0516f53569c3dc73ed32c8",
".git/objects/4e/fef69fe155506c085b94dc9b3ed8e509a4715c": "2caee973fc3e52a56d8e9ecbf696c106",
".git/objects/51/34e6402246228fb7f58ce8fe76727a61d99a62": "6b5e5b48febe40daec7062aecdc3b39f",
".git/objects/52/65a3fd89bbf906e283d5f3231fa5710f01256a": "81e73a63d72c42e089f9641c4c49c834",
".git/objects/56/d8949c54f4049a5a692853c75427cd4070db1d": "8e5b1be0fe526255c85eea42f5e33290",
".git/objects/57/dd032ef503e82c07860d58780f005d0b92f740": "995f7bbaef7ca4f23c3978c30c26709f",
".git/objects/58/9b8327beb146193ce960c0ac1d925481686e62": "2f2aca6b6d2ef536462d83ecb9f7a0f1",
".git/objects/58/ed1209e4dba8d6f376beedb2edaa0d7dcf0d64": "5675c390c879b45d4f3efc0e3707f910",
".git/objects/59/3a5deec4f08bf0c7ffa30b6e2a12b26b65831d": "54a1ed31d5e0d7e802887a23a6ec752e",
".git/objects/5a/07a26ffabe0cf1b43ced0f9d96a36fa19b0df7": "59341beaadd7018fa049aa79c5d4cec4",
".git/objects/5a/f8f6337db1bcbcfb0ca9afc0135c3638e64087": "87fdc52081674d85becaae68b530495b",
".git/objects/5b/5b9b6385730e142fafee44b0ba974d8d2e6821": "5ffec302ddb985c104b6206c86f82070",
".git/objects/5d/22fdae492621895404dd0a590192e60bf0dec8": "986b4fdb085f66dd7e36f9f3f43bfdc7",
".git/objects/5d/48e701336da9fd039169a3d45994bfb45186a5": "408cf50d679e3498fc4eefc20fead608",
".git/objects/62/a01d6826913d9efa140d2e9f4bc0f13918e607": "44ba2af6a4f05cb190463143170ae010",
".git/objects/66/29c79ecaf22dadaee1372fc22ab70b340e91ad": "9be0b2e2a67c636188acfb19cef62f37",
".git/objects/66/c8b80781b472eff51619ee2aa05477b8df3b32": "e68a885c30fe1f3085b91f2cc7fe831b",
".git/objects/66/e898e2d6c70a0b3ad98313a7793a639cbdfb26": "927a8f21e7761b2bd15b60ed10d101d2",
".git/objects/67/48e0e348409fd09c1fa01a3d02bd819dbfd7eb": "c7ed8889adcb62ba18f26ba4ca74f5bf",
".git/objects/69/83e3216e27ac5dca4fbc76c451db1b00a293eb": "39fc80d159abd14980b3a368bf4d73ed",
".git/objects/6c/d277e51448181a32f054b5a3a5569f6e5ad5e3": "4942dfd72931960be4d56a2f17cce6c2",
".git/objects/70/010cc4761157d9d7cc2d082cf342e63fe1190a": "baf21d1dacab382149ee93266543ff40",
".git/objects/72/1c38d712b0d24c28d0e16265601c65e3b7e0da": "2016e06ebba88189a5293719d59cd655",
".git/objects/72/ef303637a0f47f3ed80bcdca04b581140ac246": "f3671fe86fef1dc941798655a7f267c0",
".git/objects/78/9f4b2426acb2a7f7de8a1e23857c1c14c42d60": "fdd984456166f0bd31f283143edcb5a6",
".git/objects/7b/1b7c7b09ce5e490b50a8fa54df29cf82960823": "3b717e2b69311b284f3b8aba375a52e6",
".git/objects/7f/56b0114b56600419e8cdec34786817c31cb4df": "4638238e92831819327beae63611c612",
".git/objects/82/085a01ffda6ab6a235866bd4e6dde4d54ba2cd": "310e0ac24ac48c1a9ddd3a15263af8d1",
".git/objects/85/1ddb232e6e18afe2c21b68d1da6441779f0302": "3743e5161f881b860f4882e7101c52fa",
".git/objects/85/486eff95bcfdbe8c0d07864ed72fefa9a993c4": "91a07138fb42c22bef87e353e2f1eec8",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/89/0796c574fa2311c0f12b24c91787efc35fefa8": "a5c9d53bfa9f1a3e9b0972b7ef2afdf4",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8a/d722cf5af60cef1beb306081b5785118990587": "92df1889d1f0401c1e1cb3f45862d06c",
".git/objects/8d/3634f0771fd55dd49d8184e18260fcd71afef2": "21a515596c2b595e6f1583fbddb5eb64",
".git/objects/8e/7f4b338840099949781ab85496d7a67fae46f1": "7f2803c236e9e7d95ef6ed16a3a2bd13",
".git/objects/8f/44a7c729695d5456f1b82185b518291cdf1418": "17f1ac5281509220073d16a730b83bcf",
".git/objects/8f/ce57f68ff9abb12afd27bb1978dc4965ee39f0": "d3678bcb1cb2273ef1fcb3e92a5763cb",
".git/objects/90/c18e62a9a601d9a767074c0ad14f47613b2b8a": "37a6e9b6a6d2f86e4f1ee958a57cf6e8",
".git/objects/90/eb298661b0f14bffd88991df3c2532694a4640": "5404eafe4dfd47fb348eb4605685303e",
".git/objects/92/2a85345fa81fec05bb84013ace712d3f9ec662": "fcfc67334e24c81970b0a3bcafb911f0",
".git/objects/92/e36c94c548dd9992883a6151a4b75a2c46ba41": "e13a95e8d8f5a722fe3e09fe17ba30d8",
".git/objects/93/e7968323e2aada74bf806f5851960d8c5fc781": "a4a1d36b440853231b41b7eeb532c7ce",
".git/objects/94/7f03454b5ef134ffd757e27a740ff4fcc6434d": "7f58dda73ae55e96b1e869df69e58f47",
".git/objects/95/978f966cd7520256705b88ec56eda2419bfc60": "d822eb906dd9bc65d4b6dd49306a3568",
".git/objects/97/ab4ff58e5ae6c466e691cd177130fea0f9b4b4": "308a35b802ff062e8e9b1a008512eed5",
".git/objects/9b/02087f30ff55724a6eea4cae84564cb3cd34d3": "50d93e3147fc66d7feacb90b71bf6435",
".git/objects/9b/386bd33a178f5bc37d6d21784ee8d6cd006a11": "aa395dea258b60ff85932f478e85acaa",
".git/objects/9b/598ff04e73f565768eff88de770dbb6154153e": "9a7eb5eadcc4cf42db6ff886de95091d",
".git/objects/9c/0f15b7c7f8a2ebaf7bfaee70b92f91f8c4f8c1": "25124226d5a65a9808474655a8861c86",
".git/objects/9d/6829c22cf2ba4d581556ec31ddb8726fd382e7": "8da0042e4c4d2a4162416554ec1aa4ef",
".git/objects/9d/6fdbdd96b355408ee776167b084f63cc870e7b": "dcedbfee98c1635fee8e89cc5575455d",
".git/objects/9e/d12aa11d2d83066052fd81428884dd73b4d53b": "406b7b418dd95796a80b7c701ed8cbae",
".git/objects/a6/28dfcedfbb728d0adc07f576ca0c9a18518056": "ea84d41b2e2dd39b6f14bde0614aebe3",
".git/objects/a7/ac2a280d4221a18a68db55eb5e18f63427a03f": "7861cc707a933263e50454275b181ebf",
".git/objects/a9/c5215e08739ad3e35abc5a1c11047e1364ece2": "1e9b9f24718c44a29bc85e45696f25c3",
".git/objects/ac/dff003233d90b91aebe67dcd38d5049aacda7b": "6fea100e06e06948e49143e92be1a8dd",
".git/objects/ad/4d3cfb330b5b7758c355ace4c7dfe408d49d85": "4c75d74f98d4c11fb30c8ad28eb3086c",
".git/objects/ae/37803d1933c3979fd1b939ff61cc667b0b70dc": "f5c08c98e82ebd9034dbd78b64a292fa",
".git/objects/ae/cd224ea8b89e2797583a55f646de4d78835652": "c931f5aba937050edc02f61075417dfc",
".git/objects/b0/fd2c006385f46a60f7e7edff1ad2406d4be6a0": "80afefb9f966816a9c30f76b0f446932",
".git/objects/b2/2fdb2d1fa6a3bced274617d58f6ab432bb0d8b": "1b405e4dfab487f51d41422d52600614",
".git/objects/b2/c881d0ce691eea516e5f7d1627dbacef7c3ab1": "0bb9bc3e44bb6db226473343fe33bf8f",
".git/objects/b3/59c66bf43ee18fe0a84923b740812a1d5a9c42": "73fb6c4287db13952f212e1910967db4",
".git/objects/b3/a19a0c0b8504780ad368484128ecb05d523019": "908e5b250adc30b3219f8912292fb3a6",
".git/objects/b5/239cae84c43d4c9f93b38ebabd5e4790fe9823": "12c4dd08bccc420000aacc8b78c2d5b0",
".git/objects/b5/bf71b30b762475845718b06212485c642e40db": "a12f16417f1c6d2e4b478112d5df5d4c",
".git/objects/b5/f29de51c1c384314570efb202adb21727afff2": "8891f7f6580802e933c701595c0f5b2d",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b8/b2042ccb407b8b0dbddaaa76929faf13516648": "2f337e054054fa7b13405ff2343a3366",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/bb/7c9ea410116cd5181e262b6a4ed12411909daa": "4dd1951021c3d7645c9e48c13ffd0bd0",
".git/objects/bb/ac29f5ef7a40bf14c0901bc1457724156bc0de": "1393f20f0610cabefe2d4f45865b0f54",
".git/objects/bc/1698e9e8a3f9faee48206459c5ec88f5b224c7": "fb85e51b2b110b317f5678d6066deff2",
".git/objects/bd/a4085bd47692eb7970a4f32a726972f3bf9816": "d4df2247afa8828ea2fd376d6f3a298d",
".git/objects/bd/dbf48b530f1c4e3e78f278422ed618081fd1d2": "b827384486a2720cb0ee1a44e5e6f4ca",
".git/objects/c1/83f513733b34a520be7a5b4fc4e772909034dd": "4597d72d32ed2e1a0a2f3ca215df9fe7",
".git/objects/c7/11ddbe9418a797ffaa646311a50affb642450e": "080276df2e8220206afcde28ce1f944d",
".git/objects/c7/5f4945d07620eac96d47fec5a9dbcd364b2ba9": "2c4c81b520303960f334d2d109f130e7",
".git/objects/c7/7663172ca915a99a594ca17d06f527db05657d": "6335b074b18eb4ebe51f3a2c609a6ecc",
".git/objects/c7/bfd24665278f8b31fc36f0a8cbc02747281d3e": "78cf4f1148503cf28c37a9ab7a6ddb17",
".git/objects/c8/5139663542ac3399448d804ae074796ba79e35": "e18b6cfc5f5c400ba448d9ea960eca93",
".git/objects/c8/b1bfa458b8cbab2cb9b32ca5e1870ba8f387e5": "22cf1529c931cdd2a90b05da4f87919f",
".git/objects/c9/1829d1e2add377d778dbb400560202540f68dd": "c8e8b2c01e91c7fbe3bce944b080a561",
".git/objects/cb/80e3c170c08ffd97334836a9388b93a8776607": "e2d66e598507aedb210a9b4bdf80f526",
".git/objects/cc/deb01d2f6fe61e7e8bcd0ad243807047b2382a": "724d7a499a6fa7356cf2e38b664f442f",
".git/objects/ce/20c69c09e74795b033a6448e1b235cc4b5b00b": "dd567a4e9e59d970a49adb0824bd72e0",
".git/objects/d1/31bc5ac7b4c27be1cc7e6cd7a8eec29cd3d3c0": "399d7b04cdba0d1a96a8a70de539c3ee",
".git/objects/d3/efa7fd80d9d345a1ad0aaa2e690c38f65f4d4e": "610858a6464fa97567f7cce3b11d9508",
".git/objects/d4/8c04a0e4751bbe7ead0cfd0d0c76d3bc8e542e": "a1ae9a0f1bd008d9e92be0142ea8f6a2",
".git/objects/d5/3b50e3e796d998f509d3aae0ae85bf15c799a4": "5605b5561e22b500cef346e97d417f89",
".git/objects/d5/c9d3fb8b2ebee10be7d503d32243bf18f63be7": "dc22d10f8773c60721d9a451710c94aa",
".git/objects/d5/deb8586b5a65f270f33f812ffd84653a4cc7ce": "ea80f8645bd62af6f646cb420993a7c0",
".git/objects/d6/87434005ffb201b097c18a385276c1f8f53711": "f547091ea0c6651b9add797826c4b412",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/db/2d5427c44db02d2de840c70648d2e913164838": "c6a411982047fa041aaf65f710d5efa7",
".git/objects/db/4574090b7024952061fb536e69e157aba7a43b": "0cab2a09b6a45b2860dcccd71e4e5faf",
".git/objects/db/9db8d7d7fa578df8048fff49924293519ac17f": "07522da6cd6d980eb05eedbadda3c959",
".git/objects/e0/75265959430e43b4e1bbfa703bc4b818e12856": "ee1c445d7358a5b9f735c93b6a51c464",
".git/objects/e1/4d971955b46d7df4fac733090bba09fa28d018": "1c1ef501ef2a112d14212976e052fc02",
".git/objects/e2/196fa8d54b83aa26d8f6d0351a7eb17d9c3383": "e54742fca42fe30dc29f2eb0a653d325",
".git/objects/e4/716c5283e764f7840e81df2d7c3ea9c9abc110": "4eca51ce9216afeab0f864f71b0ffdd1",
".git/objects/e5/4e281d9033bf64ca1d5b25ecf10bf7967e68e9": "7f576d2027fa9a1383f6b1952e630199",
".git/objects/e5/cfe32a490997236d6a756c8aea88a85354358f": "f3d05bc68abd1df740a2b372624fcc7f",
".git/objects/e6/71b12cce420d0f0ab2db3fb705280f8cb54c38": "8584a09d8e1ca97ac0dcfda1e2ef378f",
".git/objects/e7/5e920f175da53dd6f04d858636baa25dc702f4": "0fd694d0b7477cee41611e70d0cd6732",
".git/objects/ea/8006224a26418f9ad68a1d42b5e359f630aeb2": "0e55a471a76d962c6415126fb72db61b",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ed/553da67e6c0245727be92eafd61a30576a266b": "631b45a7186b4c2f60d524d10d322b36",
".git/objects/f1/0135ef42209a23c245f784392196acde474257": "1535b8c19bfc02fa878dd30c41a44689",
".git/objects/f2/07bd50ae225f048ed8a38131e0a84abc4213cb": "7eef5e9527bb99e9e55760efd72dcc49",
".git/objects/f2/62987282d065ebe0e35ed4f816b7a231f4f1aa": "cc1b015fc5b2b64fca02bc665b8bfdfc",
".git/objects/f4/3158b9d3130ef85a6ea268c4521b54e17f94f9": "0fd7b31cd62cdf5c40956e884e08e8f8",
".git/objects/f5/bd1fc9192ef5430b18715e5f94256b90b79d39": "9d2bee8d30508b51da3ac8a5b1de6a02",
".git/objects/fb/23ec2b9e2aa0cd3fa4d770f87aa57e4d5d5ad4": "f94b7b44e49ee564375a280f5ef2e081",
".git/objects/fc/f9d113e3e7b4f2b1eee2ec74abb833339bc099": "a78172a8a04832ffd9f564e740caa2ac",
".git/objects/fe/d3fab32f8b679987ec173b4997c02f7118167a": "0fef25fca55f8f68caf67bd334095141",
".git/refs/heads/main": "a468b558f7606111e7fcf7a88a37bc71",
".git/refs/remotes/origin/main": "a468b558f7606111e7fcf7a88a37bc71",
".github/workflows/firebase-hosting-merge.yml": "86f961c0517f86ed90e44a0c50b0c0ce",
".github/workflows/firebase-hosting-pull-request.yml": "665307d939d6a09d21894161081a74cc",
"assets/AssetManifest.bin": "7dbc5055f104289f6149d128af8d7041",
"assets/AssetManifest.json": "e5ae8845b5e32e66707f2eb12a9e9ae0",
"assets/assets/add.png": "9ecd6b9d2b238da3123ea1424eea1277",
"assets/assets/add.svg": "18a36524f292be9d961bb91b22d3ac79",
"assets/assets/authImage.png": "74dcd0faa4137796fa9d4aac9ebb7123",
"assets/assets/club%2520icon.png": "653137be26030425b603d34e19a1ae27",
"assets/assets/data_usage.svg": "0bee1d612b0bbc6b58ee4a19b89f1f6f",
"assets/assets/download.svg": "b6f6985ab1d82ec3e3a71faf26ac36b0",
"assets/assets/fastfood.png": "0c659629ac9e31caa034dffd48eb6588",
"assets/assets/fastfood.svg": "17296b36151ea322af9377337c84eaa9",
"assets/assets/geass.png": "cc4e67ff5feb30c4caf6bb0c5e217646",
"assets/assets/qr_code.png": "9ccdcf369f1773ac459e2785f3a0a3bf",
"assets/assets/qr_code.svg": "29eebf89f339fbd731d689402cd7aef4",
"assets/assets/Restaurant%2520icon.png": "9844406f85da94e4e5dddb5370aea2a3",
"assets/assets/restaurant.png": "3f29fbb8b1d65e984cd7a7103350e8cc",
"assets/assets/restaurant.svg": "d5b8fb2d3228e3bc78fc1b864c3d7f00",
"assets/assets/Small%2520with%2520Black%2520BG.png": "e76afe768effcf0c1ab13e03cd32bc30",
"assets/assets/Smallwith%2520White%2520BG.png": "85cadb1052a077a5f1c00b034ecd647e",
"assets/assets/Splash.png": "3f66a2c4f9183faf0820d8d12cff8302",
"assets/assets/vain_icon_png.png": "0de6c0ec3034224351818f6b870f05cf",
"assets/assets/Vector.png": "347d69ee7693f9b7fe990a75b35d3a5a",
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
"index.html": "a45feb5391e2d30ce3404a3d78804036",
"/": "a45feb5391e2d30ce3404a3d78804036",
"main.dart.js": "53e12060d6582161be012f4bf5c92ddd",
"manifest.json": "85762cede2556a524566057c61206351",
"splash/img/dark-1x.png": "788cee16ffbe158893a46dad54d54a44",
"splash/img/dark-2x.png": "63ac3bd74cf877e39a9aa38ced448d35",
"splash/img/dark-3x.png": "dbf6b612ab85374b203775cd134dc65b",
"splash/img/dark-4x.png": "bb461c346178b34ed9918441da59097f",
"splash/img/light-1x.png": "788cee16ffbe158893a46dad54d54a44",
"splash/img/light-2x.png": "63ac3bd74cf877e39a9aa38ced448d35",
"splash/img/light-3x.png": "dbf6b612ab85374b203775cd134dc65b",
"splash/img/light-4x.png": "bb461c346178b34ed9918441da59097f",
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
