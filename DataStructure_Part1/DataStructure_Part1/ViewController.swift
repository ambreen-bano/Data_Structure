//
//  ViewController.swift
//  DataStructure_Part1
//
//  Created by Ambreen Bano on 22/09/25.
//


import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        stackExample()
        stackExample1()
        
        queueExample()
        queueExample1()
        
        linkedListExample()
        
        stackLLExample()
        queueLLExample()
    }
    
    
    func stackLLExample(){
        let myStack = stackLL()
        
        myStack.push(element: 19)
        myStack.push(element: 20)
        myStack.push(element: 21)
        myStack.push(element: 22)
        
        let element = myStack.pop()
        print("Stack Using LL Pop = ", element)
        
        let elementp = myStack.peak()
        print("Stack Using LL Peak = ", elementp)
        
    }
    
    func queueLLExample(){
        let myQueue = QueueLL()
        
        myQueue.enqueue(item: 19)
        myQueue.enqueue(item: 20)
        myQueue.enqueue(item: 21)
        myQueue.enqueue(item: 22)
        
        let element = myQueue.dequeue()
        print("Queue Using LL Pop = ", element)
        
        let elementp = myQueue.peak()
        print("Queue Using LL Peak = ", elementp)
        
    }
    
    func linkedListExample(){
        let ll = LinkedList()
        ll.printLL()
        
        ll.head = Node(data: 9)
        ll.printLL()
        
        ll.insert(node: Node(data: 4))
        ll.insert(node: Node(data: 5))
        ll.printLL()
        
        _ = ll.deleteFirst()
        ll.printLL()
        
        ll.insertAt(at: 0, item: Node(data: 22))
        ll.insertAt(at: 1, item: Node(data: 23))
        ll.printLL()
        
        ll.delete(item: 4)
        ll.printLL()
        
        ll.reverse()
        ll.printLL()
    }
    
    func stackExample(){
        let myStack = stack()
        print("values = ", myStack.stackValues)
        myStack.push(8)
        print("after pushing 8, values = ", myStack.stackValues)
        print("total Count = ", myStack.stackValues.count)
        myStack.push(10)
        myStack.push(13)
        let popElement = myStack.pop()
        print("Pop = ", popElement)
        
        if myStack.isEmpty() == false {
            let peakElement = myStack.peak()
            print("Peak = ", peakElement)
        }
    }
    
    func stackExample1(){
        let myStack = stack1()
        myStack.push(18)
        myStack.push(20)
        myStack.push(193)
        let popElement = myStack.pop()
        print("\nPop = ", popElement)
        
        if myStack.isEmpty() == false {
            let peakElement = myStack.peak()
            print("Peak = ", peakElement)
        }
    }
    
    func queueExample(){
        let myQueue = Queue()
        myQueue.enqueue(1)
        myQueue.enqueue(6)
        myQueue.enqueue(10)
        myQueue.enqueue(2)
        let popElement = myQueue.dequeue()
        print("\nDequeue = ", popElement)
        
        if myQueue.isEmpty() == false {
            let peakElement = myQueue.peak()
            print("Peak = ", peakElement)
        }
    }
    
    func queueExample1(){
        let myQueue = Queue1()
        myQueue.enqueue(11)
        myQueue.enqueue(61)
        myQueue.enqueue(4)
        myQueue.enqueue(5)
        let popElement = myQueue.dequeue()
        print("\nDequeue = ", popElement)
        
        if myQueue.isEmpty() == false {
            let peakElement = myQueue.peak()
            print("Peak = ", peakElement)
        }
    }
}




/***************************Stack Using Array *********************/


class stack {
    var stackValues:[Int] = []
    
    init(){
        //array having no elements but can store 10 values
        stackValues.reserveCapacity(10)
    }
    
    func push(_ item: Int){
        stackValues.append(item)
    }
    
    func pop()-> Int{
        return stackValues.removeLast()
    }
    
    func peak()-> Int{
        return stackValues[stackValues.count - 1]
    }
    
    func isEmpty() -> Bool{
        return stackValues.count == 0
    }
}

class stack1{
    var top = -1
    var values = Array(repeating: -1, count: 10) //array having 10 elements of -1 value
    
    init(){
        
    }
    
    func push(_ item : Int){
        top = top + 1
        values[top] = item
    }
    
    func pop() -> Int{
        top = top - 1
        return values[top + 1]
    }
    
    func peak() -> Int{
        return values[top]
    }
    
    func isEmpty()->Bool{
        return top == -1
    }
}






/***************************Queue Using Array *********************/


class Queue {
    var queueValues : [Int] = []
    
    init(){
    }
    
    func enqueue(_ item: Int){
        queueValues.append(item)
    }
    
    func dequeue()-> Int{
        return queueValues.removeFirst()
    }
    
    func peak() -> Int{
        return queueValues[0]
    }
    
    func isEmpty()-> Bool{
        return queueValues.count == 0
    }
}


class Queue1 {
    var front = -1
    var rear = -1
    var queueValues : [Int] = Array(repeating: -1, count: 10)
    
    init(){
    }
    
    func enqueue(_ item: Int){
        if isEmpty() {
            front = front + 1
            rear = rear + 1
        } else {
            rear = rear + 1
        }
        queueValues[rear] = item
    }
    
    func dequeue()-> Int{
        var item = -1
        if isEmpty() == false {
            item = queueValues[front]
            if front == rear {
                front = -1
                rear = -1
            } else {
                front = front + 1
            }
        }
        return item
    }
    
    func peak() -> Int{
        return queueValues[front]
    }
    
    func isEmpty()-> Bool{
        return front == -1 && rear == -1
    }
}





/***************************Linked List*********************/

class Node {
    var data: Int
    var next: Node? = nil
    
    init(data:Int) {
        self.data = data
    }
}

class LinkedList {
    var head : Node? = nil
    
    init(){
        
    }
    func isEmpty()-> Bool{
        return head == nil
    }
    
    func LinkedListHead()-> Node?{
        return head
    }
    
    func count()-> Int{
        var LLCount = 0
        if isEmpty() == false {
            var node = head
            while node != nil {
                LLCount = LLCount + 1
                node = node?.next
            }
        }
        return LLCount
    }
    
    //insert in the starting
    func insert(node: Node){
        let newNode = node
        newNode.next = head
        head = newNode
    }
    
    //delete from the starting
    @discardableResult func deleteFirst()-> Node?{
        let deletedNode = head
        if isEmpty() == false{
            head = head?.next
        }
        return deletedNode
    }
    
    //Print LL
    func printLL(){
        if isEmpty(){
            print("Empty LL ")
        } else {
            var node = head
            print("\n LL =  ")
            while (node != nil) {
                if let data = node?.data{
                    print("-> ", data)
                }
                node = node?.next
            }
        }
    }
    
    @discardableResult func insertAt(at index: Int, item: Node) -> Bool {
        let llCount = count()
        if llCount < index {
            return false
        } else {
            var curr = head
            var prev: Node? = nil
            var  counter = 0
            if index == 0 {
                item.next = head
                head = item
            } else {
                while curr != nil {
                    if counter == index {
                        prev?.next = item
                        item.next = curr
                        break
                    }
                    prev = curr
                    curr = curr?.next
                    counter = counter + 1
                }
            }
        }
        return false
    }
    
    func delete(item: Int) {
        if head?.data == item {
            head = head?.next
        } else {
            var node = head
            var prev: Node? = nil
            while node != nil {
                if node?.data == item {
                    prev?.next = node?.next
                    break
                }
                prev = node
                node = node?.next
            }
        }
    }
    
    func reverse(){
        var prev: Node? = nil
        var currNext: Node? = nil
        var curr = head
        
        while curr != nil {
            currNext = curr?.next
            curr?.next = prev
            prev = curr
            curr = currNext
        }
        head = prev
    }
}





/***********************Stack Using LL**********************/

class stackLL{
    var stacklinkedList = LinkedList()
    
    init(){
    }
    
    func push(element: Int){
        stacklinkedList.insertAt(at: 0, item: Node(data: element))
    }
    
    func pop()-> Int{
        if let node = stacklinkedList.deleteFirst() {
            return node.data
        }
        return -1
    }
    
    func peak()-> Int {
        if let node = stacklinkedList.head {
            return node.data
        }
        return -1
    }
    
    func isEmpty()->Bool{
        return stacklinkedList.head == nil
    }
}






/***********************Queue Using LL**********************/
class QueueLL{
    
    var queueLLValues = LinkedList()
    
    func enqueue(item: Int){
        let newNode = Node(data: item)
        newNode.next = nil
        
        if let node = queueLLValues.head {
            var nodeN: Node? = node
            while nodeN?.next != nil {
                nodeN = nodeN?.next
            }
            nodeN?.next = newNode
        } else {
            queueLLValues.head = newNode
        }
    }
    
    func dequeue()-> Int{
        if let node = queueLLValues.head {
            queueLLValues.head = queueLLValues.head?.next
            return node.data
        }
        return -1
    }
    
    func peak()-> Int{
        if let node = queueLLValues.head{
            return node.data
        }
        return -1
    }
    
    func isEmpty()-> Bool{
        return queueLLValues.head == nil
    }
}
