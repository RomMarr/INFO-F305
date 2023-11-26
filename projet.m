# Equation modèle 1, évolution de la temperature moyenne de la terre sur dix milles ans en faisant varier alpha (albédo de la planète)
function simul_albedo(condition_initiale, albedo_range)
    # Paramètres
    R = 2.912;
    Q = 342;
    sigma = (5.67) * (10^-8);
    temps_simulation = [0, 10^4];

    hold on; # Pour ne pas effacer le graphique à chaque nouvelle appel du plot
    for albedo = albedo_range
        xdot = @(t, T) (Q * (1 - albedo) - (sigma * T.^4)) / R; # Définition système
        [t, T] = ode45(xdot, temps_simulation, condition_initiale); # Résolution système
        plot(t, T, 'DisplayName', sprintf('Albedo = %.1f', albedo));
    end

    hold off; # Libère la fonction plot
    legend('show');
    xlabel('Temps');
    ylabel('Temperature (Kelvin)');
    title('Temperature en fonction du temps, selon la valeur albdeo');
end

condition_initiale = 0;
albedo_range = 0:0.1:1; # Les valeurs de l'albedo parcourt l'intervalle de 0 à 1 par saut de 0.1
simul_albedo(condition_initiale, albedo_range)



# Equation modèle 2 permet la création d'un graphique représentant l'évolution de la temperature moyenne de la terre sur dix ans.
function simul_e(condition_initiale, epsilon_range)
    # Paramètres
    R = 2.912;
    Q = 342;
    sigma = (5.67) * (10^-8);
    temps_simulation = [0, 10];
    albedo = 0.3;
    
    hold on; # Pour ne pas effacer le graphique à chaque nouvelle appel du plot
    for epsilon = epsilon_range
        xdot = @(t, T) (Q * (1 - albedo) - (epsilon*sigma * T.^4)) / R; # Définition système, la seule chose qui change est l'ajout du facteur d'emmisivité
        [t, T] = ode45(xdot, temps_simulation, condition_initiale); # Résolution système
        plot(t, T, 'DisplayName', sprintf('Emissivité = %.1f', e));
    end

    hold off; # Libère la fonction plot
    legend('show');
    xlabel('Temps');
    ylabel('Temperature (Kelvin)');
    title('Temperature en fonction du temps, selon la valeur de l émissivité');
end

condition_initiale = 0;
epsilon_range = 0:0.1:1; # Les valeurs de epsilon parcourent intervalle de 0 à 1 par saut de 0.1
simul_e(condition_initiale, epsilon_range)



# Equation modèle 3 permet la création d'un graphique représentant l'évolution de la température moyenne de la terre sur dix ans.
# Cette fonction ne dépend de la temperature que de façon linéaire et plus de façon quadratique comme le modèle 2.
function fonctionLineaire (condition_initiale)
    # Paramètres
    A = 202;
    B = 1.9;
    albedo = 0.3;
    temps_simulation = [0, 10];
    Q = 342;
    R = 2.912;
    
    xdot = @(t, T) ((Q*(1-albedo))-(A+(B*T)))/R; # Définition système
    [t,T] = ode45(xdot, temps_simulation, condition_initiale); # Résolution système
    plot(t,T)
    xlabel('Temps');
    ylabel('Temperature (Celcius)');
    title('Temperature en fonction du temps, avec une fonction linéaire');
endfunction
condition_initiale = -273.15; # -273.15 C° équivaut au 0 K. 
fonctionLineaire (condition_initiale)



# Equation Modèle 4 permet la création d'un graphique représentant l'évolution de la température moyenne de la terre sur cents ans.
# Ici albédo est donc une fonction dépendante de la température de la terre.
function albedoFonctionT (conditionInitiale)
    # Paramètres
    A = 202;
    B = 1.9;
    tempsSimulation = [0, 100];
    Q = 342;
    R = 2.912;
    
    xdot = @(t, T) (Q*(1-(0.5+ 0.2*tanh(0.1*(265- T - 273.5))))-(A+(B*T)))/R; # Définition système
    [t,T] = ode45(xdot, tempsSimulation, conditionInitiale); # Résolution système
    plot(t,T)
    xlabel('Temps');
    ylabel('Temperature (Celcius)');
    title('Temperature en fonction du temps, avec un albédo dépandant de la température');
endfunction
conditionInitiale = 14.84;
albedoFonctionT (conditionInitiale)
