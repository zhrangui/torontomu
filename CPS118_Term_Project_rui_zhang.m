%% 1: Calculate the yearly average temperature
datatable = getdata('glsea-temps2020_1024.dat.txt');
eachaverage = mean(datatable{:, 3:end});
totalaverage = mean(datatable{:, 3:end}, 'all');

%% 2: Indicate which lake is the coldest and which one is the warmest
lakes = ["Sup","Mich","Huron","Erie","Ont","St.Clr"];
minaverage = min(eachaverage);
maxaverage = max(eachaverage);
minlake = lakes(eachaverage==minaverage);
maxlake = lakes(eachaverage==maxaverage);
abovelakes = lakes(eachaverage > totalaverage);
belowlakes = lakes(eachaverage < totalaverage);

%% 3: Indicate the day and the temperature for the warmest water temperatures 
warmests = max(datatable{:, 3:end});
coldests = min(datatable{:, 3:end});
% Find warmest date
Suparwmest = datatable{datatable{:,3}==warmests(1),[1 2 3]};
Michwarmest = datatable{datatable{:,4}==warmests(2),[1 2 4]};
HuronWarmest = datatable{datatable{:,5}==warmests(3),[1 2 5]};
Eriewarmest = datatable{datatable{:,6}==warmests(4),[1 2 6]};
Ontwarmest = datatable{datatable{:,7}==warmests(5),[1 2 7]};
StClrwarmest = datatable{datatable{:,8}==warmests(6),[1 2 8]};
% Find coolest date
Supcoolest = datatable{datatable{:,3}==coldests(1),[1 2 3]};
Michcoolest = datatable{datatable{:,4}==coldests(2),[1 2 4]};
Huroncoolest = datatable{datatable{:,5}==coldests(3),[1 2 5]};
Eriecoolest = datatable{datatable{:,6}==coldests(4),[1 2 6]};
Ontcoolest = datatable{datatable{:,7}==coldests(5),[1 2 7]};
StClrcoolest = datatable{datatable{:,8}==coldests(6),[1 2 8]};

%% 4: Indicate the day, lake and temperature of the warmest water temperature and the coldest temperature
maxall = max(datatable{:,3:end}, [], 'all');
[maxrow maxcolumn] = find(datatable{:,3:end}==maxall);
warmestdays = datatable{maxrow,1:2};
minall = min(datatable{:,3:end}, [], 'all');
[minrow mincolumn] = find(datatable{:,3:end}==minall);
coolestdays = datatable{minrow,1:2};

%% 5:
average = mean(datatable{:, 3:8}, 2);
plot(datatable{:, 2}, average);
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
plot(datatable{:, 2}, datatable{:, 3}, ...
    datatable{:, 2}, datatable{:, 4}, ...
    datatable{:, 2}, datatable{:, 5}, ...
    datatable{:, 2}, datatable{:, 6}, ...
    datatable{:, 2}, datatable{:, 7}, ...
    datatable{:, 2}, datatable{:, 8});
legend('trend');
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

%% 12:
%% 13:

% funtion to read file data
function data = getdata(filename)
fid = fopen(filename) ;
% skip 10 lines head lines
data = textscan(fid,'%d %d %f %f %f %f %f %f','HeaderLines',10) ;
fclose(fid);
% Extract data into table, each culumn responds to data of each lake
data = table(data{:}, 'VariableNames', {'year','day','Sup','Mich','Huron','Erie','Ont','St.Clr'});
end