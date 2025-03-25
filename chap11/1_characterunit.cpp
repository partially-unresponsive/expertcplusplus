#include <chrono>
#include <numeric>
#include <thread>
#include <vector>

class Point {
	// TODO:
};

class ICharacterUnit {
public:
	virtual ICharacterUnit* clone() = 0;
	void move(const Point& to) {
		// TODO: graphics-specific implementation
	}
	virtual void attack(const ICharacterUnit&) = 0;
	virtual void destroy() = 0;

	int get_power() const { return power_; }
	int get_life_points() const { return life_points_; }

private:
	ICharacterUnit(const ICharacterUnit& other) {
		life_points_ = other.life_points_;
		power_ = other.power_;
	}

private:
	int life_points_;
	int power_;
};


class Reader : public ICharacterUnit {
public:
	Reader();
	Reader(const Reader&) = delete;
	Reader& operator=(const Reader&) = delete;

	void attack(const ICharacterUnit& attacker) override {
		decrease_life_points_(attacker.get_power());
	}

	void destroy() override {
		// TODO: 
	}

private:
	void decrease_life_points_(int num) {
		life_points_ -= num;
		if (life_points_ <= 0) {
			destroy();
		}
	}

private:
	int life_points_;
	int power_;
};


int calculate_damage(const std::vector<ICharacterUnit*>& units) {
	return std::reduce(units.begin(), units.end(), 0,
		    [](ICharacterUnit& u1, ICharacterUnit& u2){
		    	return u1.get_power() + u2.get_power();
		    });
}

class IBuilding {  // The 'I' prefix stands for Interface; this acts as the abstract class/base interface for all building types
public:
	virtual void attack(const ICharacterUnit&) = 0;
	virtual void destroy() = 0;
	virtual void build(const ICharacterUnit*) = 0;
	virtual int get_life_points() const = 0;

public:
	void run() {
		// std::jthread{Building::background_action_, this};
	}

private:
	virtual void background_action_() {
		// no or default implementation in the base class
	}
};

class House : public IBuilding {
public:
	House();
	// copying will be covered by a Prototype
	House(const House&) = delete;
	House& operator=(const House&) = delete;

public:
	void attack(const ICharacterUnit&);
	void destroy();
	void build(const ICharacterUnit&);
	// TODO:
	
private:
	int life_points_;
	int capacity_;
	std::chrono::duration<int> construction_duration_;
};

class Barrack : public IBuilding {
public:
	void attack(const ICharacterUnit& attacker) override {
		decrease_life_points_(attacker.get_power());
	}

	void destroy() override {
		// TODO:
	}

	void build(const ICharacterUnit* builder) override {
		// TODO: construction of the building
	}

	int get_life_points() const override {
		return life_points_;
	}

private:
	void decrease_life_points_(int num) {
		life_points_ -= num;
		if (life_points_ <= 0) {
			destroy();
		}
	}

private:
	int life_points_;
	int capacity_;
	std::chrono::duration<int> construction_duration_;

};
