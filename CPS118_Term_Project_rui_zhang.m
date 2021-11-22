
%% Global settting


%% 1: Calculate the yearly average temperature
datatable = getdata('glsea-temps2020_1024.dat');
lakes = ["Superior","Michigan","Huron","Erie","Ontario","St.Clair"];
eachaverage = mean(datatable{:, 3:end});
eachaveragetable = table("lake", eachaverage(1),eachaverage(2),eachaverage(3), eachaverage(4), ...
    eachaverage(5),eachaverage(6), 'VariableNames', cellstr(['average temperature' lakes]));
disp(eachaveragetable);
totalaverage = mean(datatable{:, 3:end}, 'all');
fprintf('Total yearly average: %.4f', totalaverage);

%% 2: Indicate which lake is the coldest and which one is the warmest
[minaverage, minaverageind] = min(eachaverage);
[maxaverage, maxaverageind] = max(eachaverage);
fprintf('Coldest lake: %s\n', lakes(minaverageind));
fprintf('Warmestest lake: %s\n', lakes(maxaverageind));
abovelakes = lakes(eachaverage > totalaverage);
belowlakes = lakes(eachaverage < totalaverage);
fprintf('Lakes above the average:');
fprintf(' %s', abovelakes);
fprintf('\nLakes below the average:');
fprintf(' %s', belowlakes);
fprintf('\n');

%% 3: Indicate the day and the temperature for the warmest water
% andcoldest temperatures temperatures 
warmests = max(datatable{:, 3:end});
coldests = min(datatable{:, 3:end});
% Find warmest dates
lakewarmests=cell(1,6);
lakewarmests{1} = datatable{datatable{:,3}==warmests(1),[1 2]};
lakewarmests{2} = datatable{datatable{:,4}==warmests(2),[1 2]};
lakewarmests{3} = datatable{datatable{:,5}==warmests(3),[1 2]};
lakewarmests{4} = datatable{datatable{:,6}==warmests(4),[1 2]};
lakewarmests{5} = datatable{datatable{:,7}==warmests(5),[1 2]};
lakewarmests{6} = datatable{datatable{:,8}==warmests(6),[1 2]};
for k=1:length(lakes)
    fprintf('The warmest water temperature of %s lake: %.2f\n', lakes(k), warmests(k));
    disp(lakewarmests{k});
end

% Find coolest dates
lakecoolests=cell(1,6);
lakecoolests{1} = datatable{datatable{:,3}==coldests(1),[1 2]};
lakecoolests{2} = datatable{datatable{:,4}==coldests(2),[1 2]};
lakecoolests{3} = datatable{datatable{:,5}==coldests(3),[1 2]};
lakecoolests{4} = datatable{datatable{:,6}==coldests(4),[1 2]};
lakecoolests{5} = datatable{datatable{:,7}==coldests(5),[1 2]};
lakecoolests{6} = datatable{datatable{:,8}==coldests(6),[1, 2]};
for k=1:length(lakes)
    fprintf('The coolest water temperature of %s lake: %.2f\n', lakes(k), coldests(k));
    disp(lakecoolests{k});
end

%% 4: Indicate the day, lake and temperature of the warmest water temperature and the coldest temperature
warmestall = max(datatable{:,3:end}, [], 'all');
[warnestrow warmestcolumn] = find(datatable{:,3:end}==warmestall);
warmestdays = datatable{warnestrow,1:2};
fprintf('The warmest water temperature: %.2f\n', warmestall);
disp(warmestdays);
coolestall = min(datatable{:,3:end}, [], 'all');
[coolestrow coolestcolumn] = find(datatable{:,3:end}==coolestall);
coolestdays = datatable{coolestrow,1:2};
fprintf('The coolest water temperature: %.2f\n', coolestall);
disp(coolestdays);

%% 5:
average = mean(datatable{:, 3:8}, 2);
plot(datatable{:, 2}, average);
title("Daily average temperature for 6 lakes");
xlabel('day');
ylabel('temp');
subplot(2,3,1);
plot(datatable{:, 2}, datatable{:, 3});
title(lakes(1));
xlabel('day');
ylabel('temp');
subplot(2,3,2);
plot(datatable{:, 2}, datatable{:, 4});
title(lakes(2));
xlabel('day');
ylabel('temp');
subplot(2,3,3);
plot(datatable{:, 2}, datatable{:, 5});
title(lakes(3));
xlabel('day');
ylabel('temp');
subplot(2,3,4);
plot(datatable{:, 2}, datatable{:, 6});
title(lakes(4));
xlabel('day');
ylabel('temp');
subplot(2,3,5);
plot(datatable{:, 2}, datatable{:, 7});
title(lakes(5));
xlabel('day');
ylabel('temp');
subplot(2,3,6);
plot(datatable{:, 2}, datatable{:, 8});
title(lakes(6));
xlabel('day');
ylabel('temp');

%% 6:  Make a single graph of the temperatures (x=day, y=temp) that shows all 6 lines on one graph
plot(datatable{:, 2}, datatable{:, 3}, '--r',...
    datatable{:, 2}, datatable{:, 4}, '-g',...
    datatable{:, 2}, datatable{:, 5}, '+b',...
    datatable{:, 2}, datatable{:, 6}, '.c',...
    datatable{:, 2}, datatable{:, 7}, '-.m',...
    datatable{:, 2}, datatable{:, 8}, ':y');
legend(lakes);
xlabel('day');
ylabel('temp');

%% 7:
summeraverage = mean(datatable{1:265, 3:end});
[summeraveragedesced,summerindex] = sort(summeraverage,'descend');
disp(lakes(summerindex));
[eachaveragedesced,index] = sort(eachaverage,'descend');
disp(lakes(index));

%% 8:
days=(172:265);
plot(datatable{days, 2}, datatable{days, 3}, ...
    datatable{days, 2}, datatable{days, 4}, ...
    datatable{days, 2}, datatable{days, 5}, ...
    datatable{days, 2}, datatable{days, 6}, ...
    datatable{days, 2}, datatable{days, 7}, ...
    datatable{days, 2}, datatable{days, 8});
legend('trend');
xlabel('day');
ylabel('temp')

%% 9:
winteraverage = mean(datatable{[1:79,355:365] , 3:end});
[winteraveragedesced,winterindex] = sort(winteraverage,'descend');
disp(lakes(winterindex));
[eachaveragedesced,index] = sort(eachaverage,'descend');
disp(lakes(index));

%% 10:
days=[1:79 355:365];
plot(datatable{days, 2}, datatable{days, 3}, ...
    datatable{days, 2}, datatable{days, 4}, ...
    datatable{days, 2}, datatable{days, 5}, ...
    datatable{days, 2}, datatable{days, 6}, ...
    datatable{days, 2}, datatable{days, 7}, ...
    datatable{days, 2}, datatable{days, 8});
legend('trend');
xlabel('day');
ylabel('temp')

%% 11:
above20index= (datatable{:, 3:end} > 20);
above20days=sum(above20index);
percentagedays = round(100 * above20days ./ sum(above20days));
lakelabels = lakes + " " + percentagedays + "%";
pie(above20days, 1:6, lakelabels);

%% 12:
below0index= (datatable{:, 3:end} > 20);
below0days=sum(below0index);
below0alldays=sum(below0index, "all");

%% 13:
datatable2019 = getdata('glsea-temps2019_1024.dat');
eachaverage2019 = mean(datatable2019{:, 3:end});
years = ["2019-2024"; "2020-2024"];
average2019_2020 = [eachaverage2019; eachaverage];
lakecells = num2cell(average2019_2020,1);
Superior=average2019_2020(:,1);
Michigan=average2019_2020(:,2);
Huron=average2019_2020(:,3);
Erie=average2019_2020(:,4);
Ontario=average2019_2020(:,5);
St.Clair=average2019_2020(:,6);
laketable = table(years, Superior, Michigan, Huron, Erie, Ontario, St.Clair, ...
    'VariableNames', cellstr(["Year" lakes]));
disp(laketable);

%% subfuntion to read file data
function data = getdata(filename)
fid = fopen(filename) ;
% skip 10 lines head lines
data = textscan(fid,'%d %d %f %f %f %f %f %f','HeaderLines',10) ;
fclose(fid);
% Extract data into table, each culumn responds to data of each lake
data = table(data{:}, 'VariableNames', {'Year','Day','Sup','Mich','Huron','Erie','Ont','StClr'});
end