#include <iostream>
#include <string>
#include "Triangle.h"
#include "Vertex.h"

int main()
{
	std::string p1, p2, p3;
	std::cout << "Please enter the first Vertex" << std::endl;
	getline(std::cin, p1);
	std::cout << "Please enter the second Vertex" << std::endl;
	getline(std::cin, p2);
	std::cout << "Please enter the third Vertex" << std::endl;
	getline(std::cin, p3);

	Triangle t = Triangle::Triangle(p1, p2, p3);
	Vertex v1 = t.GetVertices()[0];
	std::cout << v1 << std::endl;
	return 0;
}