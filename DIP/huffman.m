% Define a frequency table for the symbols.
% Each value represents the frequency (or probability) of the corresponding symbol.
freqTable = [0.2, 0.4, 0.1, 0.1, 0.2];

% Generate a Huffman tree based on the frequency table.
% The huffmantree function creates a binary tree used for Huffman encoding.
huffmanTree = huffmantree(freqTable);

% Encode the sequence [1, 2, 3, 4, 5] using the generated Huffman tree.
% The huffmanenco function takes the sequence and the Huffman tree to produce the encoded bit sequence.
huffmanCodes = huffmanenco([1, 2, 3, 4, 5], huffmanTree);
