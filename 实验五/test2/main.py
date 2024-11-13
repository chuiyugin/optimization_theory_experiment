import gurobipy as gp
from gurobipy import GRB

# 创建模型
model = gp.Model("strict_constraints_example")

# 添加变量
x = model.addVar(vtype=GRB.CONTINUOUS, name="x")
y = model.addVar(vtype=GRB.CONTINUOUS, name="y")

# 设定一个极小的松弛量 epsilon
epsilon = 1e-6

# 设置目标函数：2x + 3y
model.setObjective(2 * x + 3 * y, GRB.MAXIMIZE)

# 添加约束条件
model.addConstr(x >= 4 + epsilon, "c1")  # 对应x > 4的约束
model.addConstr(y <= 10 - epsilon, "c2")  # 对应y < 10的约束
model.addConstr(x + y <= 15, "c3")  # x + y ≤ 15的约束

# 求解模型
model.optimize()

# 获取并输出结果
if model.status == GRB.OPTIMAL:
    print(f"Optimal value of x: {x.x}")
    print(f"Optimal value of y: {y.x}")
    print(f"Optimal value of the objective: {model.objVal}")
else:
    print("Optimal solution not found")
