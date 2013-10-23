time = 30;

Omega_p(1) = 1.0;
D(1) = 2*pi/6;

Omega_p(2) = 3.0;
D(2) = 2*2*pi/6;

Omega_p(3) = 5.0;
D(3) = 3*2*pi/6;

h = 4;
T = 0.5;
S = 10;
L = 1.0;

phi = [0, 0, 0, 0, 0, 0];

theta = [0, 1, 0, -1, 0, 1];

%omega = 5;

dt = 0.01;
t = 0:dt:time;

rec_theta = [];
rec_phi = [];
rec_psi = [];
rec_omega = [];

psi_o=[];

for i=0:dt:time
    
%     if 0 <= i & i < 20
%         omega = Omega_p(1);
%     elseif 20 <= i & i < 40
%         omega = Omega_p(2);
%     elseif 40 <= i & i <= 60
%         omega = Omega_p(3);
%     end    
    if 0 <= i & i < 10
        omega = Omega_p(1);
    elseif 10 <= i & i < 20
        omega = Omega_p(2);
    elseif 20 <= i & i <= 30
        omega = Omega_p(3);
    end      
    
    %omega = Omega_p(2);
    
    phi(1) = theta(1) - theta(2);
    phi(2) = theta(2) - theta(3);
    phi(3) = theta(3) - theta(4);
    phi(4) = theta(4) - theta(5);
    phi(5) = theta(5) - theta(6);
    
    psi(1) = -phi(1);
    psi(2) = phi(1) - phi(2);
    psi(3) = phi(2) - phi(3);
    psi(4) = phi(3) - phi(4);
    psi(5) = phi(4) - phi(5);
    psi(6) = phi(5);
    
    psi_o1 = -D;
    psi_o2 = [0,0,0];
    psi_o3 = [0,0,0];
    psi_o4 = [0,0,0];
    psi_o5 = [0,0,0];
    psi_o6 = D;
    
    d_theta(1) = omega + f_tilde(omega, Omega_p, psi(1), psi_o1, h, T, S, L);
    d_theta(2) = omega + f_tilde(omega, Omega_p, psi(2), psi_o2, h, T, S, L);
    d_theta(3) = omega + f_tilde(omega, Omega_p, psi(3), psi_o3, h, T, S, L);
    d_theta(4) = omega + f_tilde(omega, Omega_p, psi(4), psi_o4, h, T, S, L);
    d_theta(5) = omega + f_tilde(omega, Omega_p, psi(5), psi_o5, h, T, S, L);
    d_theta(6) = omega + f_tilde(omega, Omega_p, psi(6), psi_o6, h, T, S, L);
    
    %d_theta = d_theta;
    theta = theta + dt * d_theta;
    
    rec_theta = [rec_theta; theta];
    rec_phi = [rec_phi; phi];
    rec_psi = [rec_psi; psi];
    rec_omega = [rec_omega; omega];
end

figure(1);
plot(t',cos(rec_theta(:,1)),t',cos(rec_theta(:,2)),t',cos(rec_theta(:,3)),t',cos(rec_theta(:,4)),t',cos(rec_theta(:,5)),t',cos(rec_theta(:,6)))
xlabel('t[sec]');ylabel('cos{(\theta)}');
legend('\theta_1','\theta_2','\theta_3','\theta_4','\theta_5','\theta_6')
figure(2);
plot(t',rec_phi(:,1),t',rec_phi(:,2),t',rec_phi(:,3),t',rec_phi(:,4),t',rec_phi(:,5))
xlabel('t[sec]');ylabel('\phi[rad]');
legend('\phi_1','\phi_2','\phi_3','\phi_4','\phi_5','\phi_6')
figure(3);
plot(t',rec_omega)
xlabel('t[sec]');ylabel('\omega[rad/s]');
xlim([0,time]),ylim([0,6])
%legend('\phi_1','\phi_2','\phi_3','\phi_4','\phi_5','\phi_6')


