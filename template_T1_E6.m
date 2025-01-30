function template_T1_E6
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EJERCICIO 6 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Cargar base de datos

load College.mat

disp('%%%%%%%%%%%%%%%%% EJERCICIO 6 %%%%%%%%%%%%%%%%%');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
fprintf('\n\n')

% Apartado 1 - Calcular la media y desviación estándar de cada una de las 
% variables cuantitativas
disp('%%%%%%%%%%%%%%%%% Apartado 1 %%%%%%%%%%%%%%%%%');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');

meanVals = mean(College {:,3:end})
stdVals = std(College {:,3:end})

% Apartado 2 - Realizar el conteo de universidades públicas y privadas.
fprintf('\n')
disp('%%%%%%%%%%%%%%%%% Apartado 2 %%%%%%%%%%%%%%%%%');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');

PrivateUniAmount = sum(strcmp("Yes", College.Private))
PublicUniAmount = sum(strcmp("No", College.Private))

% Apartado 3 - Producir los siguientes diagramas de dispersión.
fprintf('\n')
disp('%%%%%%%%%%%%%%%%% Apartado 3 %%%%%%%%%%%%%%%%%');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');

figure(3);
subplot(2,3,1);
scatter(College.Apps, College.Accept,'blue')
title("Apps vs Accept")
xlabel("Received Applications")
ylabel("Accepted Applicants")
subplot(2,3,2);
scatter(College.Enroll, College.F_Undergrad,'cyan')
title("Enroll vs F-Undergrad")
xlabel("Enrolled students")
ylabel("Full Time Undergrad")
subplot(2,3,3);
scatter(College.Room_Board, College.Outstate,'green')
title("Room vs Out of state")
xlabel("Accomodation Cost")
ylabel("Out of state students")
subplot(2,3,4);
scatter(College.PhD, College.Expend, 'yellow')
title("PhD vs Expend")
xlabel("PhD proffessor percentage")
ylabel("Expenditure per student")
subplot(2,3,5);
scatter(College.S_F_Ratio, College.Expend, 'magenta')
title("S-F-Ratio vs Expend")
xlabel("Student-Faculty Ratio")
ylabel("Expenditure per student")
subplot(2,3,6);
scatter(College.perc_alumni, College.Expend, 'red')
title("Perc-Alumni vs Expend")
xlabel("Alumni donation percentage")
ylabel("Expenditure per student")

% Apartado 4 - Binarizar variable y boxplot
fprintf('\n')
disp('%%%%%%%%%%%%%%%%% Apartado 4 %%%%%%%%%%%%%%%%%');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
% Crear una variable cualitativa Elite binarizando la variable Top10perc. 
% Si la proporción de estudiantes que estuvieron entre el mejor 10\% de su 
% clase en bachiller es superior al 50\% Elite será igual a 'Yes' de lo 
% contrario, será igual a 'No'. 

Elite = any(College.Top10perc > 50, 2)

% Calcula el número de universidades de élite

EliteAmount = sum(Elite)

% Boxplot de la variable Outstate en función de la variable Elite

figure(4)
boxplot(College.Outstate, Elite, 'Labels',{'Not Elite', 'Elite'})
ylabel("Students")

% Apartado 5 - Histogramas
fprintf('\n')
disp('%%%%%%%%%%%%%%%%% Apartado 5 %%%%%%%%%%%%%%%%%');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');

figure(5)

subplot(2,3,1)
h1 = histogram(College.Top10perc(~Elite, :), 20);
hold on
h2 = histogram(College.Top10perc(Elite, :), 20);
hold off
legend("Non-elite", "Elite")
xlabel("Top10 student percentage")
ylabel("Universities with that amount")

subplot(2,3,2)
h1 = histogram(College.Top25perc(~Elite, :), 0 : 3 : 100);
hold on
h2 = histogram(College.Top25perc(Elite, :), 0 : 3 : 100);
hold off
legend("Non-elite", "Elite")
xlabel("Top25 student percentage")
ylabel("Universities with that amount")

subplot(2,3,3)
h1 = histogram(College.PhD(~Elite, :), 0 : 3 : 100);
hold on
h2 = histogram(College.PhD(Elite, :), 0 : 3 : 100);
hold off
legend("Non-elite", "Elite")
xlabel("PhD proffessor percentage")
ylabel("Universities with that amount")

subplot(2,3,4)
h1 = histogram(College.Terminal(~Elite, :), 0 : 3 : 100);
hold on
h2 = histogram(College.Terminal(Elite, :), 0 : 3 : 100);
hold off
legend("Non-elite", "Elite")
xlabel("Terminal rank proffessor percentage")
ylabel("Universities with that amount")

subplot(2,3,5)
h1 = histogram(College.Room_Board(~Elite, :), min(College.Room_Board) : 200 : max(College.Room_Board));
hold on
h2 = histogram(College.Room_Board(Elite, :), min(College.Room_Board) : 200 : max(College.Room_Board));
hold off
legend("Non-elite", "Elite")
xlabel("Accomodation cost")
ylabel("Universities with that amount")

subplot(2,3,6)
h1 = histogram(College.Terminal(~Elite, :), 0 : 3 : 100);
hold on
h2 = histogram(College.Terminal(Elite, :), 0 : 3 : 100);
hold off
legend("Non-elite", "Elite")
xlabel("Out-of-state student percentage")
ylabel("Universities with that amount")