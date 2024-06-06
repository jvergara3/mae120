%% Part 1: Subcritical Reactor
clear;clc;
q_part1 = 2*(10^(-4));%find this computationally, then tweak as we go

N = 10; %arbitrary number
Nb = 51; %number of bins
t_end_part1 = 1000;%final number of time steps
%preallocation
n_part1 = N*ones(1,Nb+2);
n_part1(1) = 0;
n_part1(end) = 0;
NMAX_part1 = zeros(1,t_end_part1);
for j = 1:t_end_part1
n_part1 = n_part1.*(1+q_part1);
n_part1(2:end-1) = (n_part1(3:end) + n_part1(1:end-2))./2;
NMAX_part1(j) = max(n_part1);
end
hold on
figure(1)
plot(NMAX_part1./N,'r')
title('Part 1. Subcritical Reactor:', ...
    'Normalized Neutron Numbers [N_m_a_x/N_0] over a Time Step', ...
    'FontSize',20,'FontWeight','bold')
xlabel('Time Step','FontSize',20)
ylabel('N_m_a_x/N_0','FontSize',20)

%% Part 2: Reflector Bins
clear;clc;
q = 2*(10^(-4));%find this computationally, then tweak as we go

N = 10; %arbitrary number
Nb = 51; %number of bins
%use Nr = 87 and 88
Nr_1 = 88; %number of reflector bins on each side

t_end = 100000;%final number of time steps
%preallocation
n1 = N*ones(1,(2*Nr_1 + Nb + 2));
%boundary bin conditions
n1(1) = 0;
n1(end) = 0;
%Nmax preallocation
NMAX_1 = zeros(1,t_end);
for j = 1:t_end
n1(Nr_1+2:Nb+Nr_1+1) = n1(Nr_1+2:Nb+Nr_1+1).*(1+q);%number of bins
n1(2:end-1) = (n1(3:end) + n1(1:end-2))./2;
NMAX_1(j) = max(n1);
end
Nr_2 = 89; %number of reflector bins on each side
n2 = N*ones(1,(2*Nr_2 + Nb + 2));
%boundary bin conditions
n2(1) = 0;
n2(end) = 0;
%Nmax preallocation
NMAX_2 = zeros(1,t_end);
for j = 1:t_end
n2(Nr_2+2:Nb+Nr_2+1) = n2(Nr_2+2:Nb+Nr_2+1).*(1+q);%number of bins
n2(2:end-1) = (n2(3:end) + n2(1:end-2))./2;
NMAX_2(j) = max(n2);
end

figure(2)
hold on
plot(NMAX_1./N, 'b')%using  bins, plotting in blue
plot(NMAX_2./N,'r')%using  bins, plotting in red
title('Part 2. Subcritical Reactor with a Reflector:', ...
    'Normalized Neutron Numbers [N_m_a_x/N_0] over a Time Step', ...
    'FontSize',20,'FontWeight','bold')
xlim([0 t_end])
xlabel('Time Step','FontSize',20)
ylabel('N_m_a_x/N_0','FontSize',20)
legend('88 reflector bins per side','89 reflector bins per side', ...
    'Location','southeast','fontsize',16)