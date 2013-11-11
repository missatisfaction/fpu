library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TABLE_FINV is
  port ( clk : in  std_logic;
         addrb: in  std_logic_vector(9 downto 0);
         doutb: out std_logic_vector(34 downto 0));
end TABLE_FINV;

architecture tb_inv of TABLE_FINV is
  type blockram is array (0 to 1023) of std_logic_vector (34 downto 0); 
  constant ram : blockram := ("111"&x"fffffffc", "111"&x"fc00eff4", "111"&x"f803efec", "111"&x"f408dfe4", "111"&x"f00fdfdc", "111"&x"ec18cfd4", "111"&x"e823bfcc", "111"&x"e430afc5", "111"&x"e03f7fbd", "111"&x"dc503fb5", "111"&x"d862efad", "111"&x"d477bfa6", "111"&x"d08e4f9e", "111"&x"cca6cf96", "111"&x"c8c14f8e", "111"&x"c4ddbf87", "111"&x"c0fbff7f", "111"&x"bd1c4f78", "111"&x"b93e5f70", "111"&x"b5627f69", "111"&x"b1885f61", "111"&x"adb00f59", "111"&x"a9d9cf52", "111"&x"a6054f4a", "111"&x"a232cf43", "111"&x"9e622f3c", "111"&x"9a933f34", "111"&x"96c64f2d", "111"&x"92fb0f25", "111"&x"8f31df1e", "111"&x"8b6a6f17", "111"&x"87a4af0f", "111"&x"83e0ef08", "111"&x"801f0f01", "111"&x"7c5eeefa", "111"&x"78a06ef2", "111"&x"74e3eeeb", "111"&x"71294ee4", "111"&x"6d705edd", "111"&x"69b91ed5", "111"&x"6603cece", "111"&x"62503ec7", "111"&x"5e9e6ec0", "111"&x"5aee6eb9", "111"&x"57403eb2", "111"&x"5393beab", "111"&x"4fe8fea4", "111"&x"4c400e9d", "111"&x"4898de96", "111"&x"44f34e8f", "111"&x"414f8e88", "111"&x"3dad8e81", "111"&x"3a0d3e7a", "111"&x"366eae73", "111"&x"32d1fe6d", "111"&x"2f36de66", "111"&x"2b9d6e5f", "111"&x"2805ae58", "111"&x"246f9e51", "111"&x"20db6e4b", "111"&x"1d48be44", "111"&x"19b7be3d", "111"&x"16289e37", "111"&x"129afe30", "111"&x"0f0f0e29", "111"&x"0b84be22", "111"&x"07fc4e1c", "111"&x"04754e15", "111"&x"00f01e0f", "110"&x"fd6c7e08", "110"&x"f9ea8e02", "110"&x"f66a2dfb", "110"&x"f2eb5df4", "110"&x"ef6e6dee", "110"&x"ebf2dde7", "110"&x"e8792de1", "110"&x"e500ddda", "110"&x"e18a5dd4", "110"&x"de156dce", "110"&x"daa1fdc7", "110"&x"d7304dc1", "110"&x"d3c01dbb", "110"&x"d0517db4", "110"&x"cce48dae", "110"&x"c978fda7", "110"&x"c60f3da1", "110"&x"c2a70d9b", "110"&x"bf405d95", "110"&x"bbdb1d8e", "110"&x"b8779d88", "110"&x"b5159d82", "110"&x"b1b52d7c", "110"&x"ae564d76", "110"&x"aaf8dd6f", "110"&x"a79d1d69", "110"&x"a442cd63", "110"&x"a0ea1d5d", "110"&x"9d92dd57", "110"&x"9a3d2d51", "110"&x"96e90d4b", "110"&x"93965d45", "110"&x"90453d3f", "110"&x"8cf59d39", "110"&x"89a77d33", "110"&x"865acd2d", "110"&x"830fad27", "110"&x"7fc60d21", "110"&x"7c7ded1b", "110"&x"79373d15", "110"&x"75f20d0f", "110"&x"72ae4d09", "110"&x"6f6c0d03", "110"&x"6c2b3cfd", "110"&x"68ebecf7", "110"&x"65ae2cf2", "110"&x"6271ccec", "110"&x"5f36cce6", "110"&x"5bfd4ce0", "110"&x"58c53cda", "110"&x"558ebcd5", "110"&x"52598ccf", "110"&x"4f25bcc9", "110"&x"4bf38cc4", "110"&x"48c2acbe", "110"&x"45932cb8", "110"&x"42651cb2", "110"&x"3f389cad", "110"&x"3c0d4ca7", "110"&x"38e39ca2", "110"&x"35bb3c9c", "110"&x"32942c96", "110"&x"2f6eac91", "110"&x"2c4a5c8b", "110"&x"2927ac86", "110"&x"26063c80", "110"&x"22e63c7b", "110"&x"1fc78c75", "110"&x"1caa4c70", "110"&x"198e5c6a", "110"&x"1673dc65", "110"&x"135a9c5f", "110"&x"1042dc5a", "110"&x"0d2c6c55", "110"&x"0a174c4f", "110"&x"07038c4a", "110"&x"03f11c44", "110"&x"00e01c3f", "101"&x"fdd05c3a", "101"&x"fac1fc34", "101"&x"f7b4fc2f", "101"&x"f4a93c2a", "101"&x"f19edc24", "101"&x"ee95cc1f", "101"&x"eb8e0c1a", "101"&x"e887ac15", "101"&x"e5828c0f", "101"&x"e27ebc0a", "101"&x"df7c3c05", "101"&x"dc7b0c00", "101"&x"d97b1bfa", "101"&x"d67c8bf5", "101"&x"d37f4bf0", "101"&x"d0834beb", "101"&x"cd888be6", "101"&x"ca8f1be1", "101"&x"c796fbdc", "101"&x"c4a01bd7", "101"&x"c1aa7bd1", "101"&x"beb61bcc", "101"&x"bbc31bc7", "101"&x"b8d14bc2", "101"&x"b5e0bbbd", "101"&x"b2f17bb8", "101"&x"b0037bb3", "101"&x"ad16abae", "101"&x"aa2b2ba9", "101"&x"a740dba4", "101"&x"a457db9f", "101"&x"a1700b9a", "101"&x"9e898b96", "101"&x"9ba42b90", "101"&x"98c01b8c", "101"&x"95dd3b87", "101"&x"92fb9b82", "101"&x"901b2b7d", "101"&x"8d3bfb78", "101"&x"8a5dfb73", "101"&x"87813b6f", "101"&x"84a5ab6a", "101"&x"81cb4b65", "101"&x"7ef21b60", "101"&x"7c1a2b5b", "101"&x"79435b56", "101"&x"766ddb52", "101"&x"73997b4d", "101"&x"70c64b48", "101"&x"6df44b43", "101"&x"6b237b3f", "101"&x"6853db3a", "101"&x"65855b35", "101"&x"62b81b31", "101"&x"5febfb2c", "101"&x"5d210b27", "101"&x"5a573b22", "101"&x"578e9b1e", "101"&x"54c72b19", "101"&x"5200db15", "101"&x"4f3bbb10", "101"&x"4c77ab0b", "101"&x"49b4db07", "101"&x"46f32b02", "101"&x"44329afe", "101"&x"41733af9", "101"&x"3eb4eaf5", "101"&x"3bf7caf0", "101"&x"393bbaec", "101"&x"3680dae7", "101"&x"33c70ae2", "101"&x"310e7ade", "101"&x"2e56fada", "101"&x"2ba08ad5", "101"&x"28eb4ad1", "101"&x"26371acc", "101"&x"23840ac8", "101"&x"20d20ac3", "101"&x"1e213abf", "101"&x"1b716aba", "101"&x"18c2dab6", "101"&x"16154ab2", "101"&x"1368caad", "101"&x"10bd7aa9", "101"&x"0e133aa5", "101"&x"0b6a0aa1", "101"&x"08c1ea9c", "101"&x"061aea98", "101"&x"0374ea93", "101"&x"00d01a8f", "100"&x"fe2c4a8b", "100"&x"fb899a87", "100"&x"f8e7ea82", "100"&x"f6475a7e", "100"&x"f3a7ca7a", "100"&x"f1095a76", "100"&x"ee6bea71", "100"&x"ebcf9a6d", "100"&x"e9344a69", "100"&x"e69a0a65", "100"&x"e400da61", "100"&x"e168aa5c", "100"&x"ded19a58", "100"&x"dc3b8a54", "100"&x"d9a67a50", "100"&x"d7127a4c", "100"&x"d47f8a48", "100"&x"d1ed9a44", "100"&x"cf5caa3f", "100"&x"ccccca3b", "100"&x"ca3dfa37", "100"&x"c7b02a33", "100"&x"c5235a2f", "100"&x"c2978a2b", "100"&x"c00cca27", "100"&x"bd830a23", "100"&x"bafa4a1f", "100"&x"b8728a1b", "100"&x"b5ebca17", "100"&x"b3660a13", "100"&x"b0e14a0f", "100"&x"ae5d8a0b", "100"&x"abdaca07", "100"&x"a9590a03", "100"&x"a6d849ff", "100"&x"a45889fb", "100"&x"a1d9b9f7", "100"&x"9f5bf9f4", "100"&x"9cdf19ef", "100"&x"9a6349eb", "100"&x"97e869e8", "100"&x"956e89e4", "100"&x"92f599e0", "100"&x"907da9dc", "100"&x"8e06b9d8", "100"&x"8b90b9d4", "100"&x"891ba9d0", "100"&x"86a799cd", "100"&x"843479c9", "100"&x"81c249c5", "100"&x"7f5119c1", "100"&x"7ce0c9bd", "100"&x"7a7179b9", "100"&x"780329b6", "100"&x"7595b9b2", "100"&x"732949ae", "100"&x"70bdb9aa", "100"&x"6e5329a7", "100"&x"6be989a3", "100"&x"6980c99f", "100"&x"6719099b", "100"&x"64b22998", "100"&x"624c4994", "100"&x"5fe74990", "100"&x"5d83398d", "100"&x"5b201989", "100"&x"58bdd985", "100"&x"565c8982", "100"&x"53fc297e", "100"&x"519cb97a", "100"&x"4f3e1976", "100"&x"4ce08973", "100"&x"4a83c96f", "100"&x"4827f96c", "100"&x"45cd0968", "100"&x"43730965", "100"&x"4119e961", "100"&x"3ec1a95d", "100"&x"3c6a595a", "100"&x"3a13e956", "100"&x"37be5952", "100"&x"3569b94f", "100"&x"3315e94b", "100"&x"30c31948", "100"&x"2e711944", "100"&x"2c1ff941", "100"&x"29cfc93d", "100"&x"2780693a", "100"&x"2531e936", "100"&x"22e45933", "100"&x"2097992f", "100"&x"1e4bc92c", "100"&x"1c00c928", "100"&x"19b6a925", "100"&x"176d6922", "100"&x"1525091e", "100"&x"12dd891b", "100"&x"1096d917", "100"&x"0e510914", "100"&x"0c0c1910", "100"&x"09c7f90d", "100"&x"0784b90a", "100"&x"05425906", "100"&x"0300c903", "100"&x"00c018ff", "011"&x"fe8038fc", "011"&x"fc4138f9", "011"&x"fa0308f5", "011"&x"f7c5b8f2", "011"&x"f58928ee", "011"&x"f34d88eb", "011"&x"f112b8e8", "011"&x"eed8b8e5", "011"&x"ec9f88e1", "011"&x"ea6728de", "011"&x"e82fa8db", "011"&x"e5f8f8d7", "011"&x"e3c318d4", "011"&x"e18e08d1", "011"&x"df59d8ce", "011"&x"dd2668ca", "011"&x"daf3c8c7", "011"&x"d8c208c4", "011"&x"d69108c0", "011"&x"d460e8bd", "011"&x"d23188ba", "011"&x"d002f8b7", "011"&x"cdd538b4", "011"&x"cba848b0", "011"&x"c97c28ad", "011"&x"c750d8aa", "011"&x"c52648a7", "011"&x"c2fc88a4", "011"&x"c0d398a1", "011"&x"beab689d", "011"&x"bc84189a", "011"&x"ba5d7897", "011"&x"b837b894", "011"&x"b612b891", "011"&x"b3ee788e", "011"&x"b1cb088a", "011"&x"afa86888", "011"&x"ad868884", "011"&x"ab656881", "011"&x"a945187e", "011"&x"a725887b", "011"&x"a506c878", "011"&x"a2e8c875", "011"&x"a0cb8872", "011"&x"9eaf086f", "011"&x"9c93586c", "011"&x"9a786869", "011"&x"985e3866", "011"&x"9644c862", "011"&x"942c2860", "011"&x"9214485c", "011"&x"8ffd285a", "011"&x"8de6c857", "011"&x"8bd11854", "011"&x"89bc3850", "011"&x"87a8184e", "011"&x"8594b84a", "011"&x"83821848", "011"&x"81703844", "011"&x"7f5f1842", "011"&x"7d4ea83e", "011"&x"7b3ef83c", "011"&x"79301839", "011"&x"7721e836", "011"&x"75147833", "011"&x"7307b830", "011"&x"70fbb82d", "011"&x"6ef0782a", "011"&x"6ce5f827", "011"&x"6adc2824", "011"&x"68d31821", "011"&x"66cac81e", "011"&x"64c3281c", "011"&x"62bc4819", "011"&x"60b61816", "011"&x"5eb09813", "011"&x"5cabe810", "011"&x"5aa7d80d", "011"&x"58a4880a", "011"&x"56a1f808", "011"&x"54a00804", "011"&x"529ee802", "011"&x"509e77ff", "011"&x"4e9ea7fc", "011"&x"4c9fa7f9", "011"&x"4aa147f6", "011"&x"48a3a7f4", "011"&x"46a6b7f1", "011"&x"44aa77ee", "011"&x"42aee7eb", "011"&x"40b417e9", "011"&x"3eb9e7e6", "011"&x"3cc077e3", "011"&x"3ac7b7e0", "011"&x"38cfa7de", "011"&x"36d847db", "011"&x"34e197d8", "011"&x"32eb87d5", "011"&x"30f637d2", "011"&x"2f0197d0", "011"&x"2d0da7cd", "011"&x"2b1a67ca", "011"&x"2927c7c8", "011"&x"2735e7c5", "011"&x"2544a7c2", "011"&x"235417c0", "011"&x"216437bd", "011"&x"1f74f7ba", "011"&x"1d8677b7", "011"&x"1b9897b5", "011"&x"19ab67b2", "011"&x"17bed7af", "011"&x"15d2f7ad", "011"&x"13e7c7aa", "011"&x"11fd47a7", "011"&x"101367a5", "011"&x"0e2a27a2", "011"&x"0c41a7a0", "011"&x"0a59b79d", "011"&x"0872779a", "011"&x"068be798", "011"&x"04a5f795", "011"&x"02c0b792", "011"&x"00dc1790", "010"&x"fef8278d", "010"&x"fd14c78a", "010"&x"fb322788", "010"&x"f9501786", "010"&x"f76eb783", "010"&x"f58df780", "010"&x"f3ade77e", "010"&x"f1ce777b", "010"&x"efefa779", "010"&x"ee117776", "010"&x"ec33e774", "010"&x"ea570771", "010"&x"e87ab76e", "010"&x"e69f176c", "010"&x"e4c41769", "010"&x"e2e9b767", "010"&x"e1100764", "010"&x"df36e762", "010"&x"dd5e675f", "010"&x"db86975d", "010"&x"d9af575a", "010"&x"d7d8b758", "010"&x"d602b755", "010"&x"d42d6753", "010"&x"d258a750", "010"&x"d084874e", "010"&x"ceb1074c", "010"&x"ccde1749", "010"&x"cb0bd746", "010"&x"c93a2744", "010"&x"c7692742", "010"&x"c598b73f", "010"&x"c3c8d73d", "010"&x"c1f9a73a", "010"&x"c02b0738", "010"&x"be5d0736", "010"&x"bc8fa733", "010"&x"bac2d731", "010"&x"b8f6a72e", "010"&x"b72b072c", "010"&x"b560172a", "010"&x"b395a727", "010"&x"b1cbe725", "010"&x"b002b722", "010"&x"ae3a1720", "010"&x"ac72171e", "010"&x"aaaab71b", "010"&x"a8e3e719", "010"&x"a71da716", "010"&x"a5580714", "010"&x"a392f712", "010"&x"a1ce870f", "010"&x"a00aa70d", "010"&x"9e47570b", "010"&x"9c84a708", "010"&x"9ac28706", "010"&x"99010704", "010"&x"97401701", "010"&x"957fb6ff", "010"&x"93bfe6fd", "010"&x"9200b6fa", "010"&x"904206f8", "010"&x"8e83f6f6", "010"&x"8cc686f4", "010"&x"8b0996f1", "010"&x"894d36ef", "010"&x"879176ed", "010"&x"85d646ea", "010"&x"841ba6e8", "010"&x"826196e6", "010"&x"80a816e4", "010"&x"7eef26e1", "010"&x"7d36c6df", "010"&x"7b7ef6dd", "010"&x"79c7b6da", "010"&x"781106d8", "010"&x"765ae6d6", "010"&x"74a556d4", "010"&x"72f056d2", "010"&x"713be6d0", "010"&x"6f8806cd", "010"&x"6dd4a6cb", "010"&x"6c21e6c9", "010"&x"6a6fa6c6", "010"&x"68bdf6c4", "010"&x"670cd6c2", "010"&x"655c46c0", "010"&x"63ac46be", "010"&x"61fcc6bc", "010"&x"604dd6ba", "010"&x"5e9f76b7", "010"&x"5cf196b5", "010"&x"5b4456b3", "010"&x"599786b1", "010"&x"57eb56ae", "010"&x"563fa6ac", "010"&x"549486aa", "010"&x"52e9e6a8", "010"&x"513fd6a6", "010"&x"4f9656a4", "010"&x"4ded56a2", "010"&x"4c44e6a0", "010"&x"4a9cf69e", "010"&x"48f5969b", "010"&x"474eb699", "010"&x"45a86697", "010"&x"44029695", "010"&x"425d5693", "010"&x"40b89691", "010"&x"3f14568f", "010"&x"3d70a68c", "010"&x"3bcd868a", "010"&x"3a2ad688", "010"&x"3888b686", "010"&x"36e72684", "010"&x"35460682", "010"&x"33a57680", "010"&x"3205767e", "010"&x"3065e67c", "010"&x"2ec6e67a", "010"&x"2d286678", "010"&x"2b8a7676", "010"&x"29ecf674", "010"&x"28500672", "010"&x"26b39670", "010"&x"2517a66e", "010"&x"237c366c", "010"&x"21e1566a", "010"&x"2046e668", "010"&x"1ead0666", "010"&x"1d13a664", "010"&x"1b7ab662", "010"&x"19e25660", "010"&x"184a765e", "010"&x"16b3165b", "010"&x"151c3659", "010"&x"1385d657", "010"&x"11eff656", "010"&x"105a9654", "010"&x"0ec5b652", "010"&x"0d315650", "010"&x"0b9d764e", "010"&x"0a0a164c", "010"&x"0877264a", "010"&x"06e4c648", "010"&x"0552d646", "010"&x"03c17644", "010"&x"02308642", "010"&x"00a01640", "001"&x"ff10163e", "001"&x"fd80a63c", "001"&x"fbf1a63a", "001"&x"fa633638", "001"&x"f8d52636", "001"&x"f747a634", "001"&x"f5ba9632", "001"&x"f42e1630", "001"&x"f2a1f62e", "001"&x"f116662c", "001"&x"ef8b462a", "001"&x"ee00a628", "001"&x"ec767626", "001"&x"eaecd625", "001"&x"e9639623", "001"&x"e7dae621", "001"&x"e652a61f", "001"&x"e4cad61d", "001"&x"e343861b", "001"&x"e1bcb619", "001"&x"e0365618", "001"&x"deb07616", "001"&x"dd2b0614", "001"&x"dba61612", "001"&x"da219610", "001"&x"d89d960e", "001"&x"d71a060c", "001"&x"d596e60a", "001"&x"d4144608", "001"&x"d2922607", "001"&x"d1107605", "001"&x"cf8f3603", "001"&x"ce0e6601", "001"&x"cc8e15ff", "001"&x"cb0e45fe", "001"&x"c98ed5fc", "001"&x"c80fe5fa", "001"&x"c69175f8", "001"&x"c51365f6", "001"&x"c395d5f4", "001"&x"c218b5f2", "001"&x"c09c15f1", "001"&x"bf1fd5ef", "001"&x"bda415ed", "001"&x"bc28c5eb", "001"&x"baadf5ea", "001"&x"b93385e8", "001"&x"b7b995e6", "001"&x"b64015e4", "001"&x"b4c705e2", "001"&x"b34e65e0", "001"&x"b1d635df", "001"&x"b05e75dd", "001"&x"aee735db", "001"&x"ad7065da", "001"&x"abf9f5d8", "001"&x"aa8405d6", "001"&x"a90e85d4", "001"&x"a79975d2", "001"&x"a624d5d1", "001"&x"a4b095cf", "001"&x"a33cd5cd", "001"&x"a1c985cc", "001"&x"a056a5ca", "001"&x"9ee435c8", "001"&x"9d7235c6", "001"&x"9c00a5c4", "001"&x"9a8f75c3", "001"&x"991ec5c1", "001"&x"97ae75bf", "001"&x"963ea5be", "001"&x"94cf35bc", "001"&x"936035ba", "001"&x"91f1a5b8", "001"&x"908385b7", "001"&x"8f15d5b5", "001"&x"8da885b3", "001"&x"8c3bb5b2", "001"&x"8acf45b0", "001"&x"896345ae", "001"&x"87f7a5ac", "001"&x"868c85ab", "001"&x"8521c5a9", "001"&x"83b775a8", "001"&x"824d95a6", "001"&x"80e415a4", "001"&x"7f7b05a2", "001"&x"7e1265a1", "001"&x"7caa359f", "001"&x"7b42659e", "001"&x"79db059c", "001"&x"7874059a", "001"&x"770d7598", "001"&x"75a75597", "001"&x"74419595", "001"&x"72dc4594", "001"&x"71776592", "001"&x"7012e590", "001"&x"6eaec58e", "001"&x"6d4b258d", "001"&x"6be7e58b", "001"&x"6a85058a", "001"&x"69229588", "001"&x"67c08586", "001"&x"665ee585", "001"&x"64fda583", "001"&x"639cd582", "001"&x"623c7580", "001"&x"60dc657e", "001"&x"5f7cc57d", "001"&x"5e1d957b", "001"&x"5cbec57a", "001"&x"5b606578", "001"&x"5a025576", "001"&x"58a4c575", "001"&x"57478573", "001"&x"55eab572", "001"&x"548e5570", "001"&x"5332456e", "001"&x"51d6a56d", "001"&x"507b756b", "001"&x"4f20956a", "001"&x"4dc62568", "001"&x"4c6c2566", "001"&x"4b127565", "001"&x"49b93563", "001"&x"48605562", "001"&x"4707d560", "001"&x"45afc55f", "001"&x"4458155d", "001"&x"4300c55c", "001"&x"41a9d55a", "001"&x"40534558", "001"&x"3efd2557", "001"&x"3da76556", "001"&x"3c51f554", "001"&x"3afd0552", "001"&x"39a86551", "001"&x"3854254f", "001"&x"3700554e", "001"&x"35acd54c", "001"&x"3459c54b", "001"&x"33071549", "001"&x"31b4c548", "001"&x"3062d546", "001"&x"2f114545", "001"&x"2dc01543", "001"&x"2c6f4542", "001"&x"2b1ed540", "001"&x"29cec53e", "001"&x"287f153d", "001"&x"272fc53c", "001"&x"25e0d53a", "001"&x"24925539", "001"&x"23442537", "001"&x"21f65536", "001"&x"20a8e534", "001"&x"1f5bd533", "001"&x"1e0f2531", "001"&x"1cc2c530", "001"&x"1b76d52e", "001"&x"1a2b452d", "001"&x"18e0052b", "001"&x"1795352a", "001"&x"164ab528", "001"&x"15009527", "001"&x"13b6d526", "001"&x"126d7524", "001"&x"11247522", "001"&x"0fdbc521", "001"&x"0e937520", "001"&x"0d4b851e", "001"&x"0c03f51d", "001"&x"0abcc51b", "001"&x"0975e51a", "001"&x"082f7518", "001"&x"06e95517", "001"&x"05a38516", "001"&x"045e2514", "001"&x"03191513", "001"&x"01d46511", "001"&x"00901510", "000"&x"ff4c150e", "000"&x"fe08750d", "000"&x"fcc5350c", "000"&x"fb82450a", "000"&x"fa3fb509", "000"&x"f8fd8507", "000"&x"f7bba506", "000"&x"f67a2504", "000"&x"f538f503", "000"&x"f3f83502", "000"&x"f2b7b500", "000"&x"f177a4ff", "000"&x"f037e4fe", "000"&x"eef874fc", "000"&x"edb974fb", "000"&x"ec7ab4f9", "000"&x"eb3c54f8", "000"&x"e9fe54f6", "000"&x"e8c0b4f5", "000"&x"e78354f4", "000"&x"e64664f2", "000"&x"e509c4f1", "000"&x"e3cd74f0", "000"&x"e29184ee", "000"&x"e155e4ed", "000"&x"e01aa4ec", "000"&x"dedfb4ea", "000"&x"dda524e9", "000"&x"dc6ae4e8", "000"&x"db3104e6", "000"&x"d9f774e5", "000"&x"d8be34e4", "000"&x"d78554e2", "000"&x"d64cc4e1", "000"&x"d51494df", "000"&x"d3dcb4de", "000"&x"d2a524dd", "000"&x"d16df4db", "000"&x"d03714da", "000"&x"cf0094d9", "000"&x"cdca64d7", "000"&x"cc9484d6", "000"&x"cb5ef4d5", "000"&x"ca29c4d3", "000"&x"c8f4e4d2", "000"&x"c7c054d1", "000"&x"c68c24d0", "000"&x"c55844ce", "000"&x"c424b4cd", "000"&x"c2f184cc", "000"&x"c1bea4ca", "000"&x"c08c14c9", "000"&x"bf59d4c8", "000"&x"be27e4c6", "000"&x"bcf654c5", "000"&x"bbc514c4", "000"&x"ba9424c2", "000"&x"b96384c1", "000"&x"b83344c0", "000"&x"b70344be", "000"&x"b5d3a4bd", "000"&x"b4a454bc", "000"&x"b37554ba", "000"&x"b246b4b9", "000"&x"b11854b8", "000"&x"afea54b7", "000"&x"aebc94b6", "000"&x"ad8f34b4", "000"&x"ac6224b3", "000"&x"ab3564b2", "000"&x"aa08f4b0", "000"&x"a8dcd4af", "000"&x"a7b104ae", "000"&x"a68594ac", "000"&x"a55a64ab", "000"&x"a42f84aa", "000"&x"a30504a9", "000"&x"a1dac4a8", "000"&x"a0b0e4a6", "000"&x"9f8744a5", "000"&x"9e5e04a4", "000"&x"9d3504a2", "000"&x"9c0c64a1", "000"&x"9ae414a0", "000"&x"99bc049f", "000"&x"9894449e", "000"&x"976ce49c", "000"&x"9645c49b", "000"&x"951f049a", "000"&x"93f88498", "000"&x"92d25497", "000"&x"91ac7496", "000"&x"9086e495", "000"&x"8f61a494", "000"&x"8e3cb492", "000"&x"8d181491", "000"&x"8bf3b490", "000"&x"8acfb48f", "000"&x"89abf48e", "000"&x"8888948c", "000"&x"8765748b", "000"&x"8642a48a", "000"&x"85201489", "000"&x"83fde488", "000"&x"82dbf486", "000"&x"81ba6485", "000"&x"80991484", "000"&x"7f781483", "000"&x"7e575482", "000"&x"7d36f480", "000"&x"7c16d47f", "000"&x"7af7047e", "000"&x"79d7847d", "000"&x"78b8447c", "000"&x"7799547a", "000"&x"767ab479", "000"&x"755c6478", "000"&x"743e6477", "000"&x"7320a476", "000"&x"72033474", "000"&x"70e60473", "000"&x"6fc93472", "000"&x"6eaca471", "000"&x"6d905470", "000"&x"6c74546e", "000"&x"6b58b46e", "000"&x"6a3d446c", "000"&x"6922346b", "000"&x"6807646a", "000"&x"66ecd469", "000"&x"65d2a468", "000"&x"64b8a466", "000"&x"639f0465", "000"&x"6285a464", "000"&x"616c9463", "000"&x"6053c462", "000"&x"5f3b4461", "000"&x"5e231460", "000"&x"5d0b245e", "000"&x"5bf3745d", "000"&x"5adc245c", "000"&x"59c5045b", "000"&x"58ae445a", "000"&x"5797c459", "000"&x"56818458", "000"&x"556b9456", "000"&x"5455e456", "000"&x"53408454", "000"&x"522b7453", "000"&x"5116a452", "000"&x"50021451", "000"&x"4eedd450", "000"&x"4dd9e44f", "000"&x"4cc6344e", "000"&x"4bb2c44c", "000"&x"4a9fa44b", "000"&x"498cc44a", "000"&x"487a3449", "000"&x"4767e448", "000"&x"4655e447", "000"&x"45442446", "000"&x"4432a445", "000"&x"43217444", "000"&x"42108442", "000"&x"40ffe441", "000"&x"3fef8440", "000"&x"3edf643f", "000"&x"3dcf943e", "000"&x"3cc0143d", "000"&x"3bb0c43c", "000"&x"3aa1c43b", "000"&x"3993043a", "000"&x"38849439", "000"&x"37766438", "000"&x"36687436", "000"&x"355ad436", "000"&x"344d7434", "000"&x"33405433", "000"&x"32338432", "000"&x"3126f431", "000"&x"301aa430", "000"&x"2f0e942f", "000"&x"2e02d42e", "000"&x"2cf7542d", "000"&x"2bec142c", "000"&x"2ae1242b", "000"&x"29d6742a", "000"&x"28cc0428", "000"&x"27c1d428", "000"&x"26b7f426", "000"&x"25ae4425", "000"&x"24a4e424", "000"&x"239bd423", "000"&x"2292f422", "000"&x"218a6421", "000"&x"20821420", "000"&x"1f7a041f", "000"&x"1e72341e", "000"&x"1d6aa41d", "000"&x"1c63641c", "000"&x"1b5c541b", "000"&x"1a55941a", "000"&x"194f1419", "000"&x"1848e418", "000"&x"1742e417", "000"&x"163d3416", "000"&x"1537b415", "000"&x"14328414", "000"&x"132d9413", "000"&x"1228e412", "000"&x"11247410", "000"&x"10204410", "000"&x"0f1c540e", "000"&x"0e18b40e", "000"&x"0d15440c", "000"&x"0c12240c", "000"&x"0b0f340a", "000"&x"0a0c940a", "000"&x"090a3408", "000"&x"08081408", "000"&x"07062406", "000"&x"06048406", "000"&x"05032404", "000"&x"04020404", "000"&x"03012402", "000"&x"02008402", "000"&x"01002400"); 
  signal addr_reg : std_logic_vector(9 downto 0); 
begin
  process(clk)
  begin
    if rising_edge(clk) then
      addr_reg <= addrb;
    end if;
  end process;
  doutb <= ram(conv_integer(addr_reg));
end tb_inv;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TABLE_SQRT is
  port ( clk : in  std_logic;
         addrb: in  std_logic_vector(9 downto 0);
         doutb: out std_logic_vector(35 downto 0));
end TABLE_SQRT;

architecture tb_sqr of TABLE_SQRT is
  type blockram is array (0 to 767) of std_logic_vector (35 downto 0); 
  constant ram : blockram := (x"000003ff9", x"007fe3fe9", x"00ff83fd9", x"017ee5fc9", x"01fe05fba", x"027cebfaa", x"02fb8ff9b", x"0379f7f8b", x"03f821f7c", x"04760ff6d", x"04f3bff5e", x"057133f4f", x"05ee6bf40", x"066b67f31", x"06e829f22", x"0764aff13", x"07e0f9f05", x"085d07ef7", x"08d8dfee8", x"09547beda", x"09cfdfecb", x"0a4b09ebd", x"0ac5f9eaf", x"0b40b1ea1", x"0bbb31e93", x"0c357be85", x"0caf8be77", x"0d2965e69", x"0da305e5c", x"0e1c71e4e", x"0e95a7e40", x"0f0ea5e33", x"0f876de26", x"100001e18", x"10785fe0b", x"10f087dfe", x"11687bdf1", x"11e03bde4", x"1257c7dd6", x"12cf1ddca", x"134641dbd", x"13bd31db0", x"1433edda3", x"14aa77d96", x"1520cfd89", x"1596f3d7d", x"160ce5d71", x"1682a5d65", x"16f835d58", x"176d91d4c", x"17e2bdd40", x"1857b9d33", x"18cc83d27", x"19411dd1b", x"19b587d0f", x"1a29c1d03", x"1a9dcbcf7", x"1b11a5ceb", x"1b854fcdf", x"1bf8cbcd4", x"1c6c17cc8", x"1cdf35cbd", x"1d5225cb1", x"1dc4e7ca5", x"1e377bc9a", x"1ea9e1c8e", x"1f1c19c83", x"1f8e23c78", x"200001c6c", x"2071b1c62", x"20e335c56", x"21548dc4b", x"21c5b9c40", x"2236b7c35", x"22a789c2b", x"231831c1f", x"2388adc14", x"23f8fdc0a", x"246923bff", x"24d91dbf4", x"2548edbe9", x"25b891bdf", x"26280dbd4", x"26975dbca", x"270683bbf", x"27757fbb5", x"27e453baa", x"2852fdba0", x"28c17db96", x"292fd3b8c", x"299e03b81", x"2a0c07b78", x"2a79e5b6d", x"2ae799b63", x"2b5525b59", x"2bc28bb4f", x"2c2fc7b45", x"2c9cdbb3c", x"2d09c9b31", x"2d768fb28", x"2de32db1e", x"2e4fa5b14", x"2ebbf5b0b", x"2f2821b01", x"2f9423af8", x"300001aee", x"306bb9ae4", x"30d749adb", x"3142b5ad1", x"31adf9ac8", x"321919abe", x"328413ab5", x"32eee9aac", x"335999aa2", x"33c423a9a", x"342e89a90", x"3498cba87", x"3502e7a7e", x"356cdfa75", x"35d6b3a6c", x"364065a63", x"36a9f1a5a", x"371359a51", x"377c9da48", x"37e5bfa3f", x"384ebba37", x"38b797a2e", x"39204da25", x"3988e3a1c", x"39f153a14", x"3a59a3a0b", x"3ac1cfa02", x"3b29d99fa", x"3b91c19f1", x"3bf9859e9", x"3c61299e0", x"3cc8ab9d8", x"3d300b9d0", x"3d97499c7", x"3dfe659bf", x"3e655f9b7", x"3ecc399ae", x"3f32f39a6", x"3f998b99e", x"400001996", x"40665798d", x"40cc8d985", x"4132a197d", x"419895975", x"41fe6996d", x"42641d965", x"42c9b195d", x"432f25955", x"43947b94d", x"43f9af945", x"445ec393d", x"44c3b9936", x"45288f92e", x"458d47926", x"45f1df91e", x"465657916", x"46bab190f", x"471eeb907", x"4783098ff", x"47e7078f8", x"484ae58f0", x"48aea78e8", x"4912498e1", x"4975cf8da", x"49d9358d2", x"4a3c7d8cb", x"4a9fa98c3", x"4b02b58bc", x"4b65a58b4", x"4bc8778ad", x"4c2b2d8a6", x"4c8dc389e", x"4cf03f897", x"4d529b890", x"4db4db889", x"4e16ff882", x"4e790587a", x"4edaef873", x"4f3cbd86c", x"4f9e6d865", x"50000185e", x"506179857", x"50c2d5850", x"512415849", x"518537842", x"51e63f83b", x"52472b834", x"52a7fb82d", x"5308b1826", x"53694981f", x"53c9c7818", x"542a29812", x"548a6f80b", x"54ea9b804", x"554aab7fd", x"55aaa17f6", x"560a7b7f0", x"566a3b7e9", x"56c9e17e2", x"57296b7dc", x"5788db7d5", x"57e82f7ce", x"58476b7c8", x"58a68b7c2", x"5905917bb", x"59647d7b4", x"59c3517ae", x"5a22097a8", x"5a80a77a1", x"5adf2b79a", x"5b3d95794", x"5b9be778e", x"5bfa1f788", x"5c583d781", x"5cb64177b", x"5d142d774", x"5d71ff76e", x"5dcfb7768", x"5e2d57762", x"5e8adf75b", x"5ee84d755", x"5f45a174f", x"5fa2dd749", x"600001742", x"605d0b73c", x"60b9ff736", x"6116d9730", x"61739972a", x"61d043724", x"622cd571e", x"62894d718", x"62e5ad712", x"6341f770c", x"639e27706", x"63fa41700", x"6456416fa", x"64b22b6f4", x"650dfd6ee", x"6569b76e8", x"65c5596e3", x"6620e56dd", x"667c596d7", x"66d7b56d1", x"6732f96cc", x"678e276c6", x"67e93f6c0", x"68443f6ba", x"689f276b4", x"68f9f96af", x"6954b56a9", x"69af596a3", x"6a09e769e", x"6a645f698", x"6abebf692", x"6b190968d", x"6b733d687", x"6bcd5b682", x"6c276167c", x"6c8153676", x"6cdb2d671", x"6d34f166c", x"6d8e9f666", x"6de839660", x"6e41bb65b", x"6e9b27656", x"6ef47f650", x"6f4dbf64b", x"6fa6eb645", x"700001640", x"70590163a", x"70b1ed635", x"710ac1630", x"71638162a", x"71bc2d625", x"7214c3620", x"726d4361b", x"72c5ad616", x"731e03610", x"73764560b", x"73ce71606", x"742689600", x"747e8b5fb", x"74d6795f6", x"752e515f1", x"7586175ec", x"75ddc55e7", x"7635615e2", x"768ce75dc", x"76e45b5d7", x"773bb75d2", x"7793015cd", x"77ea375c8", x"7841575c3", x"7898655be", x"78ef5d5b9", x"7946435b4", x"799d135af", x"79f3d15aa", x"7a4a795a5", x"7aa10f5a0", x"7af78f59b", x"7b4dfd596", x"7ba457592", x"7bfa9d58c", x"7c50cf588", x"7ca6ef583", x"7cfcfb57e", x"7d52f3579", x"7da8d9574", x"7dfea9570", x"7e546956b", x"7eaa13566", x"7effab561", x"7f553155c", x"7faaa3558", x"800001553", x"80554d54e", x"80aa8554a", x"80ffab545", x"8154bf540", x"81a9bf53b", x"81fead537", x"825389532", x"82a85152d", x"82fd07529", x"8351ab524", x"83a63b520", x"83fab951b", x"844f25516", x"84a37f512", x"84f7c750d", x"854bfd509", x"85a01f504", x"85f431500", x"86482f4fb", x"869c1b4f6", x"86eff74f2", x"8743bf4ee", x"8797754e9", x"87eb1b4e5", x"883ead4e0", x"88922f4dc", x"88e59f4d7", x"8938fd4d3", x"898c494ce", x"89df834ca", x"8a32ab4c6", x"8a85c34c1", x"8ad8c94bd", x"8b2bbd4b9", x"8b7ea14b4", x"8bd1734b0", x"8c24334ac", x"8c76e34a7", x"8cc9814a3", x"8d1c0d49f", x"8d6e8949a", x"8dc0f3496", x"8e134d492", x"8e659548e", x"8eb7cd48a", x"8f09f3485", x"8f5c09481", x"8fae0d47d", x"900001479", x"9051e5474", x"90a3b7470", x"90f57946c", x"914729468", x"9198c9464", x"91ea59460", x"923bd945c", x"928d47458", x"92dea7453", x"932ff344f", x"93813144b", x"93d25f447", x"94237b443", x"94748943f", x"94c58543b", x"951671437", x"95674d433", x"95b81942f", x"9608d542b", x"965981427", x"96aa1d423", x"96faa941f", x"974b2541b", x"979b91417", x"97ebed413", x"983c3940f", x"988c7540b", x"98dca3407", x"992cbf403", x"997ccd3ff", x"99cccb3fc", x"9a1cb93f8", x"9a6c973f4", x"9abc673f0", x"9b0c273ec", x"9b5bd73e8", x"9bab773e4", x"9bfb093e0", x"9c4a8b3dc", x"9c99fd3d9", x"9ce9613d5", x"9d38b53d1", x"9d87f93cd", x"9dd72f3ca", x"9e26553c6", x"9e756d3c2", x"9ec4753be", x"9f136f3ba", x"9f62593b7", x"9fb1353b3", x"a000013af", x"a04ebf3ac", x"a09d6d3a8", x"a0ec0d3a4", x"a13a9d3a0", x"a1891f39d", x"a1d793399", x"a225f7395", x"a2744d392", x"a2c29538e", x"a310cd38a", x"a35ef9387", x"a3ad13383", x"a3fb21380", x"a4491f37c", x"a4970f378", x"a4e4f1375", x"a532c5371", x"a5808936e", x"a5ce3f36a", x"a61be7366", x"a66981363", x"a6b70d35f", x"a7048b35c", x"a751fb358", x"a79f5b355", x"a7ecaf351", x"a839f334e", x"a8872b34a", x"a8d453346", x"a9216d343", x"a96e7b340", x"a9bb7933c", x"aa086b339", x"aa554d335", x"aaa223332", x"aaeeeb32e", x"ab3ba532b", x"ab884f328", x"abd4ef324", x"ac217f320", x"ac6e0131d", x"acba7731a", x"ad06dd316", x"ad5337313", x"ad9f83310", x"adebc330c", x"ae37f3309", x"ae8417306", x"aed02d302", x"af1c372ff", x"af68332fc", x"afb4212f8", x"b000012f5", x"b04bd52f2", x"b0979b2ee", x"b0e3532eb", x"b12eff2e8", x"b17a9d2e4", x"b1c62f2e1", x"b211b32de", x"b25d292da", x"b2a8932d7", x"b2f3f12d4", x"b33f412d0", x"b38a832cd", x"b3d5b92ca", x"b420e12c7", x"b46bfd2c4", x"b4b70b2c0", x"b5020d2bd", x"b54d032ba", x"b597eb2b7", x"b5e2c72b4", x"b62d952b0", x"b678572ad", x"b6c30d2aa", x"b70db52a7", x"b758512a4", x"b7a2df2a0", x"b7ed6329d", x"b837d929a", x"b88241297", x"b8cc9f294", x"b916ef291", x"b9613328e", x"b9ab6928a", x"b9f593288", x"ba3fb3284", x"ba89c5281", x"bad3c927e", x"bb1dc327b", x"bb67af278", x"bbb18f275", x"bbfb65272", x"bc452d26f", x"bc8ee726c", x"bcd897269", x"bd223b266", x"bd6bd1262", x"bdb55d260", x"bdfedb25c", x"be484d25a", x"be91b5256", x"bedb0f254", x"bf245d250", x"bf6d9f24e", x"bfb6d724a", x"c00001248", x"c0491f244", x"c09233242", x"c0db3923e", x"c1243323c", x"c16d23239", x"c1b607236", x"c1fedd233", x"c247a9230", x"c2906922d", x"c2d91d22a", x"c321c5227", x"c36a63224", x"c3b2f3221", x"c3fb7921e", x"c443f321c", x"c48c61218", x"c4d4c3216", x"c51d1b213", x"c56567210", x"c5ada720d", x"c5f5db20a", x"c63e03207", x"c68621204", x"c6ce33202", x"c716391ff", x"c75e351fc", x"c7a6251f9", x"c7ee091f6", x"c835e31f3", x"c87db11f0", x"c8c5731ee", x"c90d2b1eb", x"c954d71e8", x"c99c771e5", x"c9e40d1e2", x"ca2b991e0", x"ca73171dd", x"caba8b1da", x"cb01f51d7", x"cb49531d4", x"cb90a51d2", x"cbd7ed1cf", x"cc1f2b1cc", x"cc665d1ca", x"ccad831c7", x"ccf49f1c4", x"cd3baf1c1", x"cd82b51be", x"cdc9b11bc", x"ce10a11b9", x"ce57851b6", x"ce9e5f1b4", x"cee52f1b1", x"cf2bf31ae", x"cf72ad1ac", x"cfb95d1a9", x"d000011a6", x"d0469b1a4", x"d08d291a1", x"d0d3ad19e", x"d11a2719c", x"d16095199", x"d1a6f9196", x"d1ed53194", x"d233a1191", x"d279e718e", x"d2c01f18c", x"d3064f189", x"d34c73186", x"d3928d184", x"d3d89d181", x"d41ea117e", x"d4649d17c", x"d4aa8d179", x"d4f073177", x"d5364d174", x"d57c1f172", x"d5c1e516f", x"d607a116c", x"d64d5316a", x"d692fb167", x"d6d897164", x"d71e2b162", x"d763b3160", x"d7a93115d", x"d7eea515a", x"d8340f158", x"d8796f155", x"d8bec5153", x"d90411150", x"d9495114e", x"d98e8914b", x"d9d3b5148", x"da18d9146", x"da5df1144", x"daa2ff141", x"dae80513e", x"db2cff13c", x"db71f113a", x"dbb6d7137", x"dbfbb3134", x"dc4087132", x"dc854f130", x"dcca0f12d", x"dd0ec312b", x"dd536f128", x"dd980f126", x"dddca7123", x"de2135121", x"de65b911e", x"deaa3111c", x"deeea311a", x"df3309117", x"df7765114", x"dfbbb7112", x"e00001110", x"e0444110d", x"e0887710b", x"e0cca3108", x"e110c5106", x"e154dd104", x"e198ed101", x"e1dcf10ff", x"e220ed0fc", x"e264e10fa", x"e2a8c90f8", x"e2eca90f5", x"e3307d0f3", x"e374490f0", x"e3b80d0ee", x"e3fbc50ec", x"e43f750ea", x"e4831b0e7", x"e4c6b90e5", x"e50a4b0e2", x"e54dd50e0", x"e591570de", x"e5d4cd0db", x"e6183b0d9", x"e65b9f0d7", x"e69efb0d4", x"e6e24d0d2", x"e725950d0", x"e768d50cd", x"e7ac0b0cb", x"e7ef370c9", x"e8325b0c6", x"e875750c4", x"e8b8850c2", x"e8fb8d0c0", x"e93e8d0bd", x"e981810bb", x"e9c46f0b9", x"ea07510b6", x"ea4a2b0b4", x"ea8cfd0b2", x"eacfc50b0", x"eb12830ad", x"eb55390ab", x"eb97e50a9", x"ebda890a6", x"ec1d230a4", x"ec5fb50a2", x"eca23d0a0", x"ece4bd09e", x"ed273309b", x"ed69a1099", x"edac07097", x"edee63094", x"ee30b5092", x"ee72ff090", x"eeb54108e", x"eef77908c", x"ef39a708a", x"ef7bcf087", x"efbded085", x"f00001083", x"f0420d081", x"f0841107e", x"f0c60b07c", x"f107fd07a", x"f149e5078", x"f18bc7076", x"f1cd9d074", x"f20f6d072", x"f2513306f", x"f292f106d", x"f2d4a506b", x"f31651069", x"f357f5066", x"f39991064", x"f3db23062", x"f41cad060", x"f45e2d05e", x"f49fa505c", x"f4e11705a", x"f5227d058", x"f563dd056", x"f5a533053", x"f5e681051", x"f627c704f", x"f6690304d", x"f6aa3704b", x"f6eb63049", x"f72c87047", x"f76da3044", x"f7aeb5042", x"f7efbf040", x"f830c103e", x"f871bb03c", x"f8b2ad03a", x"f8f395038", x"f93475036", x"f9754f034", x"f9b61f032", x"f9f6e5030", x"fa37a502e", x"fa785b02c", x"fab90b02a", x"faf9b1028", x"fb3a4f026", x"fb7ae5023", x"fbbb73021", x"fbfbf901f", x"fc3c7701d", x"fc7ceb01b", x"fcbd59019", x"fcfdbd017", x"fd3e1b015", x"fd7e6f013", x"fdbebb011", x"fdfeff00f", x"fe3f3d00d", x"fe7f7100b", x"febf9d009", x"feffc1007", x"ff3fdd005", x"ff7ff1003", x"ffbffd001"); 
  signal addr_reg : std_logic_vector(9 downto 0); 
begin
  process(clk)
  begin
    if rising_edge(clk) then
      addr_reg <= addrb;
    end if;
  end process;
  doutb <= ram(conv_integer(addr_reg)); -- ブロックRAMにするにはここをレジスタ信号にする。
end tb_sqr;
