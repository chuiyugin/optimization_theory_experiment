function [x, mu, lam, output] = multphr(fun, hf, gf, dfun, dhf, dgf, x0)
    % 功能：乘子法求解一般约束优化问题：
    %        min f(x), s.t. h(x)=0, g(x)≥0
    % 输入：fun, dfun分别是目标函数及其梯度，
    %       hf, dhf分别是等式约束（向量）函数及其Jacobi矩阵的转置，
    %       gf, dgf分别是不等式约束（向量）函数及其Jacobi矩阵的转置，
    %       x0是初始点，
    % 输出：x是近似最优解，
    %       mu, lam分别是相应于等式约束和不等式约束的乘子向量，
    %       output是结构变量，输出近似极小值f, 迭代次数k, 内迭代次数ink等

    maxk = 1000; % 最大迭代次数
    sigma = 2.0; % 惩罚因子
    theta = 0.8; eta = 2.0; % PHR算法中的实参数
    k = 0; ink = 0; % k, ink分别是外迭代和内迭代次数
    epsilon = 1e-5; % 终止误差值
    x = x0; he = feval(hf, x); gi = feval(gf, x);
    n = length(x); l = length(he); m = length(gi);
    %disp(x);
    
    % 选取乘子向量的初始值
    mu = 0.1 * ones(l, 1); lam = 0.1 * ones(m, 1);
    betak = 10; betalo = 10; % 用来检测终止条件的两个值
    
while (betak > epsilon && k < maxk)
    % 调用BFGS算法程序求解无约束子问题
    [x,val,ik] = bfgs('mpsi','dmpsi',x0,fun,hf,gf,dfun,dhf,dgf,mu,lam,sigma);
    ink = ink + ik;
    he = feval(hf, x); gi = feval(gf, x);
    % 计算betak
    betak = sqrt(norm(he, 2)^2 + norm(min(gi, lam / sigma), 2)^2);
    if betak > epsilon
        % 更新乘子向量
        mu = mu - sigma * he;
        lam = max(0.0, lam - sigma * gi);
        if(k >= 2 && betak > theta * betaold)
            sigma = eta * sigma;
        end
    end
    k = k + 1;
    betaold = betak;
    x0 = x;
end
f = feval(fun, x);
output.fval = f;
output.iter = k;
output.inner_iter = ink;
output.beta = betak;
