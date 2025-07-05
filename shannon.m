close all;
clear all;
a=xlsread('emddecomp.xlsx');
f1 = DistEn(a(:,1));
f2 = SpecEn(a(:,1));
f3 = DispEn(a(:,1));
f4 = SyDyEn(a(:,1));
f5 = IncrEn(a(:,1));
f6 = CoSiEn(a(:,1));
f7 = PhasEn(a(:,1));
f8 = BubbEn(a(:,1));
f9 = GridEn(a(:,1));
f10 = EnofEn(a(:,1));
f11 = AttnEn(a(:,1));
f12 = SlopEn(a(:,1));
feat = [f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12]
function H = shannon_entropy(signal)
[counts,~] = histcounts(signal, 256, 'Normalization','probability');
counts(counts==0) = [];
H = -sum(counts .* log2(counts));
end

function H = DistEn(signal, m)
N = length(signal);
X = buffer(signal, m, m-1, 'nodelay')';
X = X(1:N-m+1,:);
d = pdist(X);
[counts,~] = histcounts(d, 'Normalization', 'probability');
counts(counts==0) = [];
H = -sum(counts .* log(counts));
end

function H = SpecEn(signal,m)
[Pxx,~] = periodogram(signal);
Pxx = Pxx / sum(Pxx);
Pxx(Pxx==0) = [];
H = -sum(Pxx .* log2(Pxx));
end

function H = DispEn(signal, m)
y = (signal - min(signal)) / (max(signal) - min(signal) + eps);
yq = floor(c * y);
yq(yq == c) = c - 1;
N = length(yq);
patterns = zeros(N - (m-1)*tau, m);
for i = 1:size(patterns,1)
    patterns(i,:) = yq(i:tau:i+(m-1)*tau);
end
base = c.^(0:m-1);
idx = patterns * base';
[counts,~] = histcounts(idx, 0:c^m, 'Normalization','probability');
counts(counts==0) = [];
H = -sum(counts .* log(counts));
end

function H = SyDyEn(signal, c)
symbolic = floor(c * (signal - min(signal)) / (max(signal) - min(signal) + eps));
[counts,~] = histcounts(symbolic, c, 'Normalization', 'probability');
counts(counts==0) = [];
H = -sum(counts .* log2(counts));
end

function H = IncrEn(signal,m)
diff_signal = diff(signal);
H = shannon_entropy(diff_signal);
end

function H = CoSiEn(signal, m)
N = length(signal);
X = buffer(signal, m, m-1, 'nodelay')';
sims = [];
for i = 1:size(X,1)-1
    for j = i+1:size(X,1)
        sims(end+1) = dot(X(i,:), X(j,:)) / (norm(X(i,:)) * norm(X(j,:)) + eps);
    end
end
[counts,~] = histcounts(sims, 20, 'Normalization','probability');
counts(counts==0) = [];
H = -sum(counts .* log2(counts));
end

function H = PhasEn(signal)
hilb = hilbert(signal);
phases = angle(hilb);
[counts,~] = histcounts(phases, 50, 'Normalization','probability');
counts(counts==0) = [];
H = -sum(counts .* log2(counts));
end

function H = SlopEn(signal,m)
slope = diff(signal);
symbols = sign(slope);
symbols(symbols == 0) = 2;
symbols(symbols == -1) = 1;
symbols(symbols == 1) = 3;
[counts,~] = histcounts(symbols, 1:4, 'Normalization','probability');
counts(counts==0) = [];
H = -sum(counts .* log2(counts));
end

function count = BubbEn(arr)
count = 0;
a = arr;
for i = 1:length(a)
    for j = 1:length(a)-i
        if a(j) > a(j+1)
            temp = a(j);
            a(j) = a(j+1);
            a(j+1) = temp;
            count = count + 1;
        end
    end
end
end

function H = BubbEn(signal, m)
N = length(signal);
counts_vec = zeros(1, N-m+1);
for i = 1:N-m+1
    counts_vec(i) = bubble_sort_count(signal(i:i+m-1));
end
[counts,~] = histcounts(counts_vec, 'Normalization','probability');
counts(counts==0) = [];
H = -sum(counts .* log2(counts));
end

function H = GridEn(signal, grids)
edges = linspace(min(signal), max(signal), grids+1);
[counts,~] = histcounts(signal, edges, 'Normalization','probability');
counts(counts==0) = [];
H = -sum(counts .* log2(counts));
end

function H = EnofEn(signal, win)
N = length(signal);
num_windows = floor(N / win);
entropies = zeros(1, num_windows);
for i = 1:num_windows
    seg = signal((i-1)*win + 1:i*win);
    entropies(i) = shannon_entropy(seg);
end
H = shannon_entropy(entropies);
end

function H = AttEn(signal, win)
N = length(signal);
num_windows = floor(N / win);
entropies = zeros(1, num_windows);
vars = zeros(1, num_windows);
for i = 1:num_windows
    seg = signal((i-1)*win + 1:i*win);
    entropies(i) = shannon_entropy(seg);
    vars(i) = var(seg);
end
weights = vars / sum(vars + eps);
weights(weights==0) = [];
H = -sum(weights .* log2(weights));
end
