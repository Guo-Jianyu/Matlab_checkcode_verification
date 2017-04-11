clear;
clc;

fprintf('\n��ѵ�������������һ����֤�룬�밴��Enter������\n');
pause();
path = './TrainingSet/11.jpg';
im=imread(path);
imshow(im)
set (gcf,'Position',[200,300,600,300]);

fprintf('\n����֤������˲����밴��Enter������\n');
pause();
im = im(1:20, :);
% new = wiener2(im);
% new = myfliter(im);
% imshow(new);
gausFilter = fspecial('gaussian',[5 5],0.53);
new=imfilter(im,gausFilter,'replicate');
imshow(new)
set (gcf,'Position',[200,300,600,300]);

fprintf('\n��ͼƬ���ж�ֵ�����밴��Enter������\n');
pause();
BW =im2bw(new, 0.4); 
imshow(BW);
set (gcf,'Position',[200,300,600,300]);

fprintf('\n��ͼƬ�����и�밴��Enter������\n');
pause();
s1 = BW(:, 5:17);
s2 = BW(:, 18:30);
s3 = BW(:, 31:43);
s4 = BW(:, 44:56);
subplot(1, 4, 1)
imshow(s1);
subplot(1, 4, 2)
imshow(s2);
subplot(1, 4, 3)
imshow(s3);
subplot(1, 4, 4)
imshow(s4);

fprintf('\n��ÿһС����ƽ��һ�У�Ȼ��4���ֹ���һ��4�еľ���,��������ݵ�Ԥ�����밴��Enter������\n');
pause();
[p1, p2 ,p3, p4] = jpg_split(BW);
x = [p1; p2; p3; p4];

fprintf('\n����ѵ������������ѵ��ģ�ͣ��밴��Enter������\n');
pause();
NN();

fprintf('\n����ѵ���õ�ģ�ͣ�����ʶ���밴��Enter������\n');
pause();
load THETA;
word = '0123456789abcdefghijklmnopqrstuvwxyz';

fprintf('\n����Ԥ�⣬�밴��Enter������\n');
pause();
y = predict(Theta1, Theta2, Theta3, x);
y = word(y');
fprintf('Ԥ����Ϊ: %s \n', y);
subplot(1, 4, 1)
imshow(s1);
title(['Ԥ����Ϊ', y(1)]);
subplot(1, 4, 2)
imshow(s2);
title(['Ԥ����Ϊ', y(2)]);
subplot(1, 4, 3)
imshow(s3);
title(['Ԥ����Ϊ', y(3)]);
subplot(1, 4, 4)
imshow(s4);
title(['Ԥ����Ϊ', y(4)]);

