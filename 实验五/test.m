% ������ű���
syms t s;

% ����Ŀ�꺯��
f = t^2 + (s-3)^2;

% ��ʼ��
x0 = [-2 6];

% �Ա�������
var = [t s];

% ����
eps = 1e-5;

% ���� minNT ����
[x, minf] = minGETD(f, x0, var, eps);
%x = Funval(f,var,x0);

% ��ʾ���
disp('The minimum point is:');
disp(x);
disp('The minimum value of the function is:');
disp(minf);