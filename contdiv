 z←l contdiv x;b;w;lr;v0;v1;h0hat;h1hat;bias;h0;h1;nin;biash;biasv
 ⍝ CD-1
 ⍝ start with a training unit vector v0
 ⍝ of visible units
 ⍝ weights are passed to this function - initialized
 ⍝ w←3 3⍴-2.80804935,-0.98573124,-1.84607092,-0.19229113,1.88018512,-2.17080185,-0.63218141,2.82216473,1.06585069
 ⍝ w is the matrix of weights between a layer j and the layer
 ⍝ k=j+1  (wjk)
 ⍝ initialize biases to 0
 ⍝ l is layer number
 ⍝ b←(1,numneu)⍴0  initialized and passed here

 b←⊃x[3] ⍝ biases for layer l

 w←⊃x[2]
 lr←⊃x[4]

 v0←⊃x[1]
 nin←((-1)↑(⍴b))
 h0hat←⊃x[1] ⍝ initialize posterior of visible as input

 biash←((1,nin)⍴b[2;])  ⍝ 2 is for the hidden layer, layer 2
 h1hat←1÷(1+*-1×biash+v0+.×⍉w)

 ⍝ Repeat of h1hat calculation
 ⍝ h0 ← P(h|v0)
 ⍝h0←1÷(1+*-1×b+v0+.×⍉w) ⍝ change to Gaussian later

 ⍝ v1← P(v|h0)
 biasv←((1,nin)⍴b[1;])
 v1←1÷(1+*-1×biasv+h1hat+.×w) ⍝ change to Gaussian later

 ⍝ Update:

⍝ ⎕←'Updates are in the following format :'
⍝ ⎕←'1. Weights after CD1'
⍝ ⎕←'2. Biases of layer 1(visible layer)'
⍝ ⎕←'3. Values of visible layer after CD1
 w←w+lr×((h1hat+.×⍉v0)-(h1hat+.×⍉v1))
 b[l;]←b[l;]+lr×(h0hat-h1hat)
 b[l-1;]←b[l;]+lr×(v0-v1)
 z←(w)(b)(v1) ⍝ updates as nested array
