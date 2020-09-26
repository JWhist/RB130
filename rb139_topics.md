### Closures
Closures are a chunk of code which can be saved and executed later.  They contain a 'binding' which is a reference to the surrounding artifacts at the tiime of their creation, including classes, methods, local variables, and variable scope.

#### Three types of closures in Ruby
1. Block 
2. Proc
    * Object of the Proc class, it is argument agnostic.  A return initiated within a proc returns from the method in which it was called.
3. Lambda
    * Object of the Proc class, but a special case.  A lambda enforces its arguments.  A return initiated within a lambda returns from the lambda back to the method in which it was called.

Blocks, Procs and Lambdas all have return values that need to be considered when writing method definitions.

### Calling Methods with Blocks

Blocks can be passed explictly or implicitly:

```
def explicit(&block)
end

def implicit
end
```

When passed explicity, the `&` symbol converts the block to a `Proc` object.  The `Proc` object can then be either called or yielded to using `block.call` or the `yield` keyword (`yield if block_given?`).  The advantage of this method is that the Proc has a named variable that can be passed around to other methods and interacted with.

When passed implicitly, the block remains hidden away in Ruby's memory to be called using the `yield` keyword.  If a `yield` keyword exists in a method and no block is passed in, a `LocalJumpError` will be raised.

### Blocks with Parameters

Blocks can be defined with parameters as we have seen throughout the first two courses by surrounding the variable name with pipes (`{ |param| <code> }`).  When the block is called within the method, arguments are passed to the `yield` or `Proc#call` method and then passed to the block and assigned to the block parameter. 

*Arity* are the rules regarding the number of arguments that you can pass to a block, Proc, or lambda.

### When to use Blocks with your own methods

1. To defer some implementation to method invocation decision; aka, to allow the user to define how the method will operate to some degree.  For instance, think of the map or select methods.  They do not execute until they know the criteria which is sent in the block.
2. Methods that need to perfrom sandwich code; ie, 'Before and After' code.  Some examples of this could include benchmarking, opening and closing files (while manipulating them in between), or taking input that will be passed to the block prior to executing it.

### `&:symbol`

#### How the `&` works outside of method definitions

* Ruby checks whether the object is a `Proc` object; if not will check to see if the object has a to_proc method defined.  If it does, it will invoke that method and see if a `Proc` object is returned.  If not, an error is raised.  If so, then
* Ruby will convert the `Proc` into a block that executes the given method matching the symbol name as it is found up the ancestor lookup path.

