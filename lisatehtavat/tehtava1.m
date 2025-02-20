% Lisätehtävä 1
% Heidi Putkuri 2025
% Funktio kohinaisen kosinisignaalin muodostamiseen.
% Funktio saa syötearvoinaan parametrit (A, f, theta, pituus), ja se palauttaa muodostetun signaalin sekä asianmukaisen aikavektorin

function [x, t] = tehtava1(A, f, theta, pituus)
    % A = Amplitudi
    % f = Taajuus
    % theta = Vaihekulma
    % pituus = Signaalin pituus sekunteina
    close all;
    % näytteistystaajuus fs = 50*f, jossa fs = näytteiden määrä sekunnissa
    fs = 50*f;
    % aikaa-skel
    df = 1/fs;
    % aikavektori, joka alkaa nollasta ja päättyy pituuteen ottaen aikaskeleen huomioon
    t = 0:df:pituus;

    % Muutetaan vaihekulma asteista radiaaneiksi
    theta_rad = deg2rad(theta);
    % Muodostetaan kosinisignaali määritelmän mukaisesti cos(2*pi*f*t + theta)
    x = A*cos(2*pi*f*t + theta_rad);
    % Skaalataan kohina, niin että sen maksimiarvo on aina 10% kosinisiglaalin amplitudista
    % Esim jos kosinin A = 10 niin kohinan maksimiarvo on 0.1*10 = 1
    % jos kosinin A=5.6, niin kohinan max=0.56

    %luodaan kosinin kamssa samanmittainen kohina
    kohina = randn(size(t));
    # amplitudi (joka ilmeisesti myös A)
    x_abs_max = round(max(abs(x)));
    x_min = 0
    disp(['x_abs_max maksimiarvo (max(abs(x))): ', num2str(x_abs_max)]);
    disp(['Amplitudi: ', num2str(A)]);
    disp(['Kohinan maksimiarvo (kohina_max): ', num2str(max(kohina))]);
    disp(['Kohinan maksimiarvo pitäisi olla: ', num2str(x_abs_max*0.1)]);

    % kohinan skaalaus
    b = x_abs_max*0.1
    %a = -b
    %kohina_skaalattu = a + ((kohina-min(kohina))*(b-a)/max(kohina)-min(kohina))
    kohina_skaalattu = -b + ((kohina - min(kohina)) * (2 * b) / (max(kohina) - min(kohina)));
    disp(['Kohinan maksimiarvo skaalauksen jälkeen (): ', num2str(max(kohina_skaalattu))])

    kohinakosini = x + kohina

figure('Name','Kosini')
    subplot(3,1,1)
    plot(t,x,'r')
    title('Kosinisignaali')
    xlabel('Aika[s]')
    ylabel('Signaalin arvo')
    grid on

    %kohina
    subplot(3,1,2)
    plot(t,kohina_skaalattu,'g')
    title('Kohina')
    xlabel('Aika[s]')
    ylabel('Kohinan arvo')
    grid on

    %kohinakosini
    subplot(3,1,3)
    plot(t,kohinakosini,'b')
    title('Kohinakosini')
    xlabel('Aika[s]')
    ylabel('Kohinakosinin arvo')
    grid on

end