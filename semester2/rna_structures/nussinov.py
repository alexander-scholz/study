'''
	Nussinov-Algorithmus
	O(n³)
'''


### Parameter ##
seq = "GGGAAAUCC"
threshold = 3
###


def F(a, b):
	a = a.upper()
	b = b.upper()
	pairMatrix = {
		'A': {'A': 0, 'C': 0, 'G': 0, 'U': 1},
		'C': {'A': 0, 'C': 0, 'G': 1, 'U': 0},
		'G': {'A': 0, 'C': 1, 'G': 0, 'U': 1},
		'U': {'A': 1, 'C': 0, 'G': 0, 'U': 0},
	}
	return pairMatrix[a][b]


def printMatrix(A):
	print()
	for i in A:
		print(i)
	print()


def init(seq, threshold):
	N = []
	for j in range(len(seq)):
		line = []
		for i in range(len(seq)):
			cell = ''
			for x in range(-1, threshold + 1):
				if i == j + x:
					cell = 0
			line.append(cell)
		N.append(line)
	return(N)


def dynamicProgramming(seq, N, threshold):
	for diagoOffset in range(threshold + 1, len(seq)):
		i = 0
		j = diagoOffset
		while j < len(seq):
			results = []
			results.append(N[i+1][j]) # Fall: ungepaart
			for k in range(i+1+threshold, j + 1):
				if F(seq[i], seq[k]) > 0:
					if(k + 1 < len(seq)):
						exprTwo = N[k+1][j]
					else:
						exprTwo = 0
					results.append(N[i+1][k-1] + exprTwo + F(seq[i], seq[k])) # Fälle (über k): gepaart
			N[i][j] = max(results)
			i = i+1
			j = j+1
	return(N)


def traceback(N):
	i = 0
	j = len(seq)-1
	while j > i:
		if N[i][j] == N[i+1][j]:
			print(str(i) + ": ·" + seq[i] + "·")
			i = i+1
		else:
			for k in range(i+1+threshold, j + 1):
				if(k + 1 < len(seq)):
					exprTwo = N[k+1][j]
				else:
					exprTwo = 0
				if N[i][j] == N[i+1][k-1] + exprTwo + F(seq[i], seq[k]):
					print(str(i) + ": " + seq[i] + " - " + seq[j] + " :" + str(j))
					i = i+1
					j = j-1


N = init(seq, threshold)
dynamicProgramming(seq, N, threshold)
printMatrix(N)
traceback(N)
