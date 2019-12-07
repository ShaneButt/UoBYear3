#pragma once
#include <string>
class Vertex
{
	double x = 0;
	double y = 0;
public:
	Vertex();
	Vertex(std::string);
	~Vertex();
	double GetX();
	double GetY();
	friend std::ostream& operator<<(std::ostream& os, Vertex& tri);
};