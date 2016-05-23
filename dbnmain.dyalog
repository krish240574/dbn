 z←dbnmain;layernum;nin;nout;a
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
 nin←3
 nout←3
 layernum←1
 x←(nin,nin)⍴1 ⍝ for now
 w←3 3⍴-2.80804935,-0.98573124,-1.84607092,-0.19229113,1.88018512,-2.17080185,-0.63218141,2.82216473,1.06585069
 numlayers←2
 b←(numlayers,nin)⍴0 ⍝ biases
 ⍝ call the glw(greedy layer-wise training) function here
 o←layernum glw gencreateinput ⍝ return updates from glw
