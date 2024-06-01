clear;clc;
q = 3*(0.000584);%find this computationally, then tweak as we go
alpha_1 = .89; %use 0.89 and 0.88
alpha_2 = .88;

N = 10; %arbitrary number
Nb = 91; %number of bins
t_insertion = 1500;%time steps before rod
t_end = 5000;%final number of time steps

%preallocation
n_1 = N*ones(1,Nb+2);
n_1(1,1) = 0;
n_1(1,end) = 0;
NMAX_1 = zeros(1,t_end);

for j = 1:t_insertion
    n_1 = n_1.*(1+q);
    n_1(2:end-1) = (n_1(3:end) + n_1(1:end-2))./2;
    NMAX_1(j) = max(n_1);
end
for j = t_insertion:t_end
    n_1 = n_1.*(1+q);
    n_1(2:end-1) = (n_1(3:end) + n_1(1:end-2))./2;
    n_1(47) = alpha_1*(n_1(46) + n_1(48))./2;
    NMAX_1(j) = max(n_1);
end
%same steps for our first simulation, this time using second alpha value
n_2 = N*ones(1,Nb+2);
n_2(1,1) = 0;
n_2(1,end) = 0;

NMAX_2 = zeros(1,t_end);

for j = 1:t_insertion
    n_2 = n_2.*(1+q);
    n_2(2:end-1) = (n_2(3:end) + n_2(1:end-2))./2;
    NMAX_2(j) = max(n_2);
end
for j = t_insertion:t_end
    n_2 = n_2.*(1+q);
    n_2(2:end-1) = (n_2(3:end) + n_2(1:end-2))./2;
    n_2(47) = alpha_2*(n_2(46) + n_2(48))./2;
    NMAX_2(j) = max(n_2);
end

hold on
plot(NMAX_1,'r')
plot(NMAX_2,'b')
title('Neutron Numbers','FontSize',24,'FontWeight','bold')
xlabel('Time Step','FontSize',20)
ylabel('N_m_a_x','FontSize',20)

legend('simulation with \alpha = 0.89','simulation with \alpha = 0.88','location','southeast','fontsize',20)