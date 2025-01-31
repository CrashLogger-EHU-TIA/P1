function template_T1_E7
clear all;
clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EJERCICIO 7 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Cargar base de datos

load Auto.mat

fprintf('\n\n')
disp('%%%%%%%%%%%%%%%%% EJERCICIO 7 %%%%%%%%%%%%%%%%%');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
fprintf('\n\n')

% Apartado 1 - Remover valores perdidos
AutoClean = rmmissing(Auto);

% Apartado 2 - Identifica los predictores cuantitativos y los cualitativos
% fprintf('\n')
disp('%%%%%%%%%%%%%%%%% Apartado 2 %%%%%%%%%%%%%%%%%');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');

fprintf("Quantitative:\n");
fprintf("mpg, cylinders, displacement, horsepower, weight, acceleration, year")

fprintf("Qualitative:\n");
fprintf("origin, name")


% Apartado 3 - Calcular la media, desviación estándar y rango de cada uno 
% de los predictores cuantitativos
fprintf('\n')
disp('%%%%%%%%%%%%%%%%% Apartado 3 %%%%%%%%%%%%%%%%%');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');

allAvg = mean(AutoClean(:,1:6))
allStd = std(AutoClean(:,1:6))
allRange = range(AutoClean(:,1:6))

% Apartado 4 - Eliminar las observaciones en el rango $10-85$. 
% ¿Cuál es ahora el rango, media y desviación estándar de cada predictor?
fprintf('\n')
disp('%%%%%%%%%%%%%%%%% Apartado 4 %%%%%%%%%%%%%%%%%');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');

AutoCleanShort = [AutoClean(1:10, :);AutoClean(86:end, :)]

allAvg = mean(AutoCleanShort(:,1:6))
allStd = std(AutoCleanShort(:,1:6))
allRange = range(AutoCleanShort(:,1:6))

% Apartado 5 -  Usando toda la base de datos, analiza los predictores de 
% manera gráfica haciendo uso de la función \textit{scatter}. 
% Crea gráficos que resalten la relación entre predictores. 
% Resume los resultados obtenidos.
fprintf('\n')
disp('%%%%%%%%%%%%%%%%% Apartado 5 %%%%%%%%%%%%%%%%%');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');

% Estoy usando las unidades americanas porque así es como se nos entregan
% los datos.

figure(5);
subplot(2,3,1)
scatter(Auto.mpg, Auto.cylinders)
title("Efficiency vs Cylinder count")
xlabel("Efficiency [mpg]")
ylabel("Cylinder Amount")

subplot(2,3,2)
scatter(Auto.mpg, Auto.displacement, "cyan")
title("Efficiency vs Engine displacement")
xlabel("Efficiency [mpg]")
ylabel("Displacement [in³]")

subplot(2,3,3)
scatter(Auto.mpg, Auto.horsepower, "green")
title("Efficiency vs Horsepower")
xlabel("Efficiency [mpg]")
ylabel("Horsepower [bhp]")

subplot(2,3,4)
scatter(Auto.mpg, Auto.weight, 'MarkerEdgeColor', [0.9290 0.6940 0.1250])
title("Efficiency vs Vehicle Weight")
xlabel("Efficiency [mpg]")
ylabel("Weight [lbs]")

subplot(2,3,5)
scatter(Auto.mpg, Auto.acceleration, "magenta")
title("Efficiency vs Vehicle Acceleration")
xlabel("Efficiency [mpg]")
ylabel("Acceleration [s, (for 0-60mph)]")

subplot(2,3,6)
scatter(Auto.mpg, Auto.year, "red")
title("Efficiency vs Vehicle Age")
xlabel("Efficiency [mpg]")
ylabel("Release year")


% Apartado 6 -   Suponer que queremos predecir la autonom´ıa del coche dada 
% en millas por galón (mpg) en base a otros predicotres. ¿Alguno de los 
% gráficos obtenidos previamente sugieren que otras variables puedan ser de
% utilidad a la hora de predecir mpg?
fprintf('\n')

disp('%%%%%%%%%%%%%%%%% Apartado 6 %%%%%%%%%%%%%%%%%');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');

fprintf("El tamaño del motor es el principal indicador. Diferentes regiones del mundo utilizan motores diferentes. \n")
fprintf("Normativas, regulaciones y necesidades de las diferentes regiones regulan los motores.\n Japón es mas eficiente que Europa. Europa es mas eficiente que norteamérica.\n")

usaCars = any(Auto.origin == 1, 2)
euroCars = any(Auto.origin == 2, 2)
japCars = any(Auto.origin == 3, 2)

figure(6);
subplot(3,2,1)
histogram(Auto.mpg(usaCars), 0 : 2 : 50, FaceColor=[0 0.4470 0.7410]);
ylim([0 50])
title("North-American vehicles")
xlabel("Efficiency [mpg]");
ylabel("Vehicle amount")

subplot(3,2,3)
histogram(Auto.mpg(euroCars), 0 : 2 : 50, FaceColor=[0.8500 0.3250 0.0980]);
ylim([0 50])
title("European vehicles")
xlabel("Efficiency [mpg]");
ylabel("Vehicle amount")

subplot(3,2,5)
histogram(Auto.mpg(japCars), 0 : 2 : 50, FaceColor=[0.9290 0.6940 0.1250]);
ylim([0 50])
title("Japanese vehicles")
xlabel("Efficiency [mpg]");
ylabel("Vehicle amount")

subplot(1,2,2)
histogram(Auto.mpg(usaCars),  0 : 2 : 50);
hold on;
histogram(Auto.mpg(euroCars), 0 : 2 : 50);
histogram(Auto.mpg(japCars),  0 : 2 : 50);
hold off;
title("Global comparison")
legend({"NA", "EU", "JP"})
xlabel("Efficiency [mpg]");
ylabel("Vehicle amount")
