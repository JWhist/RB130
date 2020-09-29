Closures - A closure is a chunk of code which can be passed around and executed later, similar to a method call.  At the time of it's creation a snapshot of its surrounding scope and artifacts is created, called its binding, which stores available local variables, methods, and scoping rules.

Ruby implements closures in 3 ways - blocks, procs, and lambdas.

We can use a block when we want to delay implentation of code or sandwich it in between other operations, such as opening and closing a file.  We can create an object of the Proc class using Proc.new or the proc {} syntax.  This object can then be passed around or used as an argument to methods.  It is executed later using the Proc#call method.  If invoking a method, we can also pass in a block without creating a Proc object as Ruby allows all methods to implictly accept blocks.  The block can later be executed using the yield keyword with or without arguments.

Blocks create their own level of variable scoping.  Outer levels of scoping cannot access variables defined in inner scope, while inner scoped blocks can access data from the outer scope.  These scoping rules are retained even after the block is passed in as an argument to a method for which the variables might have otherwise been out of scope.

Testing - 

Assertion - value/result to be compared against that produced by the code being tested

Test - one or more assertions being run with a common set of objects/setup

Test Suite - one or more tests being run, with setup and teardown being executed prior to and after each run.

Expectation Syntax - Rspec style describe using DSL language 
Assertion Syntax - Ruby 'Method Definition' sytle test writing

minitest vs Rspec - Minitest is part of rubys base install, Rspec is a gem.  They do the same thing overall, Rspec uses expectation syntax, minitest can use either expectation or assertion syntax.  In minitest, they refer to 'assertions', in rspec they are called 'specs'

SEAT approach
Setup - before/after each test.  Create objects/open files/initialize etc
Execute - Run the tests
Assert - Compare the results, find discrepancies
Teardown - before/after each test.  Close files/reset class values etc

Assertions - Different ways of comparing expected vs actual results of testing calls.  assert_equal uses == comparison.  assert_output, assert_nil assert_instance_of etc etc.  There are also refute comparisons which are the opposite of assertions
