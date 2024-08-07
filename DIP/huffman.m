freqTable = =[0.2,0.4,0.1,0.1,0.2];
huffmanTree = huffmantree(freqTable);
huffmanCodes = huffmanenco([1,2,3,4,5],huffmanTree);
