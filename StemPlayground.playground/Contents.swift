//: STEM - Swift Tensor Extension for Machine-Learning
//: ==================================================

// standard imports
import Cocoa
import stem
import XCPlayground

//: Convenience aliases
//: -------------------
typealias Vec = Vector<NativeStorage<Double>>
typealias RowVec = RowVector<NativeStorage<Double>>
typealias ColVec = ColumnVector<NativeStorage<Double>>
typealias Mat = Matrix<NativeStorage<Double>>

//: Creating vectors
//: ----------------
let v1 = Vec([1, 2, 3, 4])
print("\(v1)")

let v2 = ColVec([1, 2, 3, 4])
print("\(v2)")

let v3 = RowVec([1, 2, 3, 4])
print("\(v3)")

let v4 = Vec([1, 2, 3, 4], axis: 0)
print("\(v4)")

let v5 = Vec([1, 2, 3, 4], axis: 1)
print("\(v5)")

let v6 = Vec([1, 2, 3, 4], axis: 2)
print("\(v6)")

//: Vector indexing
//: ---------------

// single element (results in a scalar)
let d1:Double = v1[0]
let d2:Double = v1[1]


//: Vector operations
//: -----------------

let v7 = try v1+v1
let v8 = 0.5*v1
let v9 = v1**2

let v10 = RowVec([2, 2, 2, 2])


// Hadamard product
let v11 = try v10*v2

// dot product
let v12 = try v10⊙(v2+v2)

// outer product
let v13 = try v10⊗(v2+v2)
print("\(v13)")

//: Matrix operations
//: -----------------
let m1 = Mat([[1, 2, 3], [4, 5, 6]])
print("\(m1)")

let v14 = ColVec([1, 1, 1])
let v15 = try m1⊙v14

let m2 = Mat([[1, 2, 3], [1, 2, 3]])
let m3 = try m1⊙m2
print("\(m3)")
