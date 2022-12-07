//
//  main.swift
//  gp4cg
//
//  Created by KeitoTanemura on 2022/11/09.
//

import Foundation
import TabularData

let teacherData =  [[0, 0, 1], [1, 0, 0], [2, 0, 2], [2, 1, 3], [3, 0, 5], [3, 1, 4], [3,
                                                                                       2, 7], [3, 3, 6], [4, 0, 7], [4, 1, 6], [4, 2, 5], [5, 0, 3], [5,
                                                                                      1, 2], [6, 0, 8], [6, 1, 9], [6, 2, 10], [6, 3, 11], [6, 4, 12], [6,
                                                                                       5, 13], [6, 6, 14], [6, 7, 15], [7, 0, 4], [7, 1, 5], [7, 2,
                                                                                      6], [7, 3, 7], [8, 0, 6], [8, 1, 7], [8, 2, 4], [9, 0, 12], [9, 1,
                                                                                      13], [9, 2, 14], [9, 3, 15], [9, 4, 8], [10, 0, 11], [10, 1,
                                                                                      10], [10, 2, 9], [10, 3, 8], [10, 4, 15], [10, 5, 14], [10, 6,
                                                                                      13], [11, 0, 10], [11, 1, 11], [11, 2, 8], [11, 3, 9], [11, 4,
                                                                                      14], [11, 5, 15], [11, 6, 12], [12, 0, 9], [12, 1, 8], [12, 2,
                                                                                      11], [12, 3, 10], [12, 4, 13], [12, 5, 12], [12, 6, 15], [12, 7,
                                                                                      14], [13, 0, 16], [13, 1, 17], [13, 2, 18], [13, 3, 19], [13, 4,
                                                                                      20], [13, 5, 21], [13, 6, 22], [13, 7, 23], [13, 8, 24], [13, 9,
                                                                                      25], [13, 10, 26], [13, 11, 27], [13, 12, 28], [13, 13, 29], [13,
                                                                                      14, 30], [13, 15, 31], [14, 0, 15], [14, 1, 14], [14, 2, 13], [14,
                                                                                      3, 12], [14, 4, 11], [14, 5, 10], [15, 0, 14], [15, 1, 15], [15, 2,
                                                                                      12], [15, 3, 13], [15, 4, 10], [15, 5, 11], [16, 0, 13], [16, 1,
                                                                                      12], [16, 2, 15], [16, 3, 14], [16, 4, 9], [17, 0, 20], [17, 1,
                                                                                      21], [17, 2, 22], [17, 3, 23], [17, 4, 16], [17, 5, 17], [17, 6,
                                                                                      18], [17, 7, 19], [17, 8, 28], [17, 9, 29], [17, 10, 30], [17, 11,
                                                                                      31], [17, 12, 24], [18, 0, 19], [18, 1, 18], [18, 2, 17], [18, 3,
                                                                                      16], [18, 4, 23], [18, 5, 22], [18, 6, 21], [18, 7, 20], [18, 8,
                                                                                      27], [18, 9, 26], [18, 10, 25], [18, 11, 24], [18, 12, 31], [18, 13,
                                                                                       30], [18, 14, 29], [19, 0, 18], [19, 1, 19], [19, 2, 16], [19, 3,
                                                                                      17], [19, 4, 22], [19, 5, 23], [19, 6, 20], [19, 7, 21], [19, 8,
                                                                                      26], [19, 9, 27], [19, 10, 24], [19, 11, 25], [19, 12, 30], [19, 13,
                                                                                       31], [19, 14, 28], [20, 0, 17], [20, 1, 16], [20, 2, 19], [20, 3,
                                                                                      18], [20, 4, 21], [20, 5, 20], [20, 6, 23], [20, 7, 22], [20, 8,
                                                                                      25], [20, 9, 24], [20, 10, 27], [20, 11, 26], [20, 12, 29], [20, 13,
                                                                                       28], [20, 14, 31], [20, 15, 30], [21, 0, 24], [21, 1, 25], [21, 2,
                                                                                      26], [21, 3, 27], [21, 4, 28], [21, 5, 29], [21, 6, 30], [21, 7,
                                                                                      31], [21, 8, 16], [22, 0, 23], [22, 1, 22], [22, 2, 21], [22, 3,
                                                                                      20], [22, 4, 19], [22, 5, 18], [22, 6, 17], [22, 7, 16], [22, 8,
                                                                                      31], [22, 9, 30], [22, 10, 29], [22, 11, 28], [22, 12, 27], [22, 13,
                                                                                       26], [23, 0, 22], [23, 1, 23], [23, 2, 20], [23, 3, 21], [23, 4,
                                                                                      18], [23, 5, 19], [23, 6, 16], [23, 7, 17], [23, 8, 30], [23, 9,
                                                                                      31], [23, 10, 28], [23, 11, 29], [23, 12, 26], [23, 13, 27], [24, 0,
                                                                                       21], [24, 1, 20], [24, 2, 23], [24, 3, 22], [24, 4, 17], [24, 5,
                                                                                      16], [24, 6, 19], [24, 7, 18], [24, 8, 29], [24, 9, 28], [24, 10,
                                                                                      31], [24, 11, 30], [24, 12, 25], [25, 0, 28], [25, 1, 29], [25, 2,
                                                                                      30], [25, 3, 31], [25, 4, 24], [25, 5, 25], [25, 6, 26], [25, 7,
                                                                                      27], [25, 8, 20], [25, 9, 21], [25, 10, 22], [25, 11, 23], [26, 0,
                                                                                      27], [26, 1, 26], [26, 2, 25], [26, 3, 24], [26, 4, 31], [26, 5,
                                                                                      30], [26, 6, 29], [26, 7, 28], [26, 8, 19], [26, 9, 18], [27, 0,
                                                                                      26], [27, 1, 27], [27, 2, 24], [27, 3, 25], [27, 4, 30], [27, 5,
                                                                                      31], [27, 6, 28], [27, 7, 29], [27, 8, 18], [27, 9, 19], [28, 0,
                                                                                      25], [28, 1, 24], [28, 2, 27], [28, 3, 26], [28, 4, 29], [28, 5,
                                                                                      28], [28, 6, 31], [28, 7, 30], [28, 8, 17], [29, 0, 32], [29, 1,
                                                                                      33], [29, 2, 34], [29, 3, 35], [29, 4, 36], [29, 5, 37], [29, 6,
                                                                                      38], [29, 7, 39], [29, 8, 40], [29, 9, 41], [29, 10, 42], [29, 11,
                                                                                      43], [29, 12, 44], [29, 13, 45], [29, 14, 46], [29, 15, 47], [29,
                                                                                      16, 48], [29, 17, 49], [29, 18, 50], [29, 19, 51], [29, 20,
                                                                                      52], [29, 21, 53], [29, 22, 54], [29, 23, 55], [29, 24, 56], [29,
                                                                                      25, 57], [29, 26, 58], [29, 27, 59], [29, 28, 60], [29, 29,
                                                                                      61], [29, 30, 62], [29, 31, 63], [30, 0, 31], [30, 1, 30], [30, 2,
                                                                                      29], [30, 3, 28], [30, 4, 27], [30, 5, 26], [30, 6, 25], [30, 7,
                                                                                      24], [30, 8, 23], [30, 9, 22], [30, 10, 21], [31, 0, 30], [31, 1,
                                                                                      31], [31, 2, 28], [31, 3, 29], [31, 4, 26], [31, 5, 27], [31, 6,
                                                                                      24], [31, 7, 25], [31, 8, 22], [31, 9, 23], [31, 10, 20], [32, 0,
                                                                                      29], [32, 1, 28], [32, 2, 31], [32, 3, 30], [32, 4, 25], [32, 5,
                                                                                      24], [32, 6, 27], [32, 7, 26], [32, 8, 21], [32, 9, 20], [32, 10,
                                                                                      23], [32, 11, 22], [33, 0, 36], [33, 1, 37], [33, 2, 38], [33, 3,
                                                                                      39], [33, 4, 32], [33, 5, 33], [33, 6, 34], [33, 7, 35], [33, 8,
                                                                                      44], [33, 9, 45], [33, 10, 46], [33, 11, 47], [33, 12, 40], [33, 13,
                                                                                       41], [33, 14, 42], [33, 15, 43], [33, 16, 52], [33, 17, 53], [33,
                                                                                      18, 54], [33, 19, 55], [33, 20, 48], [33, 21, 49], [33, 22,
                                                                                      50], [33, 23, 51], [33, 24, 60], [33, 25, 61], [33, 26, 62], [33,
                                                                                      27, 63], [33, 28, 56], [34, 0, 35], [34, 1, 34], [34, 2, 33], [34,
                                                                                      3, 32], [34, 4, 39], [34, 5, 38], [34, 6, 37], [34, 7, 36], [34, 8,
                                                                                      43], [34, 9, 42], [34, 10, 41], [34, 11, 40], [34, 12, 47], [34, 13,
                                                                                       46], [34, 14, 45], [34, 15, 44], [34, 16, 51], [34, 17, 50], [34,
                                                                                      18, 49], [34, 19, 48], [34, 20, 55], [34, 21, 54], [34, 22,
                                                                                      53], [34, 23, 52], [34, 24, 59], [34, 25, 58], [34, 26, 57], [34,
                                                                                      27, 56], [34, 28, 63], [34, 29, 62], [34, 30, 61], [35, 0, 34], [35,
                                                                                       1, 35], [35, 2, 32], [35, 3, 33], [35, 4, 38], [35, 5, 39], [35, 6,
                                                                                       36], [35, 7, 37], [35, 8, 42], [35, 9, 43], [35, 10, 40], [35, 11,
                                                                                      41], [35, 12, 46], [35, 13, 47], [35, 14, 44], [35, 15, 45], [35,
                                                                                      16, 50], [35, 17, 51], [35, 18, 48], [35, 19, 49], [35, 20,
                                                                                      54], [35, 21, 55], [35, 22, 52], [35, 23, 53], [35, 24, 58], [35,
                                                                                      25, 59], [35, 26, 56], [35, 27, 57], [35, 28, 62], [35, 29,
                                                                                      63], [35, 30, 60], [36, 0, 33], [36, 1, 32], [36, 2, 35], [36, 3,
                                                                                      34], [36, 4, 37], [36, 5, 36], [36, 6, 39], [36, 7, 38], [36, 8,
                                                                                      41], [36, 9, 40], [36, 10, 43], [36, 11, 42], [36, 12, 45], [36, 13,
                                                                                       44], [36, 14, 47], [36, 15, 46], [36, 16, 49], [36, 17, 48], [36,
                                                                                      18, 51], [36, 19, 50], [36, 20, 53], [36, 21, 52], [36, 22,
                                                                                      55], [36, 23, 54], [36, 24, 57], [36, 25, 56], [36, 26, 59], [36,
                                                                                      27, 58], [36, 28, 61], [36, 29, 60], [36, 30, 63], [36, 31,
                                                                                      62], [37, 0, 40], [37, 1, 41], [37, 2, 42], [37, 3, 43], [37, 4,
                                                                                      44], [37, 5, 45], [37, 6, 46], [37, 7, 47], [37, 8, 32], [37, 9,
                                                                                      33], [37, 10, 34], [37, 11, 35], [37, 12, 36], [37, 13, 37], [37,
                                                                                      14, 38], [37, 15, 39], [37, 16, 56], [37, 17, 57], [37, 18,
                                                                                      58], [37, 19, 59], [37, 20, 60], [37, 21, 61], [37, 22, 62], [37,
                                                                                      23, 63], [37, 24, 48], [38, 0, 39], [38, 1, 38], [38, 2, 37], [38,
                                                                                      3, 36], [38, 4, 35], [38, 5, 34], [38, 6, 33], [38, 7, 32], [38, 8,
                                                                                      47], [38, 9, 46], [38, 10, 45], [38, 11, 44], [38, 12, 43], [38, 13,
                                                                                       42], [38, 14, 41], [38, 15, 40], [38, 16, 55], [38, 17, 54], [38,
                                                                                      18, 53], [38, 19, 52], [38, 20, 51], [38, 21, 50], [38, 22,
                                                                                      49], [38, 23, 48], [38, 24, 63], [38, 25, 62], [38, 26, 61], [38,
                                                                                      27, 60], [38, 28, 59], [38, 29, 58], [39, 0, 38], [39, 1, 39], [39,
                                                                                      2, 36], [39, 3, 37], [39, 4, 34], [39, 5, 35], [39, 6, 32], [39, 7,
                                                                                      33], [39, 8, 46], [39, 9, 47], [39, 10, 44], [39, 11, 45], [39, 12,
                                                                                      42], [39, 13, 43], [39, 14, 40], [39, 15, 41], [39, 16, 54], [39,
                                                                                      17, 55], [39, 18, 52], [39, 19, 53], [39, 20, 50], [39, 21,
                                                                                      51], [39, 22, 48], [39, 23, 49], [39, 24, 62], [39, 25, 63], [39,
                                                                                      26, 60], [39, 27, 61], [39, 28, 58], [39, 29, 59], [40, 0, 37], [40,
                                                                                       1, 36], [40, 2, 39], [40, 3, 38], [40, 4, 33], [40, 5, 32], [40, 6,
                                                                                       35], [40, 7, 34], [40, 8, 45], [40, 9, 44], [40, 10, 47], [40, 11,
                                                                                      46], [40, 12, 41], [40, 13, 40], [40, 14, 43], [40, 15, 42], [40,
                                                                                      16, 53], [40, 17, 52], [40, 18, 55], [40, 19, 54], [40, 20,
                                                                                      49], [40, 21, 48], [40, 22, 51], [40, 23, 50], [40, 24, 61], [40,
                                                                                      25, 60], [40, 26, 63], [40, 27, 62], [40, 28, 57], [41, 0, 44], [41,
                                                                                       1, 45], [41, 2, 46], [41, 3, 47], [41, 4, 40], [41, 5, 41], [41, 6,
                                                                                       42], [41, 7, 43], [41, 8, 36], [41, 9, 37], [41, 10, 38], [41, 11,
                                                                                      39], [41, 12, 32], [41, 13, 33], [41, 14, 34], [41, 15, 35], [41,
                                                                                      16, 60], [41, 17, 61], [41, 18, 62], [41, 19, 63], [41, 20,
                                                                                      56], [41, 21, 57], [41, 22, 58], [41, 23, 59], [41, 24, 52], [41,
                                                                                      25, 53], [41, 26, 54], [41, 27, 55], [42, 0, 43], [42, 1, 42], [42,
                                                                                      2, 41], [42, 3, 40], [42, 4, 47], [42, 5, 46], [42, 6, 45], [42, 7,
                                                                                      44], [42, 8, 35], [42, 9, 34], [42, 10, 33], [42, 11, 32], [42, 12,
                                                                                      39], [42, 13, 38], [42, 14, 37], [42, 15, 36], [42, 16, 59], [42,
                                                                                      17, 58], [42, 18, 57], [42, 19, 56], [42, 20, 63], [42, 21,
                                                                                      62], [42, 22, 61], [42, 23, 60], [42, 24, 51], [42, 25, 50], [43, 0,
                                                                                       42], [43, 1, 43], [43, 2, 40], [43, 3, 41], [43, 4, 46], [43, 5,
                                                                                      47], [43, 6, 44], [43, 7, 45], [43, 8, 34], [43, 9, 35], [43, 10,
                                                                                      32], [43, 11, 33], [43, 12, 38], [43, 13, 39], [43, 14, 36], [43,
                                                                                      15, 37], [43, 16, 58], [43, 17, 59], [43, 18, 56], [43, 19,
                                                                                      57], [43, 20, 62], [43, 21, 63], [43, 22, 60], [43, 23, 61], [43,
                                                                                      24, 50], [43, 25, 51], [44, 0, 41], [44, 1, 40], [44, 2, 43], [44,
                                                                                      3, 42], [44, 4, 45], [44, 5, 44], [44, 6, 47], [44, 7, 46], [44, 8,
                                                                                      33], [44, 9, 32], [44, 10, 35], [44, 11, 34], [44, 12, 37], [44, 13,
                                                                                       36], [44, 14, 39], [44, 15, 38], [44, 16, 57], [44, 17, 56], [44,
                                                                                      18, 59], [44, 19, 58], [44, 20, 61], [44, 21, 60], [44, 22,
                                                                                      63], [44, 23, 62], [44, 24, 49], [45, 0, 48], [45, 1, 49], [45, 2,
                                                                                      50], [45, 3, 51], [45, 4, 52], [45, 5, 53], [45, 6, 54], [45, 7,
                                                                                      55], [45, 8, 56], [45, 9, 57], [45, 10, 58], [45, 11, 59], [45, 12,
                                                                                      60], [45, 13, 61], [45, 14, 62], [45, 15, 63], [45, 16, 32], [46, 0,
                                                                                       47], [46, 1, 46], [46, 2, 45], [46, 3, 44], [46, 4, 43], [46, 5,
                                                                                      42], [46, 6, 41], [46, 7, 40], [46, 8, 39], [46, 9, 38], [46, 10,
                                                                                      37], [46, 11, 36], [46, 12, 35], [46, 13, 34], [46, 14, 33], [46,
                                                                                      15, 32], [46, 16, 63], [46, 17, 62], [46, 18, 61], [46, 19,
                                                                                      60], [46, 20, 59], [46, 21, 58], [46, 22, 57], [46, 23, 56], [46,
                                                                                      24, 55], [46, 25, 54], [46, 26, 53], [47, 0, 46], [47, 1, 47], [47,
                                                                                      2, 44], [47, 3, 45], [47, 4, 42], [47, 5, 43], [47, 6, 40], [47, 7,
                                                                                      41], [47, 8, 38], [47, 9, 39], [47, 10, 36], [47, 11, 37], [47, 12,
                                                                                      34], [47, 13, 35], [47, 14, 32], [47, 15, 33], [47, 16, 62], [47,
                                                                                      17, 63], [47, 18, 60], [47, 19, 61], [47, 20, 58], [47, 21,
                                                                                      59], [47, 22, 56], [47, 23, 57], [47, 24, 54], [47, 25, 55], [47,
                                                                                      26, 52], [48, 0, 45], [48, 1, 44], [48, 2, 47], [48, 3, 46], [48, 4,
                                                                                       41], [48, 5, 40], [48, 6, 43], [48, 7, 42], [48, 8, 37], [48, 9,
                                                                                      36], [48, 10, 39], [48, 11, 38], [48, 12, 33], [48, 13, 32], [48,
                                                                                      14, 35], [48, 15, 34], [48, 16, 61], [48, 17, 60], [48, 18,
                                                                                      63], [48, 19, 62], [48, 20, 57], [48, 21, 56], [48, 22, 59], [48,
                                                                                      23, 58], [48, 24, 53], [48, 25, 52], [48, 26, 55], [48, 27,
                                                                                      54], [49, 0, 52], [49, 1, 53], [49, 2, 54], [49, 3, 55], [49, 4,
                                                                                      48], [49, 5, 49], [49, 6, 50], [49, 7, 51], [49, 8, 60], [49, 9,
                                                                                      61], [49, 10, 62], [49, 11, 63], [49, 12, 56], [49, 13, 57], [49,
                                                                                      14, 58], [49, 15, 59], [49, 16, 36], [49, 17, 37], [49, 18,
                                                                                      38], [49, 19, 39], [50, 0, 51], [50, 1, 50], [50, 2, 49], [50, 3,
                                                                                      48], [50, 4, 55], [50, 5, 54], [50, 6, 53], [50, 7, 52], [50, 8,
                                                                                      59], [50, 9, 58], [50, 10, 57], [50, 11, 56], [50, 12, 63], [50, 13,
                                                                                       62], [50, 14, 61], [50, 15, 60], [50, 16, 35], [50, 17, 34], [51,
                                                                                      0, 50], [51, 1, 51], [51, 2, 48], [51, 3, 49], [51, 4, 54], [51, 5,
                                                                                      55], [51, 6, 52], [51, 7, 53], [51, 8, 58], [51, 9, 59], [51, 10,
                                                                                      56], [51, 11, 57], [51, 12, 62], [51, 13, 63], [51, 14, 60], [51,
                                                                                      15, 61], [51, 16, 34], [51, 17, 35], [52, 0, 49], [52, 1, 48], [52,
                                                                                      2, 51], [52, 3, 50], [52, 4, 53], [52, 5, 52], [52, 6, 55], [52, 7,
                                                                                      54], [52, 8, 57], [52, 9, 56], [52, 10, 59], [52, 11, 58], [52, 12,
                                                                                      61], [52, 13, 60], [52, 14, 63], [52, 15, 62], [52, 16, 33], [53, 0,
                                                                                       56], [53, 1, 57], [53, 2, 58], [53, 3, 59], [53, 4, 60], [53, 5,
                                                                                      61], [53, 6, 62], [53, 7, 63], [53, 8, 48], [53, 9, 49], [53, 10,
                                                                                      50], [53, 11, 51], [53, 12, 52], [53, 13, 53], [53, 14, 54], [53,
                                                                                      15, 55], [53, 16, 40], [53, 17, 41], [53, 18, 42], [53, 19,
                                                                                      43], [53, 20, 44], [53, 21, 45], [53, 22, 46], [53, 23, 47], [54, 0,
                                                                                       55], [54, 1, 54], [54, 2, 53], [54, 3, 52], [54, 4, 51], [54, 5,
                                                                                      50], [54, 6, 49], [54, 7, 48], [54, 8, 63], [54, 9, 62], [54, 10,
                                                                                      61], [54, 11, 60], [54, 12, 59], [54, 13, 58], [54, 14, 57], [54,
                                                                                      15, 56], [54, 16, 39], [54, 17, 38], [54, 18, 37], [55, 0, 54], [55,
                                                                                       1, 55], [55, 2, 52], [55, 3, 53], [55, 4, 50], [55, 5, 51], [55, 6,
                                                                                       48], [55, 7, 49], [55, 8, 62], [55, 9, 63], [55, 10, 60], [55, 11,
                                                                                      61], [55, 12, 58], [55, 13, 59], [55, 14, 56], [55, 15, 57], [55,
                                                                                      16, 38], [55, 17, 39], [55, 18, 36], [56, 0, 53], [56, 1, 52], [56,
                                                                                      2, 55], [56, 3, 54], [56, 4, 49], [56, 5, 48], [56, 6, 51], [56, 7,
                                                                                      50], [56, 8, 61], [56, 9, 60], [56, 10, 63], [56, 11, 62], [56, 12,
                                                                                      57], [56, 13, 56], [56, 14, 59], [56, 15, 58], [56, 16, 37], [56,
                                                                                      17, 36], [56, 18, 39], [56, 19, 38], [57, 0, 60], [57, 1, 61], [57,
                                                                                      2, 62], [57, 3, 63], [57, 4, 56], [57, 5, 57], [57, 6, 58], [57, 7,
                                                                                      59], [57, 8, 52], [57, 9, 53], [57, 10, 54], [57, 11, 55], [57, 12,
                                                                                      48], [57, 13, 49], [57, 14, 50], [57, 15, 51], [57, 16, 44], [57,
                                                                                      17, 45], [57, 18, 46], [57, 19, 47], [57, 20, 40], [58, 0, 59], [58,
                                                                                       1, 58], [58, 2, 57], [58, 3, 56], [58, 4, 63], [58, 5, 62], [58, 6,
                                                                                       61], [58, 7, 60], [58, 8, 51], [58, 9, 50], [58, 10, 49], [58, 11,
                                                                                      48], [58, 12, 55], [58, 13, 54], [58, 14, 53], [58, 15, 52], [58,
                                                                                      16, 43], [58, 17, 42], [58, 18, 41], [58, 19, 40], [58, 20,
                                                                                      47], [58, 21, 46], [58, 22, 45], [59, 0, 58], [59, 1, 59], [59, 2,
                                                                                      56], [59, 3, 57], [59, 4, 62], [59, 5, 63], [59, 6, 60], [59, 7,
                                                                                      61], [59, 8, 50], [59, 9, 51], [59, 10, 48], [59, 11, 49], [59, 12,
                                                                                      54], [59, 13, 55], [59, 14, 52], [59, 15, 53], [59, 16, 42], [59,
                                                                                      17, 43], [59, 18, 40], [59, 19, 41], [59, 20, 46], [59, 21,
                                                                                      47], [59, 22, 44], [60, 0, 57], [60, 1, 56], [60, 2, 59], [60, 3,
                                                                                      58], [60, 4, 61], [60, 5, 60], [60, 6, 63], [60, 7, 62], [60, 8,
                                                                                      49], [60, 9, 48], [60, 10, 51], [60, 11, 50], [60, 12, 53], [60, 13,
                                                                                       52], [60, 14, 55], [60, 15, 54], [60, 16, 41], [60, 17, 40], [60,
                                                                                      18, 43], [60, 19, 42], [60, 20, 45], [60, 21, 44], [60, 22,
                                                                                      47], [60, 23, 46], [61, 0, 64], [61, 1, 65], [61, 2, 66], [61, 3,
                                                                                      67], [61, 4, 68], [61, 5, 69], [61, 6, 70], [62, 0, 63], [62, 1,
                                                                                      62], [62, 2, 61], [62, 3, 60], [62, 4, 59], [62, 5, 58], [62, 6,
                                                                                      57], [62, 7, 56], [62, 8, 55], [62, 9, 54], [62, 10, 53], [62, 11,
                                                                                      52], [62, 12, 51], [62, 13, 50], [62, 14, 49], [62, 15, 48], [62,
                                                                                      16, 47], [62, 17, 46], [62, 18, 45], [62, 19, 44], [62, 20,
                                                                                      43], [62, 21, 42], [63, 0, 62], [63, 1, 63], [63, 2, 60], [63, 3,
                                                                                      61], [63, 4, 58], [63, 5, 59], [63, 6, 56], [63, 7, 57], [63, 8,
                                                                                      54], [63, 9, 55], [63, 10, 52], [63, 11, 53], [63, 12, 50], [63, 13,
                                                                                       51], [63, 14, 48], [63, 15, 49], [63, 16, 46], [63, 17, 47], [63,
                                                                                      18, 44], [63, 19, 45], [63, 20, 42], [63, 21, 43], [64, 0, 61], [64,
                                                                                       1, 60], [64, 2, 63], [64, 3, 62], [64, 4, 57], [64, 5, 56], [64, 6,
                                                                                       59], [64, 7, 58], [64, 8, 53], [64, 9, 52], [64, 10, 55], [64, 11,
                                                                                      54], [64, 12, 49], [64, 13, 48], [64, 14, 51], [64, 15, 50], [64,
                                                                                      16, 45], [64, 17, 44], [64, 18, 47], [64, 19, 46], [64, 20,
                                                                                      41], [65, 0, 68], [65, 1, 69], [65, 2, 70], [65, 4, 64], [65, 5,
                                                                                      65], [65, 6, 66], [65, 7, 67], [66, 0, 67], [66, 1, 66], [66, 2,
                                                                                      65], [66, 3, 64], [66, 5, 70], [66, 6, 69], [66, 7, 68], [67, 0,
                                                                                      66], [67, 1, 67], [67, 2, 64], [67, 3, 65], [67, 4, 70], [67, 6,
                                                                                      68], [67, 7, 69], [68, 0, 65], [68, 1, 64], [68, 2, 67], [68, 3,
                                                                                      66], [68, 4, 69], [68, 5, 68], [68, 7, 70], [69, 8, 64], [69, 9,
                                                                                      65], [69, 10, 66], [69, 11, 67], [69, 12, 68], [69, 13, 69], [69,
                                                                                      14, 70], [70, 1, 70], [70, 2, 69], [70, 3, 68], [70, 4, 67], [70, 5,
                                                                                       66], [70, 6, 65], [70, 7, 64]]

let config = SymbolicRegressorConfiguration(populationSize: 10000, generations: 20, depthRange: 3..<6)
//let regressor = SymbolicRegressor(configuration: config, resumptionPath: "\(NSHomeDirectory())/Desktop/gp4cg/log_2022_12_4_22_11_5/20.log")
let regressor = SymbolicRegressor(configuration: config)

let mae = MeanAbsoluteError2d(teacherData: teacherData)
let acc = Accuracy(teacherData: teacherData)

let candidateManager = CandidateManager(uniquenessIndicator: { $0.evaluation(acc) == $1.evaluation(acc) })


let formatter = DateFormatter()
formatter.dateFormat = "yyyy_M_d_H_m_s"
let saveDir = "\(NSHomeDirectory())/Desktop/gp4cg/log_\(formatter.string(from: Date()))"

regressor.operations = [
    TournamentSelection(sortFunction: { $0.evaluation(mae) < $1.evaluation(mae) }, tournamentSize: 4),
    Fork(operations: [
        RandomMutation(teacherData: teacherData),
        Nothing()
    ]),
    TournamentSelection(sortFunction: { $0.evaluation(acc) == $1.evaluation(acc) ? $0.evaluation(mae) < $1.evaluation(mae) : $0.evaluation(acc) > $1.evaluation(acc) }, tournamentSize: 2),
    Pick(candidateManager: candidateManager, filterFunction: {
        $0.evaluation(acc) > 0.3
    }),
    SaveProgress(saveDirectory: saveDir),
    PrintBest(sortFunction: { $0.evaluation(acc) == $1.evaluation(acc) ? $0.evaluation(mae) < $1.evaluation(mae) : $0.evaluation(acc) > $1.evaluation(acc) }),
    CustomOperation(operation: { population in
        for candidate in candidateManager.candidates {
            print("\t \(candidate) \(candidate.fitness)")
        }
        return population
    }, description: "\tCandidates")
]

regressor.fit()

var df = DataFrame()
df.append(column: Column(name: "x", contents: teacherData.map { $0[0] }))
df.append(column: Column(name: "y", contents: teacherData.map { $0[1] }))
df.append(column: Column(name: "z", contents: teacherData.map { $0[2] }))
for formula in candidateManager.candidates(teacherData: teacherData) {
    df.append(column: Column(name: String(describing: formula), contents: formula.evaluation(teacherData).map { $0 ? 1 : 0 }))
}
try? df.writeCSV(to: URL(fileURLWithPath: "\(saveDir)/result.csv"))

var isCoveredList = teacherData.map { _ in false }
for formula in candidateManager.candidates(teacherData: teacherData) {
    for (i, ele) in formula.evaluation(teacherData).enumerated() {
        if ele {
            isCoveredList[i] = true
        }
    }
}
let result = teacherData.enumerated().filter { !isCoveredList[$0.offset] }.map { $0.element }
print(result)
