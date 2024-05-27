clear;clc;
q = 0.000584;%find this computationally, then tweak as we go
N = 10; %arbitrary number
Nb = 91; %number of bins
t = 3000; %time steps

n = N*ones(1,Nb+2);
n(1,1) = 0;
n(1,end) = 0;
n;
NMAX = zeros(1,t);
N_leftboundary = zeros(1,t);
jdiff_delta_t = zeros(1,t);

for j = 1:t
    for i = 2:Nb+1
        n(j+1,i) = (1+q)*(n(j,i-1) + n(j,i+1))/2;
    end
    NMAX(j) = max(n(j,:));
    N_leftboundary(j) = n(j+1,2)/2;
    jdiff_delta_t(j) = (NMAX(j)*sqrt(2*q)/2);

end
Nmax = max(n(end,:));
Nnorm = n(end,:)/Nmax;

figure(1)
plot(Nnorm,'o-')
xlabel('Number of Bins')
ylabel('N/Nmax')
time = 1:3000;
figure(2)
plot(time,NMAX)
xlabel('time steps')
ylabel('Nmax')

loss = N_leftboundary./jdiff_delta_t;
hold on
figure(3)
plot(time,loss)
yline(1,'--')
ylabel('loss/(Jdiff delta t)')
xlabel('time step')