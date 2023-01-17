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
|  Function name   | Act     | Arity          |   Symbol |
|------|:--------------|:-----------:|--------------:|
| add | 与えられた2つの引数を足します。|2 | + |
| sub | 与えられた2つの引数を引きます。 例えば4と2が与えられた場合は2が返ります | 2 | - |
| mul | 与えられた2つの引数同士を掛け算します | 2 | × | 
| div | 割り算をします。10と5が与えられた場合は2が返ります。2つ目の引数に0が入ると1が返ります | 2 | / |
| mod| 割り算のあまりを求めます。2つの引数(arity)が与えられますが、2つ目の値に0が入ると0が返ります | ２  | % |
| log | ログを返します。　20, 3が与えられた場合 Log20 / Log 3を行います。　もし結果がnullやinfinityが返ってきた場合は0が返ります。 | 2 | log |
| XOR | 与えられた2数の排他的論理和を求めます。 | 2  |  ⊕ |
| minus | 与えられた数字にマイナスを付与します。-4 => 4, 9 => -9     | 1  | - |

## Using Function
