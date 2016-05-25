//
//  graph3.swift
//  stem
//
//  Created by Schneider, Abraham R. on 4/10/16.
//  Copyright © 2016 none. All rights reserved.
//

import Foundation


public protocol Traversal {
    associatedtype StorageType:Storage
//    var ops:[AnyOp<StorageType>] { get }
    var ops:[Op<StorageType>] { get }
    func apply(fn:(Op<StorageType>) -> ())
}

public class SequentialTraversal<StorageType:Storage where StorageType.ElementType:FloatNumericType>: Traversal {
    public var ops:[Op<StorageType>] = []
    
    public init() {}
    
    public init(_ ops:Op<StorageType>...) {
        self.ops = ops
    }
    
//    public func add<Op:Operation where Op.StorageType == S>
    public func add(op:Op<StorageType>)
    {
//        ops.append(AnyOp<StorageType>(op))
        ops.append(op)
    }
    
    public func apply(fn:(Op<StorageType>) -> ()) {
        for op in ops {
            fn(op)
        }
    }
}

// deps:
// input: tonode[0], tonode[1], ..., tonode[N]
//
// bdeps
// fromnode[0]: input
// fromnode[1]: input
public func calcDependencies<S:Storage>(ops:[Op<S>]) -> ([Op<S>:[Op<S>]], [Op<S>:[Op<S>]], [Op<S>], [Op<S>]) {
    var fdeps:[Op<S>:[Op<S>]] = [:]
    var bdeps:[Op<S>:[Op<S>]] = [:]
    var roots = [Op<S>]()
    
    for op in ops {
        if op.inputs.count == 0 {
            roots.append(op)
        } else {
            for input in op.inputs {
                if var dep = fdeps[input] {
                    dep.append(op)
                } else {
                    fdeps[input] = [op]
                    bdeps[op] = [input]
                }
            }
        }
    }
    
    let terminals:[Op<S>] = fdeps.filter { $1.count == 0 }.map { $0.0 }
    
    return (fdeps, bdeps, terminals, roots)
}

// TODO: if using extensions, need to allow function to be call to be
// parameterized (apply or applyGradient)
public class Graph<S:Storage>: Traversal {
    public var ops:[Op<S>] = []
    public var deps:[Op<S>:[Op<S>]] = [:]
    public var inputs:[Op<S>] = []
    
    public init() {}
    
    public init(_ ops:[Op<S>], inputs:[Op<S>], deps:[Op<S>:[Op<S>]]) {
        self.ops = ops
        self.inputs = inputs
        self.deps = deps
    }
    
    public func apply(fn:(Op<S>) -> ()) {
        traverse(inputs, fn: fn)
    }
    
    func traverse(sub:[Op<S>], fn:(Op<S>) -> ()) {
        var next:[Op<S>] = []
        for op in sub {
            op.apply()
            
            if let nextOps = deps[op] {
                next.appendContentsOf(nextOps)
            }
        }
            
        if next.count > 0 {
            traverse(next, fn: fn)
        }
    }
}


// [A] -> [B] -> [C]
// C: inputs: [], output
public class GradNetwork<S:Storage> {
    public var forwardGraph:Graph<S>
//    public var backwardGraph:Graph<S>
    public var fdeps:[Op<S>:[Op<S>]]
    public var bdeps:[Op<S>:[Op<S>]]
    public var inputs:[Op<S>]
    public var binputs:[Op<S>]
    
    public init(_ ops:[Op<S>]) {
        (fdeps, bdeps, inputs, binputs) = calcDependencies(ops)
        forwardGraph = Graph<S>(ops, inputs: inputs, deps: fdeps)
        
        
        //backwardGraph = Graph<S>(ops, inputs: inputs, deps: bdeps)
        // use bdeps to construct backwardGraph
//        var bops = [Op<S>]()
//        for (to, from) in bdeps {
//            let opType = to.meta!["grad"]!
//            let bop = opType(inputs: from)
//        }
        
//        backwardGraph = Graph<S>(bops, inputs: binputs, deps: bdeps)
    }
    
    public convenience init(_ ops:Op<S>...) {
        self.init(ops)
    }
    
    public func forward() {
        forwardGraph.apply { $0.apply() }
    }
    
    // This won't work because we'd have to redefine AnyOp to include applyGradient
    public func backward() {
//        backwardGraph.apply { $0.apply() }
    }
}

