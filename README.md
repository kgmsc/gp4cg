# gp4cg

gp4cg is a program that uses genetic algorithms to automatically generate equations that fit a given sequence of numbers. 
It is implemented in Swift and uses symbolic regression to specialize in combinatorial game sequence search.
Genetic algorithms work by generating multiple candidate solutions, evaluating them, and then keeping the ones
that are the most highly evaluated to be passed on to the next generation. This allows the algorithm to find the optimal solution. gp4cg uses this approach to automatically generate equations that fit a given sequence of numbers. However, some sequences may not be able to be represented by a single equation, so the program may generate multiple equations to fit the sequence.

## Environment
Our program, gp4cg, can be run on both Mac OS and Windows as we only use the basic packages of swift. We have confirmed that it works on the following versions:

Note that we only use the basic packages of swift, so it can be run on both Mac OS and Windows. We have confirmed that the program works on the following versions:
- Mac OS: 13.1
- swift: 5.7.2

## Getting Started (for Mac user)
If you do not have Xcode installed, you will need to install it first.

1. Clone this repository:

```bash
git clone https://github.com/kgmsc/gp4cg
```

2. Open the project:

```bash
cd gp4cg
open gp4cg.xcodeproj
```

3. Sign in to Xcode.


4. Set the sequence you want to analyze in the following directory:

```
// Todo: csvから読めたほうがいいかも??
```


4. o run the program, click the play button in Xcode, or use the following command in the terminal:

```bash
swift build
```

4. Run

```bash
swift run gp4cg
```

Once you have the sequence in the proper directory, the program will analyze it and generate the fitting equation or equations.

## How to check the result 
- The output may take a few minutes depending on the number of numbers in the sequence. An example output is:
```
    Candidates
	 ((((1 - f(X1 - 2)) + f(X1 - 2)) ⊕ X0) + X1) ["Accuracy": 0.26022306]
	 ((((f(X1 - 2) / X1) ⊕ X0) - 3) + 3) ["Accuracy": 0.24907063, "MeanAbsoluteError2d": 0.01858736]
    Done in 0 sec...
Candidate Not Covered
```
In this example, the candidates selected were `((((1 - f(X1 - 2)) + f(X1 - 2)) ⊕ X0) + X1)` and `((((f(X1 - 2) / X1) ⊕ X0) - 3) + 3),` but the accuracy is not 1, so there is no equation that perfectly fits the sequence.


- The execution logs will be output to the following folder and saved as a log file:
```
Desktop/gp4cg/difficult1/log_yyyy_M_d_H_m_s/*.log
```

- The result will be output to the following folder and saved as a csv file: 
```
Desktop/gp4cg/difficult1/result_yyyy_M_d_H_m_s/*.csv
```

## How to change the parameters
- The parameters of the genetic algorithm can be changed in the following directory:
```
gp4cg/Sources/gp4cg/main.swift
```
```swift
let config = SymbolicRegressorConfiguration(populationSize: 10000, // can change populations
        generations: 20, // can change generations
        depthRange: 3..<4) // can change depth
```

## Using Function
| Function name | Action                                                                                                                        | Arity | Symbol |
|---------------|:------------------------------------------------------------------------------------------------------------------------------|:-----:|-------:|
| add           | Adds two given arguments together	                                                                                            |   2   |      + |
| sub           | Subtracts the second argument from the first. For example, if 4 and 2 are given, it returns 2                                 |   2   |      - |
| mul           | Multiplies the two given arguments together	                                                                                  |   2   |      × | 
| div           | 	Divides the first argument by the second. If 10 and 5 are given, it returns 2. If the second argument is 0, it returns 1     |   2   |      / |
| mod           | Returns the remainder of dividing the first argument by the second. If the second argument is 0, it returns 0.                |   ２   |      % |
| log           | Returns the logarithm. If 20 and 3 are given, it will perform log20 / log 3. If the result is null or infinity, it returns 0. |   2   |    log |
| XOR           | Returns the exclusive or of the two given arguments.                                                                          |   2   |      ⊕ |
| minus         | Appends a minus to the given number. -4 => 4, 9 => -9                                                                         |   1   |      - |

### Let's try it!