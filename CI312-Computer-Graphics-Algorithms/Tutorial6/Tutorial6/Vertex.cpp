#include "Vertex.h"
#include <string>
#include <iostream>
#include <sstream>

Vertex::Vertex()
{
}

Vertex::Vertex(std::string point)
{
	std::stringstream stream = std::stringstream(point);
	char comma;
	stream >> x;
	stream >> comma;
	stream >> y;
}

Vertex::~Vertex()
{
}

double Vertex::GetX()
{
	return x;
}

double Vertex::GetY()
{
	return y;
}

std::ostream& operator<<(std::ostream& os, Vertex& vert)
{
	Vertex v = vert;
	os << v.GetX() << "," << v.GetY();
	return os;
}