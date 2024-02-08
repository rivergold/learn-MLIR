#include <iostream>
#include <memory>

class Parent{
    public:
        Parent(){
            std::cout << "Parent constructor." << std::endl;
        };
        virtual ~Parent(){
            std::cout << "Parent destructor." << std::endl;
        }
        
        int x = 0;
};

class Child : public Parent{
    public:
        int y = 0;
    ~Child(){
        std::cout << "Child destructor" << std::endl;
    }
};


int main()
{
    Parent parent{};
    // std::shared_ptr<Parent> parent = std::make_shared<Parent>(Parent());
    std::cout << "ok" << std::endl;

    Child child{};
}