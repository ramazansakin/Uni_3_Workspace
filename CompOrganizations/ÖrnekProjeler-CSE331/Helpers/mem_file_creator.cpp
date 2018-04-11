#include <cstdlib>
#include <iostream>
#include <fstream>
#include <string>
#include <bitset>

const int EXIT_ILLEGAL_ARGS = 10;

const size_t CAPACITY = 1024;

int main(int argc, char** argv){

	if (argc != 3){
		std::cout << "usage:\n" << argv[0] << " [FILE NAME] SIZE\n[FILE NAME]\tfile to write\n"
					<<"SIZE\tSize of file by 32bits (or 4 bytes)\n";
		return EXIT_ILLEGAL_ARGS;
	}
	std::string fileName(argv[1]);
	fileName += ".mem";

	long int length = std::atoi(argv[2]);

	std::ofstream output;
	output.open(fileName.c_str());
	for(size_t i = 0; i < length; ++i){
		std::bitset<32> *tmp = new std::bitset<32>(i);
		output << *tmp << std::endl;
		delete tmp;
		}

	output.close();

	return EXIT_SUCCESS;


}