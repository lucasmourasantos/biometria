-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 23-Mar-2019 às 16:28
-- Versão do servidor: 10.1.37-MariaDB
-- versão do PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fingerprint`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `evento`
--

CREATE TABLE `evento` (
  `id` int(10) UNSIGNED NOT NULL,
  `instituicao_id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `palestrante` varchar(255) DEFAULT NULL,
  `ch` int(10) UNSIGNED DEFAULT NULL,
  `ch_min` int(10) UNSIGNED DEFAULT NULL,
  `inicio` varchar(10) DEFAULT NULL,
  `fim` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `evento`
--

INSERT INTO `evento` (`id`, `instituicao_id`, `nome`, `palestrante`, `ch`, `ch_min`, `inicio`, `fim`) VALUES
(1, 1, 'Cloud Computing', 'João Paulo da Silva', 20, 15, '10/01/2019', '13/01/2019'),
(2, 2, 'NodeJS', 'José', 1, 1, '11/11/1111', '11/11/1111');

-- --------------------------------------------------------

--
-- Estrutura da tabela `instituicao`
--

CREATE TABLE `instituicao` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `instituicao`
--

INSERT INTO `instituicao` (`id`, `nome`) VALUES
(1, 'IFPI Campus de Picos'),
(2, 'Rsá'),
(3, 'UFPI'),
(4, 'UESPI');

-- --------------------------------------------------------

--
-- Estrutura da tabela `participante`
--

CREATE TABLE `participante` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sexo` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `rg` int(11) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `data_nasc` varchar(10) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `rua` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `bairro` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `cidade` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `estado` varchar(2) CHARACTER SET utf8 DEFAULT NULL,
  `f1` blob,
  `fone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `participante`
--

INSERT INTO `participante` (`id`, `username`, `sexo`, `rg`, `cpf`, `data_nasc`, `cep`, `rua`, `bairro`, `cidade`, `estado`, `f1`, `fone`) VALUES
(1, 'Lucas de Moura Santos', 'Masculino', NULL, '046.028.433-95', NULL, NULL, NULL, NULL, NULL, NULL, 0x00f86c01c82ae3735cc0413709ab7170a41455974067ff07bcdb8b3a925003cf6ac86a93566ea3c9c57b186c7d7765587ac8cb1b885c106baa3fdc3f9a93fa89a88e462d0aa3c7f3352f0fa12bab404b094c4d21c679192d2d57c6f305dfdd11638bf95b9250b98f875e0b92545607bd8aedcf64fbf4fadfa902f3a00abb656c37fcff5668247eff15192822db55dcfc00cf1fbb912b95861134d87031c7991cf784dff0cea9720165241a4ec9f8e201c785d1ec9126d520212b162eafac9de0059524d1c94213274b0b9d1937a2c099ff5c3c13d2ca6e780ec112ad61523bc436ea1d06c92db068abb60f222f5dd013db748380287ad7a9e0d42fc6088bb14812d95ef538b3938b63f718c44c2a712ee2c7ae40f455a086b445197461ceb3d45d7e0ab9e0b72297ad3a019752d3bdc1d7c0fcd35650c214b53a81e4f588f9efa745e68f2fc046e64fd33f82cc072d783f1d14314d0e2f08a65c8479e5255273e49bad497b10b79a7f4b99c522212de56f00f87601c82ae3735cc0413709ab7170a2145597f0ef2eaeb2ec56dc4e793080099956f697b454416f05682f6206a6dfb61d589acaccb9d34fdcb081698f4bd087d8b56ffbcd07d5686126b7e31df5656c38e0cc019ac369e75663f17738d63c2cc72daf23be99f0d28ce9e390548b80996fbf977cc47271cf795d0bc9b08858940c328da0183547901c30e5a418382f008f595b94f64a2932a177f5d8c292b45bc645757b9f7babd719f76939b841314a0d3f8f5fffd28ecef4769fa615b0c43939639597a3d59f0095cc91018eb49ee2a97724ba2d86a3efc4298a97162b4d421c52906d454a36976a10488cba6538bfe22b332dce1a575656d6e2da5462b3f490f8425fca1112559abae0985da0a5fbb3907b07acefa5707bfb02cd52cb42889a6062f6ea7042a1a37b6e217707599317975a43f4e0a3bd87d6bd6336cdb9898c0c315dacae7d5529451d813d081a45b50ce230670a42bddca55aac5a9af482b31f66e77b4d3b1f2d7f5fdbae7bbe0885143d94fb61fe6c896f00f88101c82ae3735cc0413709ab71f0b61455979f11d713450c2e4cd4a37738bd1be85fb57a11a8b238fb06034f729d6a352fcded8a8351c3512c4a666b0e4b70001612fbcba5b00bf85b0c6c3c6355768153fe3bc743754e1901730e4b2ae09b2da934cd1119717b0691990aad1bd57da4d2e8642b599c3a69f63e00c553c1cd9f1a81e09f2343bab003abbe0c515e73683703c51783aa7aa86ed7576951175142b4427d1366f9c4f44d06598bd7f628d8594e51dc4a27464cf8b2e81f0af21e182c32536987069acf5150320290ceede9f41393744d211a04d316883ecd5deabcf6941d10a6f6e6d643ed655a79b5cec092a1f091e09caf9529b2373b3f483b8f6dfc94867f7808819120f55a36df157e747e8c91fb28e773a2a3cfc3e3924fb2ce71ca44d63db9e3ab2adfb3a32a9509b21ad1e5670c53979831adc88381905fc5547ecd09fa91193d51049b9ae07332bad5914551652380d50f06d8341972597410d2123282760eebc19fbc839be8a7143714d045782b92ad33059ef76b62344e91776f00e87f01c82ae3735cc0413709ab7170af14559705a96744ff3b21dcf19107242de40e006d892a6206dc2c21df70f317a541de9e7d5f2a8e7c8d550c02f71b743a618fee13782ee51749be9f338db34ff1f151afd0ff5326ea18937adef1d3451c0357d69436149980c9eabc5292e1499f9dc858e7c38312e8429a7d751a7d5c5c104332ac16d293a7994ec25b30c4c0dc32067e7a0eeb8c87000517ab769f4fcb421f026ea0f45a6bbde076a7bde0a64742e7f103f4ba7f557c5935e5c8865dd683694f0ffcc8785fb50eb4d0e93a2429e8efa4ee095c95c0e0636147b6b8eed1498701363907f3d6b80cc5b22e2e8e761924d377de0871423f48e6da5d45b212d4be442758c204b5a8ecc161a6118f6814a11e5c836cc521aa958099386051aa895396941f89b324a55f6f40627bda788c40398ca3cf8e52badd60279fa5e8b0bfc7600636b804fd1b567e470fd197ba2200a6c6eefec3c33588324631870c298c7a5a01a09bc050f862221f5a0ddb093c592e429d616c338a25f0414cae357c98976f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, NULL),
(2, 'Quilherme', 'Masculino', NULL, '111.111.111-11', NULL, NULL, NULL, NULL, NULL, NULL, 0x00f86701c82ae3735cc0413709ab71f08f145597ab08d2db91a32c575bf615615586985cfa75c10250a3fa550a9cb2a55af9c2b33412baa02a55d38a204f7cb97e8ab841c850e029874c75acdb74eebddb7460c325ff452245a1897cbcb0651e198d31b03e8294378341f6cd8eef62f247280253a094ea20baa5a49aa176f5c29860e0dc417d5373cd64ec64740f8213a1cfa37a579e81571eae5a1143f1c8fbca85b8c3f1135e848d9aaae12943b1d00a0c1a707959a72ce4b09662fddb5ddb68c65eecef4771686839a3ef1e1f44b2a4692b4b788b0ac1d7451d5663f5a9299dc1a54ca643160c821218c644543cea0587f033ec5d580552cbbcdd86a5fe0a8360c4447cd3b04bdecf1d5e141aa98d856a6dd35a8c5f8e7454a0957f9db816038050a8a2c5757dc0cbaab3b7bb8ba02d80763ee47eb06aafcd7546fbfdfb5b00eb8a9522623fa3d82f92bf1bfdfe81bc68034b6009437b0a58f1609fdf7af5376c89d9901bbe614d8e686f00f87601c82ae3735cc0413709ab7170f51455976d58e297ea996d1f66637b6f649380f8b55f4f3b9b8a0de8e7f1891bd95b641b78098ccfa27e5648d00cb0c4e9c74f0f28ec677a4132138c895f981b277289a3c3d8e3c3129c51715857f4099ef1cc78323fd6247d137966072899b312605317d46e870d6cda1c9c0bf49ae74b5fb10f97ff3bfebd52c66ac36c6efb213325e710f94421a99d45a39e459207ef4b4e1513152107ec8174311576f8eafd7db3cc49cc45dcdcd9bdceb4b592c481acc42b17adb38468b56523e27affa6d482965c5624283e06b21abfb1c7d4f8f113bc8ab7b6f0e8b87b4f70b67daf4e515ad5796d56de2b78b7ea9c2e71e0cd9eb014874e5a9bbc490774b7cfcd9780c65efde78f8c5d81ed8733f5b60554324c498cbd5f80aa725a457e5528e5619e7f430e6889705c2faebb4693b100d846addb6735eb29b18518b3c6a65db6c14f8eca9e2d536ebb7e848e1625e60e6314e237c0cac34eaa530f2bb8a273ff9b56aa06ecd0274794ef632b6f00f87f01c82ae3735cc0413709ab71f08d1455970feb3d91ac08aa1831aed93282f76f3ed2e515bb5d0b1be6270889f1a1b1939f242fc32bd7a28f4a0f7f7b129cd90bae82ca179c7b41c0e99fce43572daf73f58addd871ce0e64294fb36d494a5cecf017aa16e265b44a0f542a6a7aec9e4561f990bb11d23ae442ecebe29f8d5287a729ccbad0a368a5d127822158405c7c68f9c5f616c15daaa415ab07d1689fa8f6929569a068cd1fbdfa4115e5a8e08a3c7570df0e433df3e92d60af86c79ca6bcb1ede7c4aa39f44a08251d1de860f4c6e3b4b5011c3e762cc068d87dfe919a552aaead22aa99cd29f1cf96c12f1aac57339e97f659f951004ecb4d5a70052068702adfa038ec8e744ceb5fd46399129ee1a4260cc3ee0be394f28ca6838d8bf1bbbb03d9b8aa2a1b1067fa4629c88edb86623a7f656cf55239df53370edea9709d06627834f7ed99931f8306357f69241a562416eb11b1aabaef5ae5c25f7006dbaea641a06774268860267c8030732b88ca5c0e6d795110fa214194c7c2ef6f00e87e01c82ae3735cc0413709ab71308c14559799e14c37171b7a16501c516e459bd45f034d3cda325a408abecfeb6e77d90a2ba866a939577cf6e34bc9e48c28f97e444027bece16a6977b45324df24dea75b26764ec63bf1b68071c99adecdd7200be6fe0bf92f8d58975e13104b1e73f2a4a123e6f08a55d5c9596dab88bf7076f24cac9212c997d37f6b04dd237da660bffee896f57e558f29edd1ad1166969cd55233181c3e3ac3ec539f6f8722f2041ee8d5364f9d54814e78afe80e340cdf0a494dd9eff0e958b0bc9a8afe03c6e16d6c167d1a6761854bf668e93b2114a3eec7fdd450eb3d8c4dbebd21969b134ca354d3747b29e9d9e479f7f95085f83f8db0629d1433a44f7a389409d1fbf58b5a6a5179cc6e727a4cb6d4490070f122feb8fd8869443d457e4a79a7b323b22f2bd7f06e76614ad31ad604e31c6a588901a3ccb53a93cb1fcbcdaf9251dcfc3e4e121530bbb80bcc57f9d09894669d3958d20317369929d32fa48c49375e895155f811c08a9b89a28aa12fcdc31bcc16f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, NULL),
(3, 'João', 'Masculino', NULL, '222.222.222-22', NULL, NULL, NULL, NULL, NULL, NULL, 0x00f82d01c82ae3735cc0413709ab71b08b145597e80cf8f6122de0ce5239c040f303662e0693bda79fb2387380d2d636654db179863fa8912c316f4dfc17d627e4c674b2d39f3e597462826dc16065b2191cb15223e9868b8963ddbb7d99fbd7af26d6cb62edaafce775f94d322b3269c79553d892fe59809591b69110bcd7030eacd546ff09835cbc814a2e7357dd81fd04b77efadb5e035abb09324262ed5392a75092497695e34ac7cdd24170738d030a11494d33b899f20b5c2080297dc76e25b3e27c65bd189c82ccb230aa536ff681e8dd7440831581a1483cdf2fd0f3b62add3d568de2faac3582539347dad4047eaba423edf93bd538a959b047cb7d6c7fa567e140818394bfa442105887a0586ff3fb9d1a557a41a16fc62f40c5499da534089f8defcf28a24fe1b9ebbbb2276f00f82e01c82ae3735cc0413709ab7130e61455974ce5e300ccdba4c8ddaa85b47ee64d0d4d65da186e45833379a5790d521a399d08fb9a2aa9dbc44c7e4131d79c3a8d2fde611484ffeee4ac8f734374ccf3ee32a9fd30892e7f44f7d51f425b7dd092d2fb72589b575858c18afd30034f77872954bb6226dfc6c63de541ace5507708c84be54e68b741e307095a68c0052e191586dc859a715ac547ba34b8ae18b79ce2945da5e8a2edd02b136cee2dca0d1b5362f4eb209df0b75560fa5fa3919fb81962b8b257248e3c89e9d68dd6566f8ff25cb9bfd02115a3e7e63c3b6ad8d772fa97ac066a274cd7c70fcbca8bd85447ff4582e519e0792019d160ba0000428071e022b9193b51345039309a354e89cc7c9040818b78dcde1f3ab6f91cc9821480791a7e5ee7e7b1847abb6e6f09036f00f81b01c82ae3735cc0413709ab71b0fd145597dac43619b441899cfd715278fa8c3dbd4a7375053e7bbbfdc866ac54223c407cd6ba79e2bfd78fed559f0ca631b897332eed233b5921921d73a47e0c0f86c39ba5124cfbe3df9f703798e2116ab54dff9079fe29a226f0f79b00115bd16b5671901bff62f5b1a1b0b17a3eeb6fe3dc52371b33f44bd527e3ac9d48ab6b2680f5ae2a388320c4dde45e1da2397a7fa8af453542448308f85c095e2afea8cabe94c5360c6202557a7531d27409fbd5ea0fbc7493a6e9d4b26630433899c4789d1727dbf8c21d85efae281f43845dc5962bdc53e2f9428877c37796253081254f45a01d7c17ce84765c6db26f34c064a68becb4ae10c68a66217ff2ad8f8acd3831ed868a1f9adb5ec3426ce76f00e83001c82ae3735cc0413709ab71f0961455976e77f3dfb66bf02591919aec22fc9c37b0e313b8096e7115e962553436c6db6fe5c3ac913183968464c9bcbb42f4b64cef9b41e692149163ea8cf85d2d437df495dec9e298d2c5411f88403904fdc4a577133daf80d4489c9220488d0b13c0f90d7e77adc7b00d6dfa864d7a427aba364fef4d366c8cb5b62800f1bd97d318020fb23e34e0d7e8d060b7d7683a745e548663d28a14380c1ca39fee66c08510faaee8f4417bae919e370ff4652e443efacbc3e365dcf64d62ca06ae8e80e98d70ad886562e37ad77966813b468d322f1139e89c443f0fed326a93df2f9f88159b81acedc138597fcd0f00abf9961982636c94f7ff421a357e8adc589576bb633c81de2a7ec6031ad50405e9c6dcb1c7248dd6212af2772895f2293a29496abdd66f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, NULL),
(4, 'Tiago', 'Masculino', NULL, '333.333.333-33', NULL, NULL, NULL, NULL, NULL, NULL, 0x00f85801c82ae3735cc0413709ab71708d1455975558e94aabcc0f05fc7c55db11a8cc15335fbd84f9dda9a3432cce6745b26fa1ede66368c1906d5ec1dd4dbf1fcb6a70f9b7223ae86a3f4ee8f9dbc954b8700de650b6451a8f4ea550ce23d8565886a8da2c1f5ab652cbf85ae294b222fabfb59e9cb6487ab27ada12ec5cc2a6aa86c1fdc2b654e28fc3f976e1f59d4bfdd3f8533dc9dc832da4839ac3da198e508544505e874ae89dea08687b62b5cef460a1b901a7a500cea9b9dc282b7c7ba367dcfaf34dc9b3bc96d227ca0fb9d0eab588c9e02ba17230a5bb771449e826760618c8ef7f8dee473279619472fb5d1da89c956ec9d4d0b7ad7a0cf8d915e33bf4ea14e68e3ed41783a7a53be427814030c970fa26171c7d1b6b900b4902b3aa0597f6fd68979c2179043afd589e521c34dc5db0d97cd906250d110d5eca51520e6b297ba6be6f5c9f8f2326a409ba73372a13941ebfaba330506f00f84601c82ae3735cc04129a0b9fbc02c1350a13045033831eba791ac19dec5d2c417dbe0033c03b79b8c3564d66e6ee13a4ed9be75c8a3126759d79c2b4d18985bba1cceb3d7407936e3a17ead74ef13c9a73ac7af59c81df09d377b7b7a7973225213853a0f7a3d5a9d26539fadf984978a6000aff58157c5e44c9c3a7cc29e6b9f1780a0205a44c0d1fcf83046377de5073343c230e20356be1aeefd706a98c8af3d7e09687e96429752d410aa32d0d11292c09edfb264b519d7e3936a472657464291ae275af3a578f7b4453534dd89c554c177940dce4ae4439070295a9fb2a9973ea64d69ac92507d5d8da78207840688e7e13e67ff56ab5d0df7f8efbfbfaff42e37f94c47e620da90214923b1f8dbb4e7f18300e3837afa8289605c115d4a345f631a46df59d5828fd6453f4fae6d85776e962a5697b6199a1f6a219cf0716589e8e8bf2dd56f00f84101c82ae3735cc0413709ab7170ff1455974de8db219a2b605dab92b1645a64dbc8bc632bf8100cd31fa3a23eb9f7f918badbe04298853835b455036aaa4a1c0535d3eb60b705b14ef24e166923b6ebcb5e0a35a68b03561899cd512f9ddb35da052196502b3f1394469a8bec5b79d749bcde5d262b9c2e3aa9d2c7e92770a46fdcb54c221b8520618e41da3255b8dd5f83f6100ae750f982e385dbe4e0436b69564801c42ca909a70731e1797f0ccd077179231a36a8b2dbc01f75c549598d7dbf71ef88d1f6e68e59530cc8f6abec962aacfe319cb45135cdd88e852ee3613b258f54f15788cd3d1224f999a7d44614642df325858a84de77b3ddd065bf74372d1c71dc8f6da6f413cb26ba6f9eedf7b937ad41a7b87822578f7a314adaf73f999891cb0bc0797e6b7f30c6d3ddb121012dd4a3d5dc61cce9f407a8cd484a9ed76b6f00e85e01c82ae3735cc0413709ab7130e21455979e232a0bb570e41e563314f4636fdac0dceba1d8fba3f5eed7646c518eaebfcc31358ce0d49ad03f3766296e7c4acbb1be3c1a0b024521a74425f25164bc365a9b4cd3fde9dcccfbf052d8cffb9dc6fc2a18906adc780f42f8b59fcd74bff8f9ac2a94439c894b8a41b874217ce6c9386fb9b83ae09d547ea7da702f0ebb17dca4c305e56f45d5559e9e1512876499b8bc63d5dff35e3bf803596e0eb6810b457c8e2dbae28ae0dae7f5686ea86ded0d208e89accd804f4877819859e0dfb00a918a357de052e1de0a5908fdf8041b84b214273895829a5e37d7bbc5249f9cdb681b8e0189c7252b8c14121dfd75b1ee32377e1e5252f2940f4ed68d0469ceade89b0ed343aaf12df04aadd7c1f65042fa0f87c36dbc484893f5bcab7c064db861260229796f7bc5fd05b45c24541d799e7b914459d4606563cbdaddbecda4d9406ffe8700ef7a3d8edf351b2f8b6f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, NULL),
(5, 'Ana', 'Feminino', NULL, '444.444.444-44', NULL, NULL, NULL, NULL, NULL, NULL, 0x00f86401c82ae3735cc0413709ab7170e0145597c377dfc7d01f05c57b50fbb4f14b7ca87fbde80aa6363c3e9ed87394d1e3c6406e023562b795a629860601ef8cfe9e84ee6d03cfa58ec2c38e167bdad39c0c0a96d5a20ab86b428fa400dfc2743dc7006cc0f20207e2538b3b1e8c554cabd1e7a63dee25a78cd2543a23a721758a51ad7bfc919bbc96ef15fbe152f4961447754680b440260950bdca117994005890a507e87833b407a60e0e2a49a5db80d3056f858cc5e58b72f053753f06e7bbbcf05f16a3659f4dac888adca070d9f7d8dea197a120ee1e14351f0dbc6be759f9dac0e6dfc14ec0a6148163dc34e655ecc319d12a35020d04dcc46c3264ab6c31214ab7e71aeb2531f0e584d7d140fc12464718244761051fbd2fd659781a4c2c143c7a5ef0d9a764ff26bb4ede5fb568f3b7b886573732b51693f6cef48f1e136a4335d9e9d90735b0e24dc5c7dffb86310d90e250afc6db59c7dd61bd050d7ee0e5fe31e46f00f84801c82ae3735cc0413709ab71b0d11455970e88998579de432e3f2cad7fa211bb4d2106be257cb9cba9de7fe2166476544c46b5da6348101a707e60388f26f90d13baafd48b41614d6faf66d068488a76900ec882c07e84b033b6330e4eea49b1def4243cbb936fc242eb2abcd51bf436b666bd596d63639391ae9346630d77ba52c6ef23d87e49f1d4a74c1ccd5b767f3180e6cd40bc3f293767d60aab28ac849839f46b3d6ad04cb593adef306d3036cc32eac06605745316e8bce42e883836e7cbfe85ab9361283b0522c491f869952a2eca1398031a50e7f07a9d6ea6ea7c78a3fe129c3cfac176d6b1274e82d251e44830b213085f909d113e831e403fc559737e2824b8d39bbe02eb67265d67f76a7e99a91c914a66f56d5bf38ba97d76e3e6ba537d7bfdbc286bb62c164225799d1b1c6d3b9fa1e91c5540be36a64bda12156f9f25d58f64d76f00f83801c82ae3735cc0413709ab71f0eb145597ee7fe2a14a6a3c226b8833e947ac8005ffa3f7634796e94ffcd9d3a25e4231307d0756da5f063dc39c1d26ed4e7c6a90830fc83a1a8e99c59bde55f0a827ea338e2c5246f89c70b82dc2f0ace56ed82a8715cb8e1f22ea7dce3ba0cab7df724b8373c24c5b59440b740bf85c1ad74e921a3044addcbe647a49b07974fa777334c9b1671e74a74e09ac34f075463c2de41922d691363ff23412d92716fca70f0f8c079899d2873193242284e202b78aa1a8411a221b02086d9097a85819050d215aa5cfa95882934b695046a847c2ace66c01615ae62b142e6e03f2371e4b3ac08fc1a1d9949de8f6750b85484c1f56b27ac75f0aa60b280afb2f83cea26e1b2d5c931463e3d960153a96dd465e0ca668693c66e36407b4e2035601249d1482e53a4eb243ae5a7dbe6f00e84e01c82ae3735cc0413709ab71b0d31455973de7cee8df70928fabe61a7b21d88ac6197be3438b54067976d1762516ecac64e114653def3b5f500e044492c6a53403d2b5eb1dacec4617efc849b7770dda505c077058042c49a4efc4dcfe8d7a8ee79ba9b4b2193139ffb00d65a1a284650766f16b7aa294c4b90b2476a5ef73e88125758a80724c2fd0b2960395bcc34c31175bb5cad70ac203309ca95b1647ccbafcf8fe338f08351fe0aadeedc4530b0cb1d32d4abef30199a9674144ccb8d2f4018638c2283f6c3b518e39b9a8c1e37b13fb2fcc91e0f33e4569d536cb12d3a1725067cf7cedf4ae1e848518f31018da19ee775b5756a775b256e3745a21d86a2b2b17120ceccba7585d24b6c397aa04dea606d69a0e26e9db2d4b388cc9280e11c285182efe74463f3289896e065c55951703f6406501e480ca5fd0cb612cb92ffc39e56adcdab73dcf7ad32a016f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, NULL),
(6, 'José', 'Masculino', NULL, '999.999.999-99', NULL, NULL, NULL, NULL, NULL, NULL, 0x00f87f01c82ae3735cc0413709ab71f0bf1455975800af20bedb0e93c638bee24542e9dd1066eb868a81001692db1ca2d14191d8311bb30ea6ea97efc69755feb145bf706701cd93a1237ffbd010d794a156246dc801dd44a26daf09cf75d77e82c46c7b7bd1f8ce650555669df65a927018fbbb9ccbd9632d2e5ee805381b725a269cbf5c2dee57ee912d008231c2495fe6e22ccea60de29664d6d0cccbef0a6b1be720c38bf74aa67995fe416770806f71192655c3b8453c1d2c848c022a148c1fd7701380ca065888129bd3e6c874caa1c009ea0d64d99e1472303704012e73ecfb80f81366fb7d6401fe04702e4ddd5e70f768e16c1486fb1cad965930a49d801ad22a89d5fd4405cb658542d0f7c7b73c481598da15e10cff761db21798d400cd6aabe42d2ddbb56e9c17337f4cfc311897158a58511f3e14f390b8f40ee674db9437834a9134b66da5872ee9a56c5a0d7cb9a2d088a96c035067bb1a0da5025b4438123d8b39ac90dbbf9bbf65d2103ccfdddf3b13a0fa51a5b6766738ae5e2c6f00f87f01c82ae3735cc0413709ab7130b61455979296f49085970978e4b4702e18a6c4df803feebb7b4139c47f242b1dbac9fdb1bf06beda8ba94e470d958fe6b31c26225df7b9139fff5180291d90b7bd9f5459ea3158d00d29998adb9a65a24a402183ed2d2c9948fc7979d50cc085cddaa6d27d3c9e7faade081df029581462d021f5975870ba5a9158b25c76e655e2a877aa8b1f9fe484ee39775b2a0f5e421190f465f55e50e69131975dd9198885b11fdbe11b649beac9b5bb94030c82e9669277cab72521453f12bf3d3dd2c0d12ca67dba1af452e512f67a8b1e34957194416117a91224bd14a1bc2e2d7758a63437bace21a3510009b07b9a84e5115561cbe83cbc395d1bc714d80fcbbe5d62aa772b0d9fec560e151a61301bace0740d1a6033fb6371ec0e3403c9c8502a63e68fb096e8d76fc926e7ecf9c545eb300f47118df585af447f4da9e1d130b7d709bae8e8f873d3a14740e81c41f49959b3b064ac77fd0ca2e0ebade364a93f1ee2e827cc9309e54bc9b2f75f37dec48416846f00f88001c82ae3735cc0413709ab7130ad145597181b69e5de14f5377598a80db8428ceb062425ab28947091b25d5841f466e7821a4a7c05278c97566495861c9d11f3a8e6f5143773bd93d11333074cfa9fc0d27f659a51e9e81c6d490b2ef5a3f6f24a291f09b85604fc325013b4adc14feec00d0c4bdc7b219ae55ed1e333c5af3de3a8766a19fc18fc1aa6af9ab74084235ea631d5a4ce0fc0d6ba714cf24084b62098cff97114319295e9896b152140c740e091e06509ebf1db264e46015c59be5b7f6b06d65bbeb33e31b8aed87f01217931ae9b43775519e7f3081237a2186edee5249654ff3dfd55db2a7ac7c9adc0d4e1be736b0ad4f770fe280dac24187750ee1e31e18f3f5c7f767d7a76a4404f0f8b3a2b756b27fbdd6b9ea020b8f207bd520678ba8287abb8d9fab18009d0c0ddd98b9dac894cebdd0ea91450510597a88899d23a09e007c7200d316a018e635533e859f051726c76bc6b8fc7cc4cb3f22e39e9292cb03a34c8d0bb745aba4603ed194af71812c9b85fc15da8eab86e816f00e85d01c82ae3735cc0413709ab71f0aa145597a19c6aa7f009c6e0c2396a468db5b21045a63837932455a128793cdaabba7da108fccc713abe1ed4a60c30b74509a14be564f8af0b170787556ba8711eab283693cae614d50e5a165b5fc79b37f60f8384bfc23373ea69035076a47c4ff7d73beb0561d3fa4ae7b0e3448fd5b0b2b541e0d2cb085a6009d6a5c23548ad72465c44038178caec8984ad091ff84d72139f75b40771c3c820eff0b1fe2a01b19edb3b672c144b9533f01175d1e93e8a629018ca81b8e1a76935986a5739d9d079579e206489e2160c3e15ba60e41e54163351ef9690d407bb5a12adbaafedc6f2371674b0e72a8add344cb3b5699fa088270003e85be887b685d25ee5273ba3c4720c6527e4ec8ec17fac1d7bd767f04201662d7f6cf9f711e5e1e9233b0d3ff928e1f7614491b9177843cabf3f8dc7bd27c162c0f472f76da3fab79f34276272ea20fbcf34f61084ed02624ee6aa6f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, NULL),
(7, 'JP', 'Masculino', NULL, '111.111.111-11', NULL, NULL, NULL, NULL, NULL, NULL, 0x00f88101c82ae3735cc0413709ab71308814559793f8fb8245255a129a4ccb5352ccf177e63df2ceb84cd19ac75c0d0b9d67e59f66dfc20158ff4a773ccb44a669ad1dfb46f94cb8e24ff2aea7ea500a1bdebc0333b123bb17b69e0c7fe9d4424217a21cb2d0fe4d1b59e9b688163b675d7e5dd8bbda7d1fcc20a35dd0c66f35f9bcafbff467194c9d8f5df8e133c3d67e925df80835907f5567cc3631be925dfd25eccb5214d22061e0d2a5639fd47171f5122bf4ec43b8409d190a98aa6bdb31696917b2166dc4676dfc523b9604be263e4e832f7709aa3f2a6492b1972e29b26d8c180f04e4ab5d6d90148d8376d2a9edde5005fd92b7e08c3b55a3c103a252c3c3ae74b99a12a3bd1c1e7582ec8bf3755a96d85c8825e28d32798f7c9b938ea40ad66c7ec4bb955e097ce250eff2caa682b65adf9b60b586cfba8617b83f76a3f3fb746feb7f508a8982863c7fb2ca5622865b46e301972631d49bf5a299fc98ed52d932b20c065fbfd175ccefdf0c09663854dfdf8a5fb58fa1558e4c800888b1d1996f00f88001c82ae3735cc0413709ab7170fa14559701336ba6a51d88775b60274ff91e7df8832a3a57e669af3823b4e55a9b7a587f7d51439f2e9a7c282d7a0ebe9f550cc953f70d8506b267bf0e4ad1eeeff8d548d698fc822026bd8a4b1e288d1ac8c5575bb832ca715dd24217f0f83f647acd9cc392b42324619a930ac9c178946ba439560bec3cf1ab11159485ef58ed8b3402c249854de396f881ad305f96202ca21d205b9022d9f6e84ccdf24f2cca8b12c825b475ef45d84babb762d1556dab1641e26f2041194a63cc9ec6b9fa414f89e36f31cbd385a49dc6ce60d956475d4db51059cc5570e9047b5a291f8181b851fe985de5c22eb4b1f5539085084fa8090c69146549ea2a3a5f16cd70ad7702c8a485d7c98cfa78d72b46a389ed7308049fd21a3edff558ee1cbe358e79570d629ce1301c45503a1376d7a90d3c5f497d43e7cbf080f373fd4efaf3325d148d7aeb57d04ee40cb4e6ae422b885cd9de717eefdd247295abfa12c03415ea32ca85bb1c651b87f5d3d0ff7a468ba8d79d28966f00f88101c82ae3735cc0413709ab7170ff1455975ce3ea785b2e4eee5c931d0e06e286f4b18296aefeadb0bdf3d239238eedd188697ad4fdfafba1410b02fbb69db02ff32c434f42770180ecd79f9e48d258b185f4e2930a1f5fbcd559a045754ac5527ee7c7a2404ec5a2716c24806eb9303e5ac9494421e065c455981600ddd2e7d777f1f396f57f998fc475992f64772c2c770179c20209b9befc1803aa0f43ec7f0d93a5d749cd239d316c223445900d4b87d02c122f198b7f94ea81dddd898b4ee6e96c340d97e3e85fe322f21ccf2129a763ded1e2d67cf555b78756d0d0290b7680658f928a0879016d99d08455f1e1f23d854e504e456fc0ef1d62118f4ccfbd7face69c6c932175352f665f7c91a4213faad362dfe215e3df5c36cd11fcf86a96f02606b4931ea73ecc8b8bf0e23b709da7034f414fa29dcbbf9789cd692374ac0fbc8276c1e4b818e2511214c3bba0f24a7558f24bf71a1aba7ddcc0bd1fc402f1e976b05d8331e26ef2c02556e8de5fbeba609d346e74596dc35689543ef9f06f00e88101c82ae3735cc0413709ab71309a1455972a5bd39f9cb3b5e15322cd30af2ed6fb234239eddb96436b0cd670ba05cced2b8cc016eea2945cadf2d225b511a6c9761dfdf2c57b3af8f5f31d13569191f394706f61104a1db60583169fe6748cdd7b203c1b387b1d0eee50f83a02f0f12914c8794796e743e0fd11486cd10b4990ae087118d30dbd0684f93c9adec8d316a4937a830e3e33d95f81d42912e60a59f88ce26e6eacfa532e2f4e488536202264304fd075b09d173ae0f4a0f8e56c1ea1815c7b5acf23b9c316263d09c6dcd2bda5382e7755259946a525a50488a0e5dcd10744df09480b7d2be921465beab37c359085c5778aa4c7158af0dcd2148d510978728c1d7da4fad427cd8c765dbbb6014c1579bfb27b5d246d006003e528f82a4af5989b45c0d68be83e2c647d8b651ca1a631da29afa3a827a79204d7a2291895aa8c19fb973ea3acc6e266db1c8e30154a9bbbee3cb20fcd4f64f5972d65b2316b0ea3cfd2d13806837c1fe1c8e9f6af6b9b447ac61e226ce5fe81de3f4fac6f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, NULL),
(8, 'Caique', 'Feminino', 3035388, '04602843395', '11/11/2011', '64603030', 'Avenida Frei DamiÃ£o', 'Belo Norte', 'Picos', '', '', '2147483647'),
(9, 'Lucas', 'Masculuno', 3035388, '04602843395', '11/11/2011', '64603030', 'Avenida Frei DamiÃ£o', 'Belo Norte', 'Picos', '', '', '2147483647'),
(10, 'Lucas de Moura Santos', 'Masculino', 3035388, '04602843395', '11/11/2011', '64603030', 'Avenida Frei DamiÃ£o', 'Belo Norte', 'Picos', 'PI', '', '2147483647'),
(11, 'Teste', 'Masculino', 3035388, '04602843395', '11/11/2011', '64603030', 'Avenida Frei DamiÃ£o', 'Belo Norte', 'Picos', 'PI', '', '(89) 98808-12'),
(12, 'Caique', '', 0, '', '', '', '', '', '', '', '', '(89) 98808-121'),
(13, 'Teste', '', 0, '', '', '', '', '', '', '', '', '(89) 98808-1210'),
(14, 'Caique', 'Feminino', 3035388, '04602843395', '11/11/2011', '64603030', 'Avenida Frei DamiÃ£o', 'Belo Norte', 'Picos', 'PI', '', '(89) 98808-1210');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ponto`
--

CREATE TABLE `ponto` (
  `id` int(10) UNSIGNED NOT NULL,
  `participante_id` int(10) UNSIGNED NOT NULL,
  `data` varchar(10) DEFAULT NULL,
  `hora_entrada` varchar(10) DEFAULT NULL,
  `hora_saida` varchar(10) DEFAULT NULL,
  `saldo_horas` int(10) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `ponto`
--

INSERT INTO `ponto` (`id`, `participante_id`, `data`, `hora_entrada`, `hora_saida`, `saldo_horas`, `flag`) VALUES
(103, 2, '15/01/2019', '12:49', '18:17', 242, 0),
(120, 1, '18/01/2019', '10:32', '18:04', 1, 0),
(121, 1, '18/01/2019', '10:34', '18:04', 1, 0),
(122, 1, '18/01/2019', '10:38', '18:04', 1, 0),
(123, 1, '18/01/2019', '14:44', '18:04', 245, 0),
(124, 1, '07/02/2019', '18:03', '18:04', NULL, 1),
(125, 6, '07/02/2019', '18:03', NULL, NULL, 1),
(126, 7, '07/02/2019', '14:03', '18:04', 241, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(1, 'l', 'lucasmourasantos@gmail.com', 'c20ad4d76fe97759aa27a0c99bff6710'),
(2, 'we', 'q@gmail.com', 'c20ad4d76fe97759aa27a0c99bff6710'),
(3, 'a', 'email@email.com', 'c81e728d9d4c2f636f067f89cc14862c');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evento_FKIndex1` (`instituicao_id`);

--
-- Indexes for table `instituicao`
--
ALTER TABLE `instituicao`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participante`
--
ALTER TABLE `participante`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ponto`
--
ALTER TABLE `ponto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ponto_FKIndex1` (`participante_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `evento`
--
ALTER TABLE `evento`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `instituicao`
--
ALTER TABLE `instituicao`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `participante`
--
ALTER TABLE `participante`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `ponto`
--
ALTER TABLE `ponto`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
