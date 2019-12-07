#include "Triangle.h"
#include "Vertex.h"
#include <iostream>
#include <string>

Triangle::Triangle()
{
	std::cout << "New Triangle made!" << std::endl;
	size = 0;
}

Triangle::Triangle(double si)
{
	size = si;
}

Triangle::Triangle(std::string p1, std::string p2, std::string p3) : vertices{ Vertex::Vertex(p1), Vertex::Vertex(p2), Vertex::Vertex(p3) } { size = 0;  };

Triangle::~Triangle()
{
}

Vertex* Triangle::GetVertices()
{
	return vertices;
}

double Triangle::GetPerimeter()
{
	return perimeter;
}

double Triangle::GetArea()
{
	return area;
}

double Triangle::GetBase()
{
	return base;
}

double Triangle::GetHeight()
{
	return height;
}

double Triangle::Perimeter()
{
	double p = 0;
	Triangle* t = this;
	Vertex* verts = t->GetVertices();
	for (size_t i = 0; i < 3; i++)
	{
		if (i == 2) {
			p += t->PointMagnitude(verts[i], verts[0]);
		}
		else {
			p += t->PointMagnitude(verts[i], verts[i + 1]);
		}
	}
	return p;
}

double Triangle::Area()
{
	double a = 0;
	Triangle* t = this;
	double base = (t->GetBase() != 0) ? t->GetBase() : t->Base(); // if base is not zero, use it; otherwise calculate base length
	double height = (t->GetHeight() != 0) ? t->GetHeight() : t->Height(); // if height is not zero, use it; otherwise calculate height length
	a = ((base * height) * (1 / 2));
	return a;
}

double Triangle::Base()
{
	double b = 0;
	return b;
}

double Triangle::Height()
{
	double h = 0;
	return h;
}

double Triangle::PointMagnitude(Vertex a, Vertex b)
{
	double m;
	double x1 = a.GetX(), y1 = a.GetY();
	double x2 = b.GetX(), y2 = b.GetY();
	double x = (x2 - x1);
	double y = (y2 - y1);
	m = std::abs(std::pow(x, 2) + std::pow(y, 2));
	return m;
}

std::ostream& operator<<(std::ostream& os, const Triangle& tri)
{
	std::string s = "";
	Triangle t = tri;
	for (size_t i = 0; i < 3; i++)
	{
		os << t.vertices[i] << "; ";
	}
	return os;
}