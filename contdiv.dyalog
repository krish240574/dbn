 z←li kcontdiv x
 ⍝ CD-n
 count←⊃li[1]
 cdn←⊃li[3] ⍝ number of iterations of the Gibb's chain
 l←⊃li[2] ⍝ layer number

 b←⊃x[3] ⍝ biases for layer l
 w←⊃x[2]
 lr←⊃x[4]
 v0←⊃x[1]
 nin←((-1)↑(⍴b))
 h0hat←⊃x[1] ⍝ initialize posterior of visible as input

 biash←((1,nin)⍴b[l;])  ⍝ 2 is for the hidden layer, layer 2
 h1hat←1÷(1+*-1×biash+v0+.×⍉w)

 ⍝ Repeat of h1hat calculation
 ⍝ h0 ← P(h|v0)
 ⍝h0←1÷(1+*-1×b+v0+.×⍉w) ⍝ change to Gaussian later

 ⍝ v1← P(v|h0)
 biasv←((1,nin)⍴b[l;])
 v1←1÷(1+*-1×biasv+h1hat+.×w) ⍝ change to Gaussian later

 ⍝ Update:
⍝ ⎕←'Updates are in the following format :'
⍝ ⎕←'1. Weights after CD1'
⍝ ⎕←'2. Biases of layer 1(visible layer)'
⍝ ⎕←'3. Values of visible layer after CD1
 :If count<cdn
     input←(v1)(w)(b)(lr)
     z←(1+count)(l)(cdn)kcontdiv input
 :EndIf
 w←w+lr×((h1hat+.×⍉v0)-(h1hat+.×⍉v1))
 b[l;]←b[l;]+lr×(h0hat-h1hat)
 b[l-1;]←b[l;]+lr×(v0-v1)
 :If l=2 ⍝ 1st layer(should be 1, but indexing in APL is from 1)
     updates←(h0hat)(w)(b)(lr) ⍝ return h0hat=first row of input
 :Else
     updates←(v1)(w)(b)(lr) ⍝ updates as nested array
 :EndIf
 z←updates
