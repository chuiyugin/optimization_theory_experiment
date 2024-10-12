clc,clear;
% ������ű���
syms x
% ����Ŀ�꺯�� f(x) ����һ�׺Ͷ��׵���
f = x^4 - 4*x^3 - 6*x^2 - 16*x + 4;  % Ŀ�꺯�� f(x)
df = diff(f, x);
ddf = diff(df, x);
% �����ű��ʽת��Ϊ��������
f = matlabFunction(f);
df = matlabFunction(df);
ddf = matlabFunction(ddf);
% ����Ŀ�꺯�� f(x) ����һ�׺Ͷ��׵���
% f = @(x) x^4 - 4*x^3 - 6*x^2 - 16*x + 4;  % Ŀ�꺯�� f(x)
% df = @(x) 4*x^3 - 12*x^2 - 12*x - 16;       % һ�׵��� f'(x)
% ddf = @(x) 12*x^2 - 24*x -12;            % ���׵��� f''(x)

% ��ʼ�²�ֵ
x0 = 3.0;

% ����Ҫ��
tolerance = 1e-3;
max_iterations = 100;

% ţ�ٷ�����
x = x0;
for i = 1:max_iterations
    numerator = df(x);%����
    denominator = ddf(x);%��ĸ
    x_new = x - df(x)/ddf(x);
    
    % ����Ƿ�������������
    if abs(df(x)) < tolerance 
        break;
    end
    
    x = x_new;
end

% ������
fprintf('��ţ�ٷ�%d�ε�����:\n',i);
fprintf('��Сֵ��Ľ���ֵΪ: %.6f\n', x);
fprintf('������СֵԼΪ: %.6f\n', f(x));