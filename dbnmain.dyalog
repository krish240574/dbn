 z←greedy;count;layernum;nin;nout;a;nr;nc;isz;mnist;numlayers;mnistmat;firstimg;input
 ⍝ greedy layer-wise pre-training for a DBN
 ⍝ Training set D = {Xt}(t=1..T)
 ⍝ pre-training learning rate epsilonp
 ⍝ nin = number of units in layer (i-1)
 ⍝ nout = number of units in layer i
 ⍝ initialize weights a = 6÷(nin + nout)
 ⍝ wi(jk) - U(-4×0.5*a, 4×0.5*a)
 ⍝ hhatx = posterior of x
 ⍝ hi = output from layer i
 ⍝ o is the output of the whole network
 ⍝ b = bias for each layer
 ⍝ sigm = sigmoid activation function
 ⍝ Bengio(2012) - http://arxiv.org/pdf/1206.5533v2.pdf
 ⍝ for MNist data
 ⎕←'Reading CSV file, few seconds...'
 mnist←DealWithCsv'd:\datasets\mnist\mnist_train_small.csv'
 nr←(1↑⍴mnist)
 nc←((-1)↑⍴mnist)
 nin←nr
 nout←nin
 isz←28

 numlayers←5 ⍝
 mnistmat←(nr,isz,isz)⍴mnist[(⍳nr);1+⍳((-1)+nc)]

 ⍝ sending one row now, can send whole 28X28 as a minibatch
 firstimg←mnistmat[1;1;]
 input←gencreateinput firstimg

 ⍝ input←(xt or batch)(w)((numlayers,nin)⍴b)(lr)(nin)

 count←1 ⍝ layer number
 updates←count glw input  ⍝ this will glw the DBN
