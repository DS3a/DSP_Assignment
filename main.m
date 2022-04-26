clear;
clc;
[yes1, Fs] = audioread('./Audio_clips/yes1.wav');
[yes2, Fs] = audioread('./Audio_clips/yes2.wav');
[yes3, Fs] = audioread('./Audio_clips/yes3.wav');
[yes4, Fs] = audioread('./Audio_clips/yes4.wav'); % validation
[yes5, Fs] = audioread('./Audio_clips/yes5.wav'); % validation

[no1, Fs] = audioread('./Audio_clips/no1.wav');
[no2, Fs] = audioread('./Audio_clips/no2.wav');
[no3, Fs] = audioread('./Audio_clips/no3.wav');
[no4, Fs] = audioread('./Audio_clips/no4.wav'); % validation
[no5, Fs] = audioread('./Audio_clips/no5.wav'); % validation

%%%%% Using yes 4, 5, and no 4, 5 to test
% 40% of the data for validation

yes1 = remove_noise(yes1);
yes2 = remove_noise(yes2);
yes3 = remove_noise(yes3);
yes4 = remove_noise(yes4);
yes5 = remove_noise(yes5);

no1 = remove_noise(no1);
no2 = remove_noise(no2);
no3 = remove_noise(no3);
no4 = remove_noise(no4);
no5 = remove_noise(no5);


no = xcorr(no4, no1);
yes = xcorr(no4, yes1);

subplot(2, 1, 1);
stem(no);
ylim([0 1000])
title('correlation of no4 with no1 signal');


subplot(2, 1, 2)
stem(yes);
ylim([0 1000])
title('correlation of no4 with yes1 signal')


disp("Average amplitude of correlation of no4 with no1 : ")
disp(abs(mean(no)));

disp("Average amplitude of correlation of no4 with yes1 : ")
disp(abs(mean(yes)));

disp("\n\nAverage amplitude of correlation of no4 with no2 : ")
disp(abs(mean(xcorr(no4, no2))));

disp("Average amplitude of correlation of no4 with yes2 : ")
disp(abs(mean(xcorr(no4, yes2))));


disp("\n\nAverage amplitude of correlation of no4 with no3 : ")
disp(abs(mean(xcorr(no4, no3))));

disp("Average amplitude of correlation of no4 with yes3 : ")
disp(abs(mean(xcorr(no4, yes3))));






disp("\n\n\n\nAverage amplitude of correlation of yes4 with no1 : ")
disp(abs(mean(xcorr(yes2, no1))));

disp("Average amplitude of correlation of yes4 with yes1 : ")
disp(abs(mean(xcorr(yes2, yes1))));

disp("\n\nAverage amplitude of correlation of yes4 with no2 : ")
disp(abs(mean(xcorr(yes2, no2))));

disp("Average amplitude of correlation of yes4 with yes2 : ")
disp(abs(mean(xcorr(yes2, yes2))));


disp("\n\nAverage amplitude of correlation of yes4 with no3 : ")
disp(abs(mean(xcorr(yes2, no3))));

disp("Average amplitude of correlation of yes4 with yes3 : ")
disp(abs(mean(xcorr(yes2, yes3))));

%disp("As you can see, the averrage amplitude of similar signals when correlated is higher");
%disp("We can use this to check whether the user has responded yes or no");