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

	std::cout << "X: " << x << " Y: " << y << std::endl;
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

void Vertex::SetX(double pointX)
{
	x = pointX;
}

void Vertex::SetY(double pointY)
{
	y = pointY;
}

std::ostream& operator<<(std::ostream& os, Vertex& vert)
{
	Vertex v = vert;
	os << v.GetX() << "," << v.GetY();
	return os;
}