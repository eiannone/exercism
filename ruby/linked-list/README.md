# Linked List

Implement a doubly linked list

Like an array, a linked list is a simple linear data structure. Several 
common data types can be implemented using linked lists, like queues, 
stacks, and associative arrays.

A linked list is a collection of data elements called *nodes*. In a 
*singly linked list* each node holds a value and a link to the next node. 
In a *doubly linked list* each node also holds a link to the previous 
node.

You will write an implementation of a doubly linked list. Implement a 
Node to hold a value and pointers to the next and previous nodes. Then 
implement a List which holds references to the first and last node and 
offers an array-like interface for adding and removing items:

* `push` (*insert value at back*);
* `pop` (*remove value at back*);
* `shift` (*remove value at front*).
* `unshift` (*insert value at front*);

To keep your implementation simple, the tests will not cover error 
conditions. Specifically: `pop` or `shift` will never be called on an 
empty list.

If you want to know more about linked lists, check [Wikipedia](https://en.wikipedia.org/wiki/Linked_list).

* * * *

For installation and learning resources, refer to the
[exercism help page](http://exercism.io/languages/ruby).

For running the tests provided, you will need the Minitest gem. Open a
terminal window and run the following command to install minitest:

    gem install minitest

If you would like color output, you can `require 'minitest/pride'` in
the test file, or note the alternative instruction, below, for running
the test file.

In order to run the test, you can run the test file from the exercise
directory. For example, if the test suite is called
`hello_world_test.rb`, you can run the following command:

    ruby hello_world_test.rb

To include color from the command line:

    ruby -rminitest/pride hello_world_test.rb

The test files may have the execution bit set so you may also be able to
run it like this:

    ./hello_world_test.rb

## Source

Classic computer science topic
