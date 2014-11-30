// Playground - noun: a place where people can play

import UIKit

class BinaryTree {
    var value: Int!
    var left: BinaryTree?
    var right: BinaryTree?

    init(val: Int) {
        self.value = val
    }

    func insert(valueToInsert: Int) {
        //  Is value less than current value.
        if valueToInsert < self.value {
            //  Transverse to Left - Repeat on that Tree
            if let leftTree = self.left {
                leftTree.insert(valueToInsert)
            }
            //  Create new Tree on Left
            else {
                var leftTree = BinaryTree(val: valueToInsert)
                self.left = leftTree
            }
        }
        else if valueToInsert > self.value {
            //  Transverse to Right - Repeat on that Tree
            if let rightTree = self.right {
                rightTree.insert(valueToInsert)
            }
            //  Create new Tree on right
            else {
                var rightTree = BinaryTree(val: valueToInsert)
                self.right = rightTree
            }
        }
        else {
            println("Value already in Tree")
        }
    }
    
    func delete(valueToDelete: Int) {
        if valueToDelete < self.value {
            if let leftTree = self.left {
                if leftTree.value == valueToDelete {
                    leftTree.value = nil
                }
                else {
                    leftTree.delete(valueToDelete)
                }
            }
            else {
                println("Value is not in Tree")
            }
        }
        else if valueToDelete > self.value {
            if let rightTree = self.right {
                if rightTree.value == valueToDelete {
                    rightTree.value = nil
                }
                else {
                    rightTree.delete(valueToDelete)
                }
            }
            else {
                println("Value is not in Tree")
            }
        }
        else {
            println("Value is not in Tree")
        }
    }
}
