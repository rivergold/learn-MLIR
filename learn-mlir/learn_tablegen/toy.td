// #ifndef TOY_OPS
// #define TOY_OPS

include "mlir/IR/OpBase.td"

def Toy_Dialect : Dialect {
 let summary = "Toy IR Dialect";
 let description = [{
 This is a much longer description of the
 Toy dialect.
 ...
 }];
 // The namespace of our dialect.
 let name = "toy";
 // The C++ namespace that the dialect class
 // definition resides in.
 let cppNamespace = "toy";
}


// #endif