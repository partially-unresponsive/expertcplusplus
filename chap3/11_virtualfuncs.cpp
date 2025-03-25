#include <iostream>
#include <vector>

class Musician {
public:
	virtual void play() { std::cout << "Play an instrument" << std::endl; }
};

class Guitarist : public Musician {
public:
	void play() override { std::cout << "Play Moody Blues" << std::endl; }
};

class Pianist : public Musician {
public:
	void play() override { std::cout << "Play Golden Wind" << std::endl; }
};

int main(){
	Musician armstrong;
	Guitarist gary;
	Pianist parkinson;
	Guitarist gargantua;
	Musician* m = &armstrong;
	m->play();
	m = &gary;
	m->play();
	m = &parkinson;
	m->play();

	std::cout << "Now, everyone together!" << std::endl << std::endl;

	std::vector<Musician*> players = {&armstrong, &gary, &parkinson, &gargantua};
	for (const auto& m: players) {
		m->play();
	}

}

