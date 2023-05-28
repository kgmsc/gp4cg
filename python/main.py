from flask import Flask, request, jsonify
from itertools import combinations
from pulp import LpProblem, LpMinimize, LpVariable, lpSum

class FormulaGroup:
    def __init__(self, formula_list):
        self.formula_list = formula_list
        self.judge_result = []
        self.accuracy = 0

    def is_empty(self):
        return len(self.formula_list) == 0

    def evaluate_accuracy(self, judge_result):
        true_count = judge_result.count(True)
        false_count = judge_result.count(False)
        if true_count + false_count == 0:
            self.accuracy = 0
        else:
            self.accuracy = true_count / (true_count + false_count)

def add_bool_lists(list1, list2):
    return [a or b for a, b in zip(list1, list2)]

def find_minimum_necessary(candidates):
    global flist
    best_formula_group = FormulaGroup([])

    prob = LpProblem("BestCombination", LpMinimize)
    x = [LpVariable("x{}".format(i), cat='Binary') for i in range(len(candidates))]

    # bestのminimize
    prob += lpSum([i["judge_result"].count(True) for i in candidates])

    for i in range(len(candidates)):
        if i == 0:
            flist = candidates[i]["judge_result"]
        flist = add_bool_lists(flist, candidates[i]["judge_result"])

    flist1 = []
    # prob += [x[i] * candidates[i]["judge_result"] for i in range(len(candidates))].count(1) == flist1.count(True)
    prob += lpSum([x[i] * candidates[i]["judge_result"].count(True) for i in range(len(candidates))]) == sum(flist)

    # Solve the problem
    prob.solve()

    # Get the result
    result = [candidates[i]["formulas"] for i in range(len(candidates)) if x[i].value() > 0.5]

    print(result)

    return result

app = Flask(__name__)

@app.route('/find_minimum_necessary', methods=['POST'])
def api_find_minimum_necessary():
    data = request.get_json()
    candidates = data.get('candidates', {})
    result = find_minimum_necessary(candidates)
    print(jsonify(result))
    return jsonify(result)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5102)