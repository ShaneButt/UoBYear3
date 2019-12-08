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

double Triangle::Perimeter()
{
	double p = 0;
	Vertex* verts = GetVertices();
	for (size_t i = 0; i < 3; i++)
	{
		if (i == 2) {
			p += PointMagnitude(verts[i], verts[0]);
		}
		else {
			p += PointMagnitude(verts[i], verts[i + 1]);
		}
	}
	perimeter = p;
	return perimeter;
}

double Triangle::Area()
{
	Vertex* verts = GetVertices();
	Vertex& A = verts[0];
	Vertex& B = verts[1];
	Vertex& C = verts[2];
	double Ax = A.GetX(), Ay = A.GetY();
	double Bx = B.GetX(), By = B.GetY();
	double Cx = C.GetX(), Cy = C.GetY();
	area = std::abs(((Ax * (By - Cy)) + (Bx * (Cy - Ay)) + (Cx * (Ay - By))) / 2);
	return area;
}

double Triangle::PointMagnitude(Vertex a, Vertex b)
{
	double m;
	double x1 = a.GetX(), y1 = a.GetY();
	double x2 = b.GetX(), y2 = b.GetY();
	double x = (x2 - x1);
	double y = (y2 - y1);
	m = std::sqrt(std::pow(x, 2) + std::pow(y, 2));
	return m;
}

std::ostream& operator<<(std::ostream& os, const Triangle& tri)
{
	Triangle t = tri;
	for (size_t i = 0; i < 3; i++)
	{
		os << t.vertices[i] << "; ";
	}
	return os;
}