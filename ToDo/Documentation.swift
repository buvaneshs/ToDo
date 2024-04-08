
/*
MCQs:
Answer:
1. What is Swift’s type inference?
a. It allows developers to assign a variable without specifying its data type.
 
2. What is a closure in Swift?
A function that can capture and store references to any constants and variables from the
context in which it is defined
 
3. What is a protocol in Swift?
a. A blueprint for a class, struct, or enumeration
 
What is the difference between a class and a struct in Swift?
a. A class is a reference type, and a struct is a value type.
 
5. What is an optional in Swift?
b. A way to define a property that may or may not have a value.
 
 
2. Theoretical Questions:
Answer:
 
How does Swift implement computed properties? Give an example with code to depict
the same.
  In computed property, we can't assign a default value to the property because the value should be assigned to the property at runtime, and computed property provides a getter and an optional setter to indirectly access other properties and values. Also, computed property cannot be declared with the let key word because it's a constant and the initial value should be calculated and never changed, so we need to use the Var keyword.
For Example:
struct AmountCalculated {
    var amount :Int
    var intrest : Int
    var year : Int
    var simpleIntrest : Int
    
    {
        get {
            return (amount * intrest * year) / 100
        }
    }
}
 
let Calculate = AmountCalculated(amount: 2000, intrest: 10, year: 2)
print("intrest amount,\(Calculate.simpleIntrest)")
 
2.How does the iOS App Lifecycle work, and what are the main methods associated with
it?
  It is a sequence of events that occurs between the launch and termination of the applications. So in our application, mostly it comes with five states. Initially, our application is not in the in the running state, which means it is not executing any code and is not even in memory. And whenever we click on the application, it directly goes to the inactive state, which means the application is running but not receiving any events. After that, it will go into an active state, which means we are ready to interact with our application. So basically, it executes the code and receives events. So in the scenario, we are in the foreground. If we receive any phone call, the application directly goes to the inactive state and is still in the foreground. After the movement, if we make the phone call, it will return to its active state. Suppose if we click on the Home button, it will go to inactive state, and then it will go to background, still executing the code. For any other reason if we free up the space the application moved to not running state.
 
3. What is a retain cycle in iOS, and how can you prevent it? Give an example.
So ARC in our system is simply tracking our system memory. So if, when creating a class, two more variables are pointing to the same object, the arc will be created, which means how many strong references are pointing to the same object and the class instance cannot be deallocated until one strong reference points to the class instance. So for that, we need to deallocate the memory. When the object is deallocated, the memory object occupied by it is freed, and we can avoid the strong reference using weak and unwond.
Example For Weak:
func showData() async {
  loadImage(from: imageURL) { [weak self] newImage in.
    DispatchQueue.main.async {
      self?.imageView.image = newImage
    }
  }
}
 
Example For Unwond:
func showData() async {
  ...
  loadImage(from: imageURL) { [unowned self] newImage in
    DispatchQueue.main.async {
      imageView.image = newImage
    }
  }
  ...
}
 
 
4. Describe the 'defer' statement in Swift.
 
In Swift, the `defer` statement is used to execute a set of code or some business logic you want to run just before the current scope is exited. We can achieve the solution by using the defer statement. If you declare multiple defers in a function, It will execute the last defer to the first statement and finally execute the return.
 
 
5. Describe copy-on-write in Swift.
Copy-on-Write, or Cow for short, is a memory optimization technique that Swift employs that makes sure memory is not wasted. It delays copying until someone tries to alter the shared data.
copy-on-write is used to optimize performance, thus, it should affect the data structure which could potentially cost a lot of memory. To match with this proposal, there are array, string, dictionaries
 
 
 
 
3. Coding Questions:
Answer:
Given below is a Swift code snippet for an iOS app that calculates the area of rectangle. However, there is a bug in the code that prevents it from functioning correctly. Your task is to identify and fix the bug to ensure the code performs its
intended functionality.
Answer:
import UIKit
class Rectangle {
var width: Double
var height: Double
init(width: Double, height: Double) {
self.width = width
self.height = height
}
func calculateArea() -> Double {
return width * height
}
}
let myRect = Rectangle(width: 5.0, height: 4.0)
let area = myRect.calculateArea()
print("The area of the rectangle is: \(area)")
 
 
Given below is a Swift code snippet for an iOS app that performs a bubblesort on an array . However, there is a bug in the code that prevents it from functioning correctly. Your task is to identify and fix the bug to ensure the code
performs its intended functionality.
Answer:
 
import UIKit
func bubbleSort(arr: [Int]) -> [Int] {
var sortedArray = arr
let n = sortedArray.count
for i in 0..<n {
for j in 0..<n - i - 1 {
if sortedArray[j] > sortedArray[j + 1] {
let temp = sortedArray[j]
sortedArray[j] = sortedArray[j + 1]
sortedArray[j + 1] = temp
}
}
}
return sortedArray
}
let unsortedArray = [5, 3, 7, 2, 8, 1]
let sortedArray = bubbleSort(arr: unsortedArray)
print("Sorted array: \(sortedArray)")
has context menu
Compose
*/
