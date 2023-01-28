# tsunami

A parallel tsunami simulator.
Companion running example for [Modern Fortran: Building Efficient Parallel Applications](https://www.manning.com/books/modern-fortran?a_aid=modernfortran&a_bid=2dc4d442).

## Organization

* [**Chapter 2**](https://github.com/modern-fortran/tsunami/tree/master/src/ch02): We implement our first working solver which solves for linear advection of a wave in one dimension.
First encounter with declaration, variables, loops, branches, arithmetic, and writing to console.
* [**Chapter 3**](https://github.com/modern-fortran/tsunami/tree/master/src/ch03): We refactor our program from Chapter 2 to use procedures -- 
a finite difference function and a subroutine to set initial conditions.
* [**Chapter 4**](https://github.com/modern-fortran/tsunami/tree/master/src/ch04): We refactor our program from Chapter 3 to define the procedures in external modules. 
We use this opportunity to augment the simulator to solve for non-linear gravity waves.
* [**Chapter 7**](https://github.com/modern-fortran/tsunami/tree/master/src/ch07): We parallelize the program from Chapter 4 using coarrays and observe the speed up.
* [**Chapter 8**](https://github.com/modern-fortran/tsunami/tree/master/src/ch08): We refactor our program from Chapter 7 to model our physical quantities (water height and velocity)
using a derived type, and implement common arithmetic operations as type-bound methods.
* [**Chapter 10**](https://github.com/modern-fortran/tsunami/tree/master/src/ch10): We continue working on the code from Chapter 9 and overload the assignment operator to 
automatically synchronize the data across parallel images on every assignment.
* [**Chapter 12**](https://github.com/modern-fortran/tsunami/tree/master/src/ch12): In the final chapter, we revisit the parallel code from Chapter 10 and explore how Fortran 2018
Teams, Events, and Collectives can be used for some more advanced parallel patterns.

## Getting started

### Get the code

You can get the latest code by cloning the master branch:

```
git clone https://github.com/modern-fortran/tsunami
```

or by downloading it as a [zip file](https://github.com/modern-fortran/tsunami/archive/master.zip).

### Build the code

```
cd tsunami
make -k
```

You can compile the tsunami versions in chapters 2, 3, and 4
with gfortran alone.
For the code in chapters 7, 8, 10, and 12, you'll need the latest
stable build of OpenCoarrays, which will give you the `caf` 
compiler wrapper.

### Set up the Python environment for visualization (optional)

Python scripts are provided to visualize tsunami output.

```
python3 -m venv venv
source venv/bin/activate
pip install -U pip
pip install -U -r requirements.txt
```

## Parallel scaling

From Chapter 7 and onward, your tsunami program will be parallel. You may notice
that running the program in parallel may be as fast as running it in serial, and
perhaps even slower. This is because by default, the grid size is small enough
for the program to complete in a short time on a single CPU. Specifically, in
src/ch07/tsunami.f90:

```
  integer(int32), parameter :: grid_size = 100 ! grid size in x
```

is a very small grid. Further dividing it to multiple CPU cores may not yield
enough computation load to compensate for the added communication load. Further,
near the end of the main time loop, we gather the data to the first image and
write it to screen in every time step:

```
    ! gather to image 1 and write current state to screen
    gather(is:ie)[1] = h(ils:ile)
    sync all
    if (this_image() == 1) print fmt, n, gather
```

which significantly adds to the communication. Recall that we want to maximize
computation and minimize communication for best parallel scalability results.

To observe parallel speed-up with your tsunami program with increasing number
of CPUs, make the following changes to the code:

1. Increase `grid_size`. You can go as high as you want given enough RAM.
2. Reduce output in the time loop from every time step, to perhaps every 10th
   or 100th steps. These are just examples; pick the output frequency that
   works best for you.


```commandline

PART 1 
GETTING STARTED WITH MODERN FORTRAN
 
1 Introducing Fortran
1.5 Parallel Fortran
1.6 What will you learn in this book
1.7 Think parallel!
1.8 Running example: A parallel tsunami simulator
1.9 Further reading 

2 Getting started: Minimal working app 
2.1 Compiling and running your first program 
2.2 Simulating the motion of an object 
2.3 Implementing the minimal working app
2.4 Going forward with the tsunami simulator 
2.5 Answer key
2.6 New Fortran elements at a glance
2.7 Further reading

PART 2 
CORE ELEMENTS OF FORTRAN
3 Writing reusable code with functions and subroutines 
3.1 Toward higher app complexity 
3.2 Don’t repeat yourself, use procedures 
3.3 Modifying program state with subroutines
3.4 Writing pure procedures to avoid side effects 
3.5 Writing procedures that operate on both scalars and arrays 
3.6 Procedures with optional arguments 
3.7 Tsunami simulator: Putting it all together 
3.8 Answer key 
3.9 New Fortran elements, at a glance 
3.10 Further reading 

4 Organizing your Fortran code using modules 
4.1 Accessing a module 
4.2 Creating your first module 
4.3 Toward realistic wave simulations
4.4 Answer key 
4.5 New Fortran elements, at a glance 
4.6 Further reading 
5 Analyzing time series data with arrays 
5.1 Analyzing stock prices with Fortran arrays 
5.2 Finding the best and worst performing stocks 
5.3 Identifying risky stocks 
5.4 Finding good times to buy and sell 
5.5 Answer key 
5.6 New Fortran elements, at a glance 
5.7 Further reading 
6 Reading, writing, and formatting your data 
6.1 Your first I/O: Input from the keyboard and output to the screen 
6.2 Formatting numbers and text 
6.3 Writing to files on disk
6.4 Answer key 168
6.5 New Fortran elements, at a glance
PART 3 
ADVANCED FORTRAN USE
7 Going parallel with Fortran coarrays
7.1 Why write parallel programs? 
7.2 Processing real-world weather buoy data 
7.3 Parallel processing with images and coarrays 
7.4 Coarrays and synchronization, explained 
7.5 Toward the parallel tsunami simulator 
7.6 Answer key 
7.7 New Fortran elements, at a glance 
7.8 Further reading 
8 Working with abstract data using derived types 
8.1 Recasting the tsunami simulator with derived types 
8.2 Defining, declaring, and initializing derived types 
8.3 Binding procedures to a derived type 
8.4 Extending tsunami to two dimensions 
8.5 Answer key 
8.6 New Fortran elements, at a glance 
8.7 Further reading 
9 Generic procedures and operators for any data type 
9.1 Analyzing weather data of different types 
9.2 Type systems and generic procedures 
9.3 Writing your first generic procedure 
9.4 Built-in and custom operators 
9.5 Generic procedures and operators in the tsunami simulator 
9.6 Answer key 
9.7 New Fortran elements, at a glance 
10 User-defined operators for derived types 
10.1 Happy Birthday! A countdown app 
10.2 Getting user input and current time 
10.3 Calculating the difference between two times 
10.4 Overriding operators in the tsunami simulator 
10.5 Answer key 
10.6 New Fortran elements, at a glance 
PART 4 
THE FINAL STRETCH
11 Interoperability with C: Exposing your app to the web 
11.1 Interfacing C: Writing a minimal TCP client and server 
11.2 TCP server program: Receiving network connections 
11.3 TCP client program: Connecting to a remote server 
11.4 Some interesting mixed Fortran-C projects 
11.5 Answer key 
11.6 New Fortran elements, at a glance 
11.7 Further reading 
12 Advanced parallelism with teams, events, and collectives 
12.1 From coarrays to teams, events, and collectives 
12.2 Grouping images into teams with common tasks 
12.3 Posting and waiting for events 
12.4 Distributed computing using collectives 
12.5 Answer key 347
12.6 New Fortran elements, at a glance 
12.7 Further reading 
```