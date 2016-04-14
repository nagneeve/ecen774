clc;
clear;
close all;

% True params
true = [-52.5958 174.4152 -197.6225 83.2295 -7.4206 -1];

% Load data
data = load('adaptive_params_simulation.csv');

% Trim and downsample data
data = data(1:3000,:);
sample = ceil(linspace(1,length(data),1000));

figure(1);

subplot(6,1,1);
hold on;
plot(sample,data(sample,1));
line([0 length(data)],[true(1) true(1)], 'LineStyle', ':')
legend({'Adapted Parameter','True Parameter'});
ylabel('$\alpha_5$', 'interpreter', 'latex', 'rotation', pi/2);

subplot(6,1,2);
plot(sample,data(sample,2));
line([0 length(data)],[true(2) true(2)], 'LineStyle', ':')
ylabel('$\alpha_4$', 'interpreter', 'latex', 'rotation', pi/2);

subplot(6,1,3);
plot(sample,data(sample,3));
line([0 length(data)],[true(3) true(3)], 'LineStyle', ':')
ylabel('$\alpha_3$', 'interpreter', 'latex', 'rotation', pi/2);

subplot(6,1,4);
plot(sample,data(sample,4));
line([0 length(data)],[true(4) true(4)], 'LineStyle', ':')
ylabel('$\alpha_2$', 'interpreter', 'latex', 'rotation', pi/2);

subplot(6,1,5);
plot(sample,data(sample,5));
line([0 length(data)],[true(5) true(5)], 'LineStyle', ':')
ylabel('$\alpha_1$', 'interpreter', 'latex', 'rotation', pi/2);

subplot(6,1,6);
plot(sample,data(sample,6));
line([0 length(data)],[true(6) true(6)], 'LineStyle', ':')
ylabel('$b$', 'interpreter', 'latex', 'rotation', pi/2);

% Plot poly generated by coefficients

mass    = 3.81;
gravity = 9.80665;

h = linspace(0,1,500);
row = ceil(linspace(1,length(data),10));
colors = lines(length(row));

figure(2);
hold on;

true_model = true(1,1)*h.^4 + true(1,2)*h.^3 + true(1,3)*h.^2 + true(1,4)*h.^1 + true(1,5) + mass*gravity;

plot(h,true_model, '--k', 'LineWidth', 2)
line([0 1],[mass*gravity mass*gravity], 'LineStyle', ':')

for i = 1:length(row)
  model = data(row(i),1)*h.^4 + data(row(i),2)*h.^3 + data(row(i),3)*h.^2 + data(row(i),4)*h.^1 + data(row(i),5);
  plot(h, model, 'color', colors(i,:));
end

xlabel('Altitude (m)');
ylabel('Force (N)');




