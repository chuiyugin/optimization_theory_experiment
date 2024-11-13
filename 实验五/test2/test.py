import gurobipy as gp
from gurobipy import GRB

# 创建模型
model = gp.Model("strict_constraints_example")

# 添加变量
x = model.addVar(vtype=GRB.CONTINUOUS, name="x")
y = model.addVar(vtype=GRB.CONTINUOUS, name="y")
m = model.addVar(vtype=GRB.CONTINUOUS, name="m")
k = model.addVar(vtype=GRB.CONTINUOUS, name="k")

# 设定一个极小的松弛量 epsilon
epsilon = 1e-6

# 设置目标函数
f = x*x+y*2+m+k
model.setObjective(f, GRB.MINIMIZE)

# 添加约束条件
model.addConstr(x >= 4, "c1")  # 对应x > 4的约束
model.addConstr(y <= 10, "c2")  # 对应y < 10的约束
model.addConstr(x + y <= 15, "c3")  # x + y ≤ 15的约束
model.addConstr(x + m <= 15, "c4")  # x + y ≤ 15的约束

# 求解模型
model.update()
model._vars = [x]  # 必须手动设置变量列表，这是Gurobi Python接口的一个内部机制
model.Params.NonConvex = 2  # 允许处理非凸问题
model.optimize()

# 获取并输出结果
if model.status == GRB.OPTIMAL:
    print(f"Optimal value of x: {x.x}")
    print(f"Optimal value of y: {y.x}")
    print(f"Optimal value of m: {m.x}")
    print(f"Optimal value of k: {k.x}")
    print(f"Optimal value of the objective: {model.objVal}")
else:
    print("Optimal solution not found")
