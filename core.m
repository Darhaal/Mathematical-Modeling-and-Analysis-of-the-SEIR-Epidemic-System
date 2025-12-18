clear; close all; clc;
beta = 0.5;
sigma = 0.1;
gamma = 0.1;
mu = 0.01;
R0 = (beta * sigma) / ((sigma + mu) * (gamma + mu));
fprintf('Basic Reproduction Number R0 = %.4f\n', R0);
S0 = 0.90; 
E0 = 0.09;
I0 = 0.01; 
R0_init = 0;
y0 = [S0 E0 I0 R0_init];
tspan = [0 300];
[t, sol] = ode45(@(t,y) seir_equations(t,y,beta,sigma,gamma,mu), tspan, y0);
S = sol(:,1); 
E = sol(:,2); 
I = sol(:,3); 
R = sol(:,4);
figure;
plot(t, S, 'b', 'LineWidth', 2); hold on;
plot(t, E, 'm', 'LineWidth', 2);
plot(t, I, 'r', 'LineWidth', 2);
plot(t, R, 'g', 'LineWidth', 2);
legend('Susceptible','Exposed (Latent)','Infectious','Recovered');
xlabel('Time');
ylabel('Population Fraction');
title(['SEIR Model Dynamics (R_0 = ' num2str(R0) ')']);
grid on;
figure;
plot3(S, E, I, 'k', 'LineWidth', 1.5);
xlabel('Susceptible');
ylabel('Exposed');
zlabel('Infectious');
title('3D Phase Space Trajectory (S-E-I)');
grid on;
view(45, 30);
beta_vals = 0:0.01:1; 
I_star = zeros(size(beta_vals));
threshold_beta = 0;
for k = 1:length(beta_vals)
    b = beta_vals(k);
    R0_curr = (b * sigma) / ((sigma + mu) * (gamma + mu));
    if R0_curr <= 1
        I_star(k) = 0;
    else
        I_star(k) = (mu * (R0_curr - 1)) / b;
    end
    if abs(R0_curr - 1) < 0.05 && threshold_beta == 0
        threshold_beta = b; 
    end
end
figure;
plot(beta_vals, I_star, 'b-', 'LineWidth', 2); hold on;
beta_crit = ((sigma + mu) * (gamma + mu)) / sigma;
xline(beta_crit, 'r--', 'LineWidth', 1.5, 'Label', 'R0=1 Threshold');
xlabel('Transmission Rate (\beta)');
ylabel('Endemic Infection Level (I*)');
title('Transcritical Bifurcation Diagram');
grid on;
function dydt = seir_equations(t, y, beta, sigma, gamma, mu)
    S = y(1); E = y(2); I = y(3); R = y(4);
    dS = mu - beta*S*I - mu*S;
    dE = beta*S*I - (sigma + mu)*E;
    dI = sigma*E - (gamma + mu)*I;
    dR = gamma*I - mu*R;
    dydt = [dS; dE; dI; dR];
end

