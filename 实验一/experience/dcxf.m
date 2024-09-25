<<<<<<< HEAD
function [xm,fm,noi] = dcxf(A,b,c)
%% ����
% �����η�����׼�����Թ滮����: min cx s.t. Ax=b x>=0
% �������: cΪĿ�꺯��ϵ��, AΪԼ��������ϵ������, bΪԼ�������鳣����
% �������: xmΪ����⣬fmΪ���ź���ֵ��noiΪ��������
%% ׼��
format rat                                                                 %Ԫ��ʹ�÷�����ʾ
[m,n] = size(A);                                                           %mԼ����������, n���߱�����
v=nchoosek(1:n,m);                                                         %����һ�����󣬸þ��������ÿ�δ�1:n�е�n��Ԫ��ȡ��k��ȡֵ�����п�����Ϲ��ɡ����� C ���� m!/((n�Cm)! m!) �к� m��
index_Basis=[];
%% ��ȡ���н�������
for i=1:size(v,1)                                                          %size(v,1)Ϊ��n��ȡm��������
    if A(:,v(i,:))==eye(m)                                                 %�����Ĳ�λA��ȡv�ĵ�i��ȡ��ȡ��m���ж��Ƿ����m*m��С�ĵ�λ����
        index_Basis=v(i,:);                                                %��%���ڵ�λ�����ȡ���������б�index_Basis��
    end
end
%% �жϾ���A��ȫΪ�������е�����
my_negative=[];
for i=1:n
    is_negative = all(A(:, i) < 0);
    if is_negative
    my_negative(end+1) = i;
    end
end
%disp(my_negative);
%% ��ȡ�ǻ�����������
ind_Nonbasis = setdiff(1:n, index_Basis);                                  %�ǻ�����������,������1:n�г��ֶ�����index_Basis���������������г��ֵ�Ԫ�أ�������С��������
noi=0;
%disp(ind_Nonbasis);
while true
    x0 = zeros(n,1);
    x0(index_Basis) = b;                                                   %��ʼ�����н�
    %disp(x0);
    %disp(index_Basis);
    cB = c(index_Basis);                                                   %����cB����Ŀ�꺯���ڻ���������Ӧ��ϵ��
    %disp(cB);
    Sigma = zeros(1,n);                                                    %SigmaΪ����������
    Sigma(ind_Nonbasis) = c(ind_Nonbasis)' - cB'*A(:,ind_Nonbasis);        %������������ǻ�����������Ϊ��������Ӧ�ĳ�ʼ������һ��Ϊ0
    %disp(Sigma);
    [~, s] = min(Sigma);                                                   %ѡ����������, ȷ��������������s��~��ʾ���Ե�һ�������������ֵ����s������
    %disp(s);
    %disp(A);
    Theta = b ./ A(:,s);                                                   %����b/ai(�����
    %disp(Theta);
    Theta(Theta<=0) = 10000;
    %disp(Theta);
    %disp(size(Theta,1));
    %�Ż�ѡȡ��Сֵ�ķ���
    for i=1:size(Theta,1)
        if Theta(i,1)==min(Theta)
           q=i;
        end
    end
    %[~, q] = min(Theta);                                                   %ѡ����С��
    %disp(q);
    %disp(s);
    q = index_Basis(q);                                                    %ȷ������������ϵ�������е�������el, ��ԪΪA(q,s)
    %disp(Sigma);
%% �ж��Ƿ������Ž�
    %if ~any(Sigma < 0) || any(my_negative == s)                                                    %���м�������С��0���˻����н�Ϊ���Ž�, any��ʾ����ĳ��������>0        
     if ~any(Sigma < 0)   
        xm = x0;
        fm = c' * xm;                                                      %������Ž�
        return
        break
    end
%% �ж��Ƿ��н�
    %disp(A);
    %disp(s);
    if all(A(:,s) <= 0)                                                    %��ʾ��������һ��ÿ������<=0�����޽��
        fprintf("����y%d=\n", s);
        disp(A(:,s));
        disp("ȫ��С�ڵ���0����˸��������޽��");
        xm = [];
        break
    end
%% ����
    index_Basis(index_Basis == q) = s;                                     %�µĻ���������
    ind_Nonbasis = setdiff(1:n, index_Basis);                              %�ǻ���������
%% ���ġ�����ת����
    A(:,ind_Nonbasis) = A(:,index_Basis) \ A(:,ind_Nonbasis);              %���ġ����ǻ������Ĳ��ֵ��ڣ�=�������������ľ�������ʣ��ǻ������ľ���
    b = A(:,index_Basis) \ b;                                              %���ġ���Լ�������鳣����(=)�����������ľ�������ԭԼ�����̳�����Ŀ
    A(:,index_Basis) = eye(m,m);                                           %���ġ��������������ľ�������ɵ�λ����
    noi=noi+1;
end
end
=======
function [xm,fm,noi] = dcxf(A,b,c)
%% ����
% �����η�����׼�����Թ滮����: min cx s.t. Ax=b x>=0
% �������: cΪĿ�꺯��ϵ��, AΪԼ��������ϵ������, bΪԼ�������鳣����
% �������: xmΪ����⣬fmΪ���ź���ֵ��noiΪ��������
%% ׼��
format rat                                                                 %Ԫ��ʹ�÷�����ʾ
[m,n] = size(A);                                                           %mԼ����������, n���߱�����
v=nchoosek(1:n,m);                                                         %����һ�����󣬸þ��������ÿ�δ�1:n�е�n��Ԫ��ȡ��k��ȡֵ�����п�����Ϲ��ɡ����� C ���� m!/((n�Cm)! m!) �к� m��
index_Basis=[];
%% ��ȡ���н�������
for i=1:size(v,1)                                                          %size(v,1)Ϊ��n��ȡm��������
    if A(:,v(i,:))==eye(m)                                                 %�����Ĳ�λA��ȡv�ĵ�i��ȡ��ȡ��m���ж��Ƿ����m*m��С�ĵ�λ����
        index_Basis=v(i,:);                                                %��%���ڵ�λ�����ȡ���������б�index_Basis��
    end
end
%% �жϾ���A��ȫΪ�������е�����
my_negative=[];
for i=1:n
    is_negative = all(A(:, i) < 0);
    if is_negative
    my_negative(end+1) = i;
    end
end
%disp(my_negative);
%% ��ȡ�ǻ�����������
ind_Nonbasis = setdiff(1:n, index_Basis);                                  %�ǻ�����������,������1:n�г��ֶ�����index_Basis���������������г��ֵ�Ԫ�أ�������С��������
noi=0;
%disp(ind_Nonbasis);
while true
    x0 = zeros(n,1);
    x0(index_Basis) = b;                                                   %��ʼ�����н�
    %disp(x0);
    %disp(index_Basis);
    cB = c(index_Basis);                                                   %����cB����Ŀ�꺯���ڻ���������Ӧ��ϵ��
    %disp(cB);
    Sigma = zeros(1,n);                                                    %SigmaΪ����������
    Sigma(ind_Nonbasis) = c(ind_Nonbasis)' - cB'*A(:,ind_Nonbasis);        %������������ǻ�����������Ϊ��������Ӧ�ĳ�ʼ������һ��Ϊ0
    %disp(Sigma);
    [~, s] = min(Sigma);                                                   %ѡ����������, ȷ��������������s��~��ʾ���Ե�һ�������������ֵ����s������
    %disp(s);
    %disp(A);
    Theta = b ./ A(:,s);                                                   %����b/ai(�����
    %disp(Theta);
    Theta(Theta<=0) = 10000;
    %disp(Theta);
    %disp(size(Theta,1));
    %�Ż�ѡȡ��Сֵ�ķ���
    for i=1:size(Theta,1)
        if Theta(i,1)==min(Theta)
           q=i;
        end
    end
    %[~, q] = min(Theta);                                                   %ѡ����С��
    %disp(q);
    %disp(s);
    q = index_Basis(q);                                                    %ȷ������������ϵ�������е�������el, ��ԪΪA(q,s)
    %disp(Sigma);
%% �ж��Ƿ������Ž�
    %if ~any(Sigma < 0) || any(my_negative == s)                                                    %���м�������С��0���˻����н�Ϊ���Ž�, any��ʾ����ĳ��������>0        
     if ~any(Sigma < 0)   
        xm = x0;
        fm = c' * xm;                                                      %������Ž�
        return
        break
    end
%% �ж��Ƿ��н�
    %disp(A);
    %disp(s);
    if all(A(:,s) <= 0)                                                    %��ʾ��������һ��ÿ������<=0�����޽��
        fprintf("����y%d=\n", s);
        disp(A(:,s));
        disp("ȫ��С�ڵ���0����˸��������޽��");
        xm = [];
        break
    end
%% ����
    index_Basis(index_Basis == q) = s;                                     %�µĻ���������
    ind_Nonbasis = setdiff(1:n, index_Basis);                              %�ǻ���������
%% ���ġ�����ת����
    A(:,ind_Nonbasis) = A(:,index_Basis) \ A(:,ind_Nonbasis);              %���ġ����ǻ������Ĳ��ֵ��ڣ�=�������������ľ�������ʣ��ǻ������ľ���
    b = A(:,index_Basis) \ b;                                              %���ġ���Լ�������鳣����(=)�����������ľ�������ԭԼ�����̳�����Ŀ
    A(:,index_Basis) = eye(m,m);                                           %���ġ��������������ľ�������ɵ�λ����
    noi=noi+1;
end
end
>>>>>>> 08f3f3e (update)
