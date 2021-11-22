% Mina Alam - 500900005
% Rui Zhang - 500736315

%% Problem 1:
ay = lab7fun1a(-2);
disp(ay);
by = lab7fun1a(4);
disp(by);
% draw function curve between -1 and 8
fplot(@(x) lab7fun1a(x), [-4 8]);

%% Problem 2:
aR=RelHum(75,69);
disp(aR);
bR=RelHum(93,90);
disp(bR);

%% Problem 3:
adb = Bina(-5);
disp(adb);
bdb = Bina(1002);
disp(bdb);
cdb = Bina(200090);
disp(cdb);


%% Problem 4:
pa = ProbLottery(3,6,49);
disp(pa);
pb = ProbLottery(3,6,49);
Probability = zeros(7,1);
for k = 0:6
    Probability(k+1) = ProbLottery(k,6,49);
end
Number = [0:6]';
tpb = table(Number,Probability);
disp(tpb);



