#pragma once
#include "Vertex.h"
#include <string>

class Triangle
{
	Vertex vertices[3];
	double size = 0;
	double perimeter = 0;
	double area = 0;

public:
	Triangle();
	Triangle(double);
	Triangle(std::string, std::string, std::string);
	~Triangle();
	Vertex* GetVertices();
	double GetPerimeter();
	double GetArea();
	double Perimeter();
	double Area();
	double PointMagnitude(Vertex, Vertex);
	friend std::ostream& operator<<(std::ostream& os, const Triangle& tri);
};