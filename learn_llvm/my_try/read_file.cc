#include <fstream>
#include <iostream>
#include <string>

int main(int argc, char *argv[]) {
  std::ifstream f;
  f.open("../my_try/example.toy");
  if (!f.is_open()) {
    std::cout << "open failed." << std::endl;
    return -1;
  }
  std::string code;
  while (f) {
    if (f.eof())
      break;
    std::cout << f.eof() << std::endl;
    std::getline(f, code);
    std::cout << code << std::endl;
  }
  std::cout << f.eof() << std::endl;

  std::cout << "---Read by char---" << std::endl;
  f.close();
  f.open("../my_try/example.toy");
  if (!f.is_open()) {
    std::cout << "open failed." << std::endl;
    return -1;
  }
  char c;
  while (f) {
    f.get(c);
    // c = static_cast<char>(f.peek());
    std::cout << c << std::endl;
  }
}